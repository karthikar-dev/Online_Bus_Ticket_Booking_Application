package com.springboot.obms.configuration;

import static org.springframework.security.config.Customizer.withDefaults;
import java.util.ArrayList;
import java.util.List;

import com.springboot.obms.model.Passenger;
import com.springboot.obms.repository.PassengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	// Adding Doctor and Patient Credentials
	@Autowired
    PassengerRepository passRepo;

	// 1. Authentication
	@Bean
	public UserDetailsService userDetailsService(PasswordEncoder encoder) {

		// For Testing Purpose

		// 1 Admin
		UserDetails admin = User.withUsername("Girisha").password(encoder.encode("Girisha@")).roles("ADMIN").build();

		// 2. User
		UserDetails user = User.withUsername("Giri").password(encoder.encode("Giri@")).roles("USER").build();

		// Actual User Credentials
		// Adding Passengers
		List<Passenger> passengers = passRepo.findAll();

		// List to store UserDetails
		List<UserDetails> allUsers = new ArrayList<>();

		// 3. Passengers
		// Adding passengers email & password to UserDetails - allUsers
		for (Passenger p : passengers) {
			allUsers.add(User.withUsername(p.getEmail()).password(encoder.encode(p.getLogin_password())).roles("USER")
					.build());
		}
		return new InMemoryUserDetailsManager(allUsers);
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// 2. Authorization
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		return http.csrf(csrf -> csrf.disable()).formLogin(withDefaults()).build();

	}

}