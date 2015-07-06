package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Content;
import model.Material;
import model.Rating;
import model.Recipe;
import model.Reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.ContentService;
import service.RatingService;
import service.RecipeService;
import service.ReplyService;
import fileupload.FileUpload;

@Controller
public class RCPController {
	@Autowired
	RecipeService rs;
	@Autowired
	ContentService cs;
	@Autowired
	RatingService rts;
	@Autowired
	ReplyService rpls;
	
	/**
	 * 레시피를 작성하기 위한
	 * 페이지로 넘어가는 부분
	 */
	
	@RequestMapping(value="rcpWrite", method = RequestMethod.GET)
	public String rcpWrite() {		
		return "rcpWrite";		
	}
	
	/**
	 * 수정을 하고 확인을 누르면
	 * 실질적으로 DB에 접속하여 수정하는 부분
	 * 수정액션
	 */
	
	@RequestMapping(value="rcpUpdateAction", method = RequestMethod.POST)
	public String rcpWriteAction(@ModelAttribute("content") Content content, @ModelAttribute("recipe") Recipe recipe, HttpServletRequest req, HttpServletResponse rep, Model model) {		
		recipe.setEmail("ttt@choongang.com");
		// 아이디 : 이메일
		
		if(recipe.getOven() == null) {
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
		// 재료
		
		int Ili = Integer.parseInt(req.getParameter("imageLi"));	
		String image = rs.image(Ili, req);
		recipe.setLastimage(image);
		// 이미지		
		
		rs.rcpUpdate(recipe);				
		
		//////////////////// content /////////////////////		
		
		String[] imagelist = image.split(",");
	
		cs.delete(recipe.getNo());	
		
		for(int i=0; i<Ili; i++) {			
			content.setPostNo(recipe.getNo());
			content.setImage(imagelist[i]);
			content.setContent(recipe.getSendText()[i]);
			System.out.println(recipe.getSendText()[i]);
			
			if(i>=1) {
				cs.insert2(content);
			} else {			
				cs.insert1(content);
			}
		}		

		
		return "result";		
	}
	
	/**
	 * 수정 하기 위에 접속하는 페이지
	 * 기존에 있던 작성된 값들을 불러온다.
	 * 수정
	 */
	
	@RequestMapping(value="rcpUpdate", method = RequestMethod.GET)
	public String rcpUpdate(@RequestParam("no") int no, Model model) {
		Recipe recipe = rs.rcpSelect(no);
		model.addAttribute(recipe);
		
		int time = recipe.getTime();
		int day, hour, minute;
		day = time / 1440;
		hour = (time % 1440)/60;
		minute = (time % 1440)%60;
		
		model.addAttribute("day", day);
		model.addAttribute("hour", hour);
		model.addAttribute("minute", minute);
		// 꺼내올 시간 계산
		
		String material = recipe.getMaterial();
		String[] materialList = material.split(",");
		List<String[]> mList = new ArrayList<String[]>();
		for(int i=0; i<materialList.length/3; i++) {
			String[] str= {materialList[i*3], materialList[i*3+1], materialList[i*3+2]};
			mList.add(str);			
		}
		model.addAttribute("mList", mList);
		//재료 전송		

		int mli = materialList.length/3;
		model.addAttribute("mli", mli);
		// 재료 li 갯수 전송
		
		
		////////////////// Content ////////////////
		
		List<Content> content = cs.detail(no);
		
		model.addAttribute("content", content);
		
		return "rcpUpdate";		
	}
	
	/**
	 * 재료를 검색하기 위해 사용하는 부분
	 * 자동 완성기능
	 */
	
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

	/**
	 * 레시피 작성 부분
	 * 글을 적고 확인을 누르면
	 * DB에 저장된다.
	 * 작성
	 */
	
	@RequestMapping(value="rcpWrite", method = RequestMethod.POST)
	public String result(@ModelAttribute("content") Content content, @ModelAttribute("recipe") Recipe recipe, 
			BindingResult result, Model model, HttpServletRequest req, HttpServletResponse rep) {
		recipe.setEmail("ttt@choongang.com");
		// 아이디 : 이메일
		
		if(!recipe.equals("Y")) {
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
		// 재료
		
		int ili = Integer.parseInt(req.getParameter("imageLi"));	
		// 내용이 몇칸인지 받아옴
		
		String lastimage = rs.lastimage(ili, req);
		recipe.setLastimage(lastimage);
		// 이미지		
		
		int no = rs.insert(recipe);
		// 현재 작성된 글의 번호를 받아온다.				
		
		//////////////////////// Content //////////////////////////
		
		String image = rs.image(ili, req);
		String[] imagelist = image.split(",");
		
		for(int i=0; i<ili; i++) {			
			content.setPostNo(no);
			content.setImage(imagelist[i]);
			content.setContent(recipe.getSendText()[i]);
			
			if(i>=1) {
				cs.insert2(content);
			} else {			
				cs.insert1(content);
			}
		}		
		return "result";		
	}	
	
	/**
	 * 본문 보기
	 * @param no : 레시피일련번호
	 * @return
	 */
	@RequestMapping(value="detail")
	public String detail(@RequestParam("no") int no, Model model) {		
		Recipe recipe = rs.rcpSelect(no);
		List<Content> content = cs.detail(no);
		int count = rts.cntAvg(no).getCount();
		
		String material = recipe.getMaterial();
		String[] materialList = material.split(",");
		List<String[]> mList = new ArrayList<String[]>();
		for(int i=0; i<materialList.length/3; i++) {
			String[] str= {materialList[i*3], materialList[i*3+1], materialList[i*3+2]};
			mList.add(str);			
		}
		model.addAttribute("mList", mList);
		//재료 전송
		
		model.addAttribute("count", count);
		model.addAttribute("recipe", recipe);
		model.addAttribute("content", content);
		return "detail";		
	}	
	
	/**
	 * 이미지 업로드를 누르면 작동하는 페이지
	 */
	
	@RequestMapping(value="upload", method = RequestMethod.GET)
	public String upload() {		
		return "upload/upload";		
	}		
	
	/**
	 * 이미지 업로드 되는 실질적인 부분
	 */

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
	/**
	 * @param postNo content 테이블의 no를 받아서 조회
	 * @return
	 */
	@RequestMapping(value="reply",method=RequestMethod.GET)
	public String comment(@RequestParam("postNo") int postNo, Model model) {
		List<Reply> list = rpls.list(postNo);
		model.addAttribute("email", "ttt@choongang.com");
		model.addAttribute("list", list);
		model.addAttribute("postNo", postNo);
		return "reply";	
	}	
	/**
	 * 댓글쓰기 기능
	 * @param reply	no의 null여부에 따라 답글인지 구분
	 * @return 레시피 보기 페이지로 이동(해서 새로고침)
	 */
	@RequestMapping(value="reply",method=RequestMethod.POST)
	public String commentWrite(@ModelAttribute("reply") Reply reply, BindingResult result, Model model) {		
		reply.setEmail("ttt@choongang.com");
		if (reply.getNo() > 0) {
			Reply ref = rpls.select(reply.getNo());
			reply.setRef(ref.getRef());
			reply.setPostNo(ref.getPostNo());
			reply.setRefId(ref.getEmail());
		} else {
		}
		System.out.println(reply.getRef());
		int result1 = rpls.insert(reply);
		return "redirect:detail.html?no="+reply.getPostNo();	
	}	
	/**
	 * 세션 등의 email 받아서 객체에 저장, no와 같이 del수행
	 * @param no
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="delReply")
	public String commentDelete(@RequestParam("no") int no, Model model, HttpServletRequest req, HttpServletResponse rep) throws IOException {		
		Reply reply = new Reply();
		reply.setNo(no);
		reply.setEmail("ttt@choongang.com");
		int result = rpls.delete(reply);
		String msg = "" + result;
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
		out.print(msg);
		return null;	
	}	
	/**
	 * 평점주기
	 * @param postNo
	 * @param rate
	 * @param rep 이용해서 결과값주기 ->ajax에서 활용
	 * @return 널
	 */
	@RequestMapping(value="rate", method = RequestMethod.GET)
	public String ratePro(@RequestParam("postNo") int postNo, @RequestParam("rate") int rate, Model model, HttpServletRequest req, HttpServletResponse rep) throws IOException {		
		Rating rating = new Rating();
		rating.setPostNo(postNo);
		rating.setRate(rate);
		rating.setEmail("ttt@choongang.com");
		int result = rts.insert(rating);
		Rating cntAvg = rts.cntAvg(postNo);
		
		String msg = "{\"result\":\""+result+"\""
				+ ",\"count\":\""+cntAvg.getCount()+"\""
				+ ",\"average\":\""+cntAvg.getAverage()+"\""
				+ "}";
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
		out.print(msg);
		return null;		
	}	
}
