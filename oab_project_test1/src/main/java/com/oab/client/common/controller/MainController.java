package com.oab.client.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "index";
	}
	@RequestMapping(value = "/greeting/greetingPage", method = RequestMethod.GET)
	public String greeting() {
		return "greeting/greetingPage";
	}
	@RequestMapping(value = "/terms/termsPage", method = RequestMethod.GET)
	public String terms() {
		return "terms/termsPage";
	}
}
