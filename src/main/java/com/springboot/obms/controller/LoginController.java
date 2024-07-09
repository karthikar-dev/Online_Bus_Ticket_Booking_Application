package com.springboot.obms.controller;

import com.springboot.obms.model.Passenger;
import com.springboot.obms.repository.PassengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class LoginController {

	@Autowired
	private PassengerRepository passRepo;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// Endpoint to show the custom login page
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// Endpoint to handle redirection upon successful login
	@GetMapping("/")
	public String loggedIn(@AuthenticationPrincipal User user, Model model) {
		String username = user.getUsername();
		logger.info("User logged in: {}", username);

		Passenger passenger = passRepo.findByEmail(username);

		if (passenger != null) {
			int passengerId = passenger.getPassengerId();
			logger.info("Passenger found: ID {}", passengerId);
			return "redirect:/passenger/welcome/" + passengerId;
		}

		logger.warn("Passenger not found for email: {}", username);
		return "redirect:/login?error";
	}
}
