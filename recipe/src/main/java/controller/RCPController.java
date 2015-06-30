package controller;

import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUpload;

@Controller
public class RCPController {	
	
	@RequestMapping(value="rcpWrite", method = RequestMethod.GET)
	public String rcpWrite() {		
		return "rcpWrite";		
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
}
