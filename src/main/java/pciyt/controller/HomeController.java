package pciyt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "redirect:/home";
	}
	
	@RequestMapping("/home")
	@ResponseBody
	public String homeRedirect() {
		return "hello world";
	}
}
