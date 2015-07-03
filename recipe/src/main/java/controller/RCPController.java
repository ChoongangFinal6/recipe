package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Material;
import model.Recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.RecipeService;
import fileupload.FileUpload;

@Controller
public class RCPController {
	@Autowired
	RecipeService rs;
	
	@RequestMapping(value="rcpWrite", method = RequestMethod.GET)
	public String rcpWrite() {		
		return "rcpWrite";		
	}
	
	@RequestMapping(value="material", method=RequestMethod.GET)
	public String material(HttpServletRequest req, HttpServletResponse rep, Model model) throws Exception  {
		String material = req.getParameter("term");		
		List<Material> mlist = rs.msearch(material);
		String str = "[";
		
		for(int i=0; i<mlist.size(); i++) {			
			if(i== mlist.size()-1) {
				str += "\""+mlist.get(i).getMaterial() + "\"";
			} else {
				str += "\""+mlist.get(i).getMaterial() + "\",";
			}			
		}
		str += "]";
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
		out.print(str);
		
		return null;
	}
	// 재료 자동 완성 기능

	@RequestMapping(value="rcpWrite", method = RequestMethod.POST)
	public String result(@ModelAttribute("recipe") Recipe recipe , BindingResult result, Model model, HttpServletRequest req, HttpServletResponse rep) {
		recipe.setEmail("ttt@choongang.com");
		// 아이디 : 이메일
		
		if(recipe.getOven()!="Y") {
			recipe.setOven("N");
		}
		// 오븐
				
		int day = Integer.parseInt(req.getParameter("time-d"));
		int hour = Integer.parseInt(req.getParameter("time-h"));
		int minute = Integer.parseInt(req.getParameter("time-m"));		
		int time = day * 1440 + hour * 60 + minute;
		recipe.setTime(time);		
		// 시간
		
		int MLi = Integer.parseInt(req.getParameter("sendLi"));	
		String material = rs.material(MLi, req);		
		recipe.setMaterial(material);		
		System.out.println(material);
		// 재료
		
		int Ili = Integer.parseInt(req.getParameter("imageLi"));
		System.out.println(Ili);
		String image = rs.image(Ili, req);
		recipe.setImage(image);
		// 이미지
				
		System.out.println(image);
		rs.insert(recipe);
		return "result";		
	}	
	
	@RequestMapping(value="upload", method = RequestMethod.GET)
	public String upload() {		
		return "upload/upload";		
	}		

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	 public String upload2(Model model, MultipartHttpServletRequest multipartRequest) throws IOException{
	  MultipartFile file = (MultipartFile) multipartRequest.getFile("upload");   //뷰에서 form으로 넘어올 때 name에 적어준 이름입니다.
	  Calendar cal = Calendar.getInstance(); 
	  String fileName = file.getOriginalFilename();
	  String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	  String replaceName = cal.getTimeInMillis() + fileType;  //파일 이름의 중복을 막기 위해서 이름을 재설정합니다.
	  
	  String path = multipartRequest.getServletContext().getRealPath("/image");   //제 바탕화면의 upload 폴더라는 경로입니다. 자신의 경로를 쓰세요.
	  FileUpload.fileUpload(file, path, replaceName);
	  model.addAttribute("path", "/recipe/image");
	  model.addAttribute("name", replaceName);
	  return "upload/upload2";
	 }	
	@RequestMapping(value="comment")
	public String comment() {		
		return "comment";		
	}	
	@RequestMapping(value="rate", method = RequestMethod.GET)
	public String rate() {		
		return "rate";		
	}	
	@RequestMapping(value="rate", method = RequestMethod.POST)
	public String ratePro() {		
		return "rate";		
	}	
}
