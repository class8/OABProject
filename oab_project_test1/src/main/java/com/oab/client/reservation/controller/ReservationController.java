package com.oab.client.reservation.controller;

import java.io.Console;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.product.service.ProductService;
import com.oab.client.product.vo.ProductVO;
import com.oab.client.reservation.service.ReservationService;
import com.oab.client.reservation.vo.ReservationVO;
import com.oab.client.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private ProductService productService;

	/**************************************
	 * 예약하기 화면 출력하기
	 **************************************/
	@RequestMapping(value = "/reservationReg", method = RequestMethod.GET)
	public String reservationReg(@ModelAttribute ProductVO pvo, Model model, @RequestParam(value = "pt_num", required = false, defaultValue = "0") int pt_num) {
		log.info("reservationReg 호출 성공");

		ProductVO product = productService.productDetail(pt_num);
		List<ProductVO> addList = productService.addList(pvo);

		model.addAttribute("product", product);
		model.addAttribute("addList", addList);
		model.addAttribute("data", pvo);

		return "reservation/reservationReg";
	}

	/**************************************
	 * 글쓰기 구현하기
	 * 
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 **************************************/
	@RequestMapping(value = "/reservationReg", method = RequestMethod.POST)
	public String reservationInsertChk(@ModelAttribute ReservationVO rvo, Model model, HttpServletRequest request,
			HttpSession session, @RequestParam(value = "pt_num", required = false, defaultValue = "0") String[] pt_num,
			@RequestParam(value = "pt_cnt", required = false, defaultValue = "0") String[] pt_cnt,
			@RequestParam(value = "price", required = false, defaultValue = "0") String[] price, RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException {
		log.info("reservationInsert 호출 성공");
		System.out.println("예약삽입 컨트롤러 호출 성공");
		LoginVO login = (LoginVO) session.getAttribute("login");
		rvo.setMt_id(login.getMt_id());
		//묶음번호
		int bnumber = reservationService.reservationBnumber();
		rvo.setRest_bnumber(bnumber);
		
		int result = 0;
		String url = "";
		result = reservationService.reservationInsert(rvo, pt_num, pt_cnt, price);
		if (result == 1) { // 성공시
			redirectAttributes.addFlashAttribute("code", 1);
			url = "/reservation/reservationResult";
		} else {
			redirectAttributes.addFlashAttribute("code", 2);
			url = "/reservation/reservationResult";
		}
		return "redirect:" + url;
	}

	@RequestMapping(value = "/reservationResult")
	public String reservationResultChk(HttpServletRequest request) {
		return "reservation/reservationResult";
	}

}
