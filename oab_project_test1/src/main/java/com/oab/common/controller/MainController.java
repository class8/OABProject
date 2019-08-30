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
		return "greeting/greetingPage"; // 인사말
	}

	// 공지사항
	@RequestMapping(value = "/notice/noticeList", method = RequestMethod.GET)
	public String notice() {
		return "notice/noticeList";
	}

	@RequestMapping(value = "/branch/branchPage", method = RequestMethod.GET)
	public String branch() {
		return "branch/branchPage"; // 지점안내
	}

	@RequestMapping(value = "/faq/faqPage", method = RequestMethod.GET)
	public String faq() {
		return "faq/faqPage";
	}

	@RequestMapping(value = "/terms/termsPage", method = RequestMethod.GET)
	public String terms() {
		return "terms/termsPage";
	}

	@RequestMapping(value = "/policy/policyPage", method = RequestMethod.GET)
	public String policy() {
		return "policy/policyPage";
	}
}
