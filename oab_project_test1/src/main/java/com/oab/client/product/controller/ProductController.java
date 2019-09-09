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

	/**************************************
	 * 글목록 구현하기
	 **************************************/
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productList 호출 성공");

		// 페이지 세팅
		pvo.setPageSize("6");
		Paging.setPage(pvo);

		// 레코드수
		int total = 0;

		// 전체 레코드수 구현
		// int total = productService.productListCnt(pvo);
		// log.info("total = " + total);

		if (pvo.getSelect_type().equals("세트상품")) {
			List<ProductVO> setList = productService.setList(pvo);
			// 세트 레코드수 구현
			total = productService.setListCnt(pvo);
			log.info("total = " + total);
			model.addAttribute("setList", setList);
		} else if (pvo.getSelect_type().equals("추가상품")) {
			List<ProductVO> addList = productService.addList(pvo);
			// 추가 레코드수 구현
			total = productService.addListCnt(pvo);
			log.info("total = " + total);
			model.addAttribute("addList", addList);
		}
		// 글번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		log.info("count = " + count);

		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);

		return "product/productList";

	}

	/**************************************
	 * 글 상세보기 구현
	 **************************************/
	/*
	 * @RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	 * public String productDetail(@ModelAttribute productVO pvo, Model model) {
	 * log.info("productDetail 호출 성공"); log.info("b_num = " + pvo.getB_num());
	 * 
	 * productVO detail = new productVO(); detail =
	 * productService.productDetail(pvo);
	 * 
	 * if (detail != null && (!detail.equals(""))) {
	 * detail.setB_content(detail.getB_content().toString().replaceAll("\n",
	 * "<br>")); }
	 * 
	 * model.addAttribute("detail", detail);
	 * 
	 * return "product/productDetail"; }
	 */
}
