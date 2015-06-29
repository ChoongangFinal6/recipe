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
	
}
