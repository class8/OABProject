package com.oab.admin.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String intro() {
		return "admin";
	}
}
