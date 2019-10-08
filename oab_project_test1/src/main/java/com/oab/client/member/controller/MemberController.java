package com.oab.client.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.login.service.LoginService;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.service.MemberService;
import com.oab.client.member.service.UserMailSendService;
import com.oab.client.member.vo.MemberVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.UserInfoVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/member")

public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private UserMailSendService sendService;

	// 회원가입 폼
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		log.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join";
	}

	// 사용자 아이디 중복 체크 메서드
	@ResponseBody
	@RequestMapping(value = "/mt_IdConfirm", method = RequestMethod.POST)
	public String mt_IdConfirm(@RequestParam("mt_id") String mt_id) {
		int result = memberService.mt_IdConfirm(mt_id);
		return result + "";
	}

	// 아이디찾기에서 이메일이 맞는지 안맞는지에 대한 체크 메서드
	@ResponseBody
	@RequestMapping(value = "/mt_EmailConfirm", method = RequestMethod.POST)
	public String mt_EmailConfirm(@RequestParam("mt_email") String mt_email) {
		int result = memberService.mt_EmailConfirm(mt_email);
		return result + "";
	}

	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		log.info("join.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberInsert(mvo);

		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("member/join");
			break;
		case 3:
			mav.addObject("code", 1);
			mav.setViewName("member/join_success");
			// success to add new member; move to login page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("member/join");
			break;
		}
		return mav;
	}

	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public ModelAndView memberModifyChk(HttpSession session,HttpServletRequest request) {
		log.info("modify.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("login/login");
			return mav;
		}

		MemberVO vo = memberService.memberSelect(login.getMt_id());
		mav.addObject("member", vo);
		mav.setViewName("member/memberModify");
		return mav;
	}

	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public ModelAndView memberModifyProcessChk(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session,HttpServletRequest request) {
		log.info("modify.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("login/login");
			return mav;
		}
		MemberVO vo = memberService.memberSelect(mvo.getMt_id());
		if (loginService.loginSelect(mvo.getMt_id(), mvo.getOldmt_pw()) == null) {
			mav.addObject("errCode", 1);
			mav.addObject("member", vo);
			mav.setViewName("member/memberModify");
			return mav;
		}
		if (memberService.memberUpdate(mvo)) {
			mav.setViewName("intro");
			return mav;
		} else {
			mav.addObject("errCode", 2);
			mav.addObject("member", vo);
			mav.setViewName("member/memberModify");
			return mav;
		}
	}

	// 회원 탈퇴
	@RequestMapping(value = "/memberSecede", method = RequestMethod.GET)
	public ModelAndView memberSeceUpdateChk(HttpSession session,HttpServletRequest request) {
		log.info("memberSecede.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("login/login");
			return mav;// 로그인이 안되어있다면 로그인하라고 로그인화면을 보여줌
		}

		MemberVO vo = memberService.memberSelect(login.getMt_id());
		mav.addObject("member", vo);
		mav.setViewName("member/memberSecede");
		return mav;
	}

	// 회원 비활성화 (강좌상태 'ABLE' -> 'DISABLE')
	@RequestMapping(value = "/memberSecede/{mt_id}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> memberSecedeChk(@PathVariable("mt_id") String mt_id, @RequestBody MemberVO mvo,HttpServletRequest request) {
		System.out.println("memberSecede 호출 성공");
		System.out.println(mvo.getMt_id());

		ResponseEntity<String> entity = null;
		try {
			mvo.setMt_id(mt_id);
			memberService.memberSecede(mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 임시 비밀번호 발급
	@RequestMapping("/memberPwUpdate")
	public ModelAndView memberPwUpdate(HttpSession session, LoginVO lvo) throws Exception {
		log.info("memberPwUpdate.do get방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		sendService.sendMailPassword(lvo);
		mav.setViewName("login/login");
		return mav;
	}

	// 아이디 찾기
	@RequestMapping("/memberIdselect")
	public ModelAndView memberIdselect(HttpSession session, MemberVO mvo) throws Exception {
		log.info("memberIdselect.do get방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		sendService.sendMailId(mvo);

		mav.setViewName("login/login");
		return mav;
	}

	// 내 이용 내역 리스트 출력
	@RequestMapping(value = "/info/memberUserInfo", method = RequestMethod.GET)
	public ModelAndView memberUserInfoChk(@ModelAttribute("UseInfoVO") UserInfoVO uvo, Model model, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		System.out.println("memberUserInfo 호출 성공");
		// 페이지 세팅
		Paging.setPage(uvo);
		
	
		
		// 글번호 재설정
		/*
		 * int count = total - (Util.nvl(uvo.getPage()) - 1) *
		 * Util.nvl(uvo.getPageSize());
		 */
		
		String id = "";
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("login/login");
			return mav;// 로그인이 안되어있다면 로그인하라고 로그인화면을 보여줌
		}

		id = login.getMt_id();
		uvo.setMt_id(id);

		// 구매한 예약 목록
		List<UserInfoVO> userInfo = memberService.memberUserInfo(uvo);
		// 전체 레코드수 구현
		/*
		 * LoginVO test1 = (LoginVO)session.getAttribute("login");
		 * uvo.setMt_id(test1.getMt_id());
		 */
		int total = memberService.UserInfoListTotal(uvo);
		int count = memberService.UserInfoListCnt(uvo);

		System.out.println(userInfo.size());

		model.addAttribute("UserInfo", userInfo);

		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", uvo);

		mav.setViewName("member/info/memberUserInfo");
		return mav;
	}

	// 내 대여/반납 리스트 출력
	@RequestMapping(value = "/info/memberRentalInfo", method = RequestMethod.GET)
	public ModelAndView memberrentalInfo(@ModelAttribute("RentalVO") RentalVO revo, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		System.out.println("memberrentalInfo 호출 성공");

		// 페이지 세팅
		Paging.setPage(revo);
		System.out.println("1234");
		// 전체 레코드수 구현
		int total = memberService.RentalInfoListCnt(revo);
		// 렌탈 글번호 재설정
		int count = total - (Util.nvl(revo.getPage()) - 1) * Util.nvl(revo.getPageSize());
		String id = "";
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("login/login");
			return mav;// 로그인이 안되어있다면 로그인하라고 로그인화면을 보여줌
		}

		id = login.getMt_id();
		revo.setMt_id(id);
		// 대여 반납 목록
		List<RentalVO> rentalInfo = memberService.memberrentalInfo(revo);

		model.addAttribute("RentalInfo", rentalInfo);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", revo);

		mav.setViewName("member/info/memberRentalInfo");
		return mav;
	}

	// 환불 처리중으로 상태 변경하는 컨트롤러
	@RequestMapping(value = "/UserInfoUpdate/{rest_number}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> UserInfoUpdate(@PathVariable("rest_number") Integer rest_number,
			@ModelAttribute UserInfoVO uvo) {

		System.out.println("UserInfoUpdate 호출 성공");
		System.out.println(uvo.getRest_number());
		System.out.println(uvo.getRest_status());

		ResponseEntity<String> entity = null;
		try {
			System.out.println(uvo.getRest_number());
			memberService.UserInfoUpdate(uvo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
