package com.springboot.obms;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestRestController {
	public String welcome() {
		return "Welcome";
	}
}
