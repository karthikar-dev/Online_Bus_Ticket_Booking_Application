package com.springboot.obms.controller;

import java.time.LocalDate;
import java.util.List;

import com.springboot.obms.exception.CustomException;
import com.springboot.obms.model.Bus;
import com.springboot.obms.repository.PassengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.springboot.obms.repository.BusRepository;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("passenger")
public class BusController {

	@Autowired
    PassengerRepository passRepo;
	
	@Autowired
	BusRepository busRepo;

	@GetMapping({ "busschedules/{passengerId}" })
	public String busSchedules(@PathVariable("passengerId") int passengerId, Model model) {
		List<Bus> buses = busRepo.findAll();
		String name = passRepo.findById(passengerId).get().getPassengerName();
		model.addAttribute("buses", buses);
		model.addAttribute("id", passengerId);
		model.addAttribute("name", name);
		return "bus_schedules";
	}
	
	
	@GetMapping({ "busschedules" })
	public String busSchedulesSearch(@RequestParam("passengerId") int passengerId, @RequestParam("sDate") LocalDate sDate,
									 @RequestParam("fromLoc") String fromLoc, @RequestParam("toLoc") String toLoc, Model model,
									 RedirectAttributes redirectAttributes) {
		try {
			List<Bus> buses = busRepo.findByFromLocAndToLocAndStartDate(fromLoc, toLoc, sDate);
			model.addAttribute("buses", buses);
			model.addAttribute("passengerId", passengerId);

			return "bus_schedules";
		} catch (CustomException e) {
			redirectAttributes.addFlashAttribute("status", HttpStatus.BAD_GATEWAY);
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			throw new CustomException(e.getMessage());

		}
	}

}
