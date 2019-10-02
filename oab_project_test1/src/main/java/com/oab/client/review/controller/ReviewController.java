package com.oab.client.review.controller;
//리뷰컨트롤러

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oab.client.common.file.FileUploadUtil;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.review.service.ReviewService;
import com.oab.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {

	private Logger log = LoggerFactory.getLogger(ReviewController.class);

	// 빈 객체를 생성한다
	@Autowired
	private ReviewService reviewService;

	// 후기 게시판 목록 리스트 출력
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute ReviewVO rvo, Model model) {

		System.out.println("후기게시판 리스트 출력하기");
		// 페이지를 세팅
		rvo.setPageSize("6");
		Paging.setPage(rvo);

		// 레코드 수
		int total = reviewService.reviewListCnt(rvo);
		System.out.println("total = " + total);

		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		// 세트 레코드수 구현
		// 글 번호를 재설정한다
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		System.out.println("count = " + count);

		total = reviewService.reviewListCnt(rvo);

		model.addAttribute("reviewList", reviewList); // 값을 반환한다
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", rvo);

		return "review/reviewList";
	}

	// 후기 게시판 작성 폼 출력하기
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWrite(HttpSession session) {

		// 로그인, 이용내역이 있어야 작성이 가능합니다.
		System.out.println("review Write Method 호출 성공");
		return "review/reviewWrite";

	}

	// 후기 게시판 등록 구현하기
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8") // 주소값
	public String reviewInsert(@ModelAttribute ReviewVO rvo, Model model, HttpSession session,
			HttpServletRequest request) throws IllegalStateException, IOException, Exception { // 받아와야하는 매개변수
		System.out.println("후기 게시판 게시글 등록 메소드 호출 성공");
		// 이미지 파일 업로드

		int result = 0;
		String url = "";
		LoginVO login = (LoginVO) session.getAttribute("login"); // 로그인한 사람만

		// 상품 등록을 위한 것들
		if (rvo.getRevt_file() != null) {
			String revt_thumbnail = FileUploadUtil.fileUpload(rvo.getRevt_file(), request, "revt_thumbnail");
			rvo.setRevt_thumbnail(revt_thumbnail);
		}
		if (rvo.getRevt_file1() != null && !(rvo.getRevt_file1().equals(""))) {
			String revt_image1 = FileUploadUtil.fileUpload(rvo.getRevt_file1(), request, "revt_image1");
			rvo.setRevt_image1(revt_image1);
		}
		if (rvo.getRevt_file2() != null && !(rvo.getRevt_file2().equals(""))) {
			String revt_image2 = FileUploadUtil.fileUpload(rvo.getRevt_file2(), request, "revt_image2");
			rvo.setRevt_image2(revt_image2);
		}
		if (rvo.getRevt_file3() != null && !(rvo.getRevt_file3().equals(""))) {
			String revt_image3 = FileUploadUtil.fileUpload(rvo.getRevt_file3(), request, "revt_image3");
			rvo.setRevt_image3(revt_image3);
		}

		result = reviewService.reviewInsert(rvo);

		if (result == 1) {
			url = "/review/reviewList"; // 작성완료
		} else {
			model.addAttribute("code", 1);
			url = "/review/reviewWrite"; // 등록이 안 될 시
			System.out.println("실패");
		}
		return "redirect:" + url;

	}

	// 상세보기 구현하기
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	public String reviewDetail(@ModelAttribute ReviewVO rvo, Model model, HttpSession session) {

		System.out.println("포토 후기 리스트 상세보기 호출 성공");
		log.info("revt_number = " + rvo.getRevt_number());

		LoginVO login = (LoginVO) session.getAttribute("login"); // 아이디 필요

		System.out.println(rvo.getRevt_title());
		ReviewVO detail = new ReviewVO();
		detail = reviewService.reviewDetail(rvo);

		if (detail != null && (!detail.equals(""))) {
			reviewService.reviewReadCntUpdate(rvo);
			detail.setRevt_readcnt(detail.getRevt_readcnt());
		}

		model.addAttribute("detail", detail);
		return "review/reviewDetail";

	}

	// 포토후기 수정 폼 출력하기
	@RequestMapping(value = "/reviewUpdateForm", method = RequestMethod.GET)
	public String reviewUpdateForm(@ModelAttribute ReviewVO rvo, Model model, HttpSession session) {

		System.out.println("포토 후기 수정 폼 호출 성공");
		log.info("revt_number = " + rvo.getRevt_number());

		LoginVO login = (LoginVO) session.getAttribute("login"); // 로그인한 사람만

		ReviewVO updateData = new ReviewVO();
		updateData = reviewService.reviewDetail(rvo);
		System.out.println(updateData.getRevt_number());

		model.addAttribute("updateData", updateData);
		return "review/reviewUpdate";

	}

	// 포토후기 수정하기 구현
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute ReviewVO rvo, Model model, HttpSession session,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException, Exception {

		System.out.println("후기 게시판 게시글 등록 메소드 호출 성공");
		// 이미지 파일 업로드

		int result = 0;
		System.out.println("result"); // 번호
		String url = "";
		LoginVO login = (LoginVO) session.getAttribute("login"); // 로그인한 사람만

		// 새로운 파일이 등록되었는지 확인한다
		/*
		 * if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 * // new file(fileUpload())
		 * 
		 * }
		 */

		// 포토 후기 이미지 파일 수정을 위해서!
		if (rvo.getRevt_file() != null) {
			String revt_tumbnail = FileUploadUtil.fileUpload(rvo.getRevt_file(), request, "revt_thumbnail");
			rvo.setRevt_thumbnail(revt_tumbnail);
		}
		if (rvo.getRevt_file1() != null && !(rvo.getRevt_file1().equals(""))) {
			String revt_image1 = FileUploadUtil.fileUpload(rvo.getRevt_file1(), request, "revt_image1");
			rvo.setRevt_image1(revt_image1);
		}
		if (rvo.getRevt_file2() != null && !(rvo.getRevt_file2().equals(""))) {
			String revt_image2 = FileUploadUtil.fileUpload(rvo.getRevt_file2(), request, "revt_image2");
			rvo.setRevt_image2(revt_image2);
		}
		if (rvo.getRevt_file3() != null && !(rvo.getRevt_file3().equals(""))) {
			String revt_image3 = FileUploadUtil.fileUpload(rvo.getRevt_file3(), request, "revt_image3");
			rvo.setRevt_image3(revt_image3);
		}

		result = reviewService.reviewUpdate(rvo);

		if (result == 1) {
			url = "/review/reviewList"; // 작성완료
		} else {
			model.addAttribute("code", 1);
			url = "/review/reviewUpdate"; // 등록이 안 될 시
			System.out.println("수정에 실패했습니다");
		}
		return "redirect:" + url;

	}

	// 포토후기 삭제하기
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(@ModelAttribute ReviewVO rvo, Model model, HttpServletRequest request)
			throws IOException {

		System.out.println("후기 게시판 삭제 메소드 호출 성공");
		// 이미지 파일 업로드

		int result = 0;
		String url = "";

		result = reviewService.reviewDelete(rvo.getRevt_number());
		System.out.println(result);
		System.out.println("삭제중입니다");

		if (result == 1) {
			url = "/review/reviewList";
		} else {
			// model.addAttribute("code", 1);
			// 삭제가 되지 않을시
			url = "/review/reviewUpdate?revt_number=" + rvo.getRevt_number() + "&page=" + rvo.getPage() + "&pageSize="
					+ rvo.getPageSize();
			System.out.println("포토후기 삭제 불가");
		}
		return "redirect:" + url;

	}

}
