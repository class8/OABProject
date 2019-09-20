package com.oab.client.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.client.product.service.ProductService;
import com.oab.client.product.vo.ProductVO;

@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute ProductVO pvo, Model model) {
		System.out.println("main page");
		List<ProductVO> setList = productService.mainList();
		model.addAttribute("setList", setList);
		
		return "index";
	}

	@RequestMapping(value = "/greeting/greetingPage", method = RequestMethod.GET)
	public String greeting() {
		return "greeting/greetingPage"; // 인사말
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
