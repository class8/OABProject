package com.oab.client.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.product.service.ProductService;
import com.oab.client.product.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	private Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productSetList(@ModelAttribute ProductVO pvo, Model model) {
		// 페이지 세팅
		pvo.setPageSize("9");
		Paging.setPage(pvo);

		// 레코드수
		int total = 0;

		// 전체 레코드수 구현
		// int total = productService.productListCnt(pvo);
		// log.info("total = " + total);

		List<ProductVO> setList = productService.setList(pvo);
		// 세트 레코드수 구현
		total = productService.setListCnt(pvo);
		log.info("total = " + total);
		model.addAttribute("setList", setList);

		// 글번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		log.info("count = " + count);

		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);

		return "product/productList";
	}

	@RequestMapping(value = "/productAddList", method = RequestMethod.GET)
	public String productAddList(@ModelAttribute ProductVO pvo, Model model) {
		// 페이지 세팅
		pvo.setPageSize("6");
		Paging.setPage(pvo);

		// 레코드수
		int total = 0;

		// 전체 레코드수 구현
		// int total = productService.productListCnt(pvo);
		// log.info("total = " + total);

		List<ProductVO> addList = productService.addList(pvo);
		// 추가 레코드수 구현
		total = productService.addListCnt(pvo);
		log.info("total = " + total);
		model.addAttribute("addList", addList);

		// 글번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		log.info("count = " + count);

		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);

		return "product/productAddList";
	}
}
