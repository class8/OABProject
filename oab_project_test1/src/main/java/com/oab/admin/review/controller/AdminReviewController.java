package com.oab.admin.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.review.service.AdminReviewService;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value = "/admin/review")
public class AdminReviewController {

	@Autowired
	private AdminReviewService adminReviewService;

	/**************************************
	 * 글목록 구현하기
	 **************************************/
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String productList_Chk(@ModelAttribute ReviewVO rvo, Model model,HttpServletRequest request) {

		System.out.println("reviewList 호출 성공");

		// 페이지 세팅
		rvo.setPageSize("6");
		Paging.setPage(rvo);

		// 레코드수
		int total = adminReviewService.adminReviewListCnt(rvo);

		List<ReviewVO> reviewList = adminReviewService.adminReviewList(rvo);
		System.out.println(reviewList.toString());
		// 글번호 재설정
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", rvo);

		return "admin/review/adminReviewList";

	}

	// 후기 상세보기
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public String adminReviewDetail_Chk(@ModelAttribute ReviewVO rvo, Model model,HttpServletRequest request) {

		System.out.println("상세보기 호출 성공");

		ReviewVO reviewDetail = new ReviewVO();
		reviewDetail = adminReviewService.adminReviewDetail(rvo);

		if (reviewDetail != null && (!reviewDetail.equals(""))) {
			reviewDetail.setRevt_number(reviewDetail.getRevt_number());
		}

		model.addAttribute("reviewDetail", reviewDetail);

		return "admin/review/adminReviewDetail";
	}

	// 삭제하기
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
	public String adminReviewDelete_Chk(@ModelAttribute ReviewVO rvo, Model model,HttpServletRequest request) {

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다.
		int result = 0;
		String url = "";

		result = adminReviewService.adminReviewDelete(rvo.getRevt_number());

		if (result == 1) {
			url = "/admin/review/reviewList";

		} else {
			url = "/admin/review/adminReviewDetail?revt_number=" + rvo.getRevt_number();
		}
		return "redirect:" + url;

	}

	// 후기 게시판 작성 폼 출력하기
	@RequestMapping(value = "/writeForm")
	public String writeForm_Chk(HttpSession session,HttpServletRequest request) {

		// 로그인, 이용내역이 있어야 작성이 가능합니다.
		System.out.println("review Write Method 호출 성공");
		return "admin/review/adminReviewWriteForm";

	}

}
