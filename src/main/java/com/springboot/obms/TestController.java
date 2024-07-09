package com.springboot.obms;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	@GetMapping("test")
	public String testingPage(Model model) {
		model.addAttribute("name", "Karthi");
		return "test";
	}

}
