package com.oab.admin.maincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String intro() {
		return "intro";
	}

	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String mainpage() {

		System.out.println("금나와라 뚝딱!");

		return "main";

	}

}
