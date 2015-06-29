package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="upload2", method = RequestMethod.POST)
	public String upload2() {		
		return "upload/upload2";		
	}	
}
