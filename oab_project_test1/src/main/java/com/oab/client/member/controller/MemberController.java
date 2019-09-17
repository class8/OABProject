package com.oab.client.member.controller;

import javax.servlet.http.HttpSession;

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

import com.oab.client.login.service.LoginService;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.service.MemberService;
import com.oab.client.member.service.UserMailSendService;
import com.oab.client.member.vo.MemberVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/member")
@Log
public class MemberController {
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
	@RequestMapping(value = "/mt_IdConfirm.do", method = RequestMethod.POST)
	public String mt_IdConfirm(@RequestParam("mt_id") String mt_id) {
		int result = memberService.mt_IdConfirm(mt_id);
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
			mav.addObject("errCode", 3);
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

	@RequestMapping(value = "/MemberModify", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpSession session) {
		log.info("modify.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("login/login");
			return mav;
		}

		MemberVO vo = memberService.memberSelect(login.getMt_id());
		mav.addObject("member", vo);
		mav.setViewName("member/MemberModify");
		return mav;
	}

	@RequestMapping(value = "/MemberModify", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) {
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
			mav.setViewName("member/MemberModify");
			return mav;
		}
		if (memberService.memberUpdate(mvo)) {
			mav.setViewName("redirect:/login/login");
			return mav;
		} else {
			mav.addObject("errCode", 2);
			mav.addObject("member", vo);
			mav.setViewName("member/MemberModify");
			return mav;
		}
	}

	// 회원 탈퇴
	@RequestMapping(value = "/memberSecede", method = RequestMethod.GET)
	public ModelAndView memberSeceUpdate(HttpSession session) {
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
	public ResponseEntity<String> memberSecede(@PathVariable("mt_id") String mt_id, @RequestBody MemberVO mvo) {
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
	@RequestMapping("/memberPwUpdate.do")
	public ModelAndView memberPwUpdate(HttpSession session, LoginVO lvo) throws Exception {
		log.info("memberPwUpdate.do get방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		sendService.sendMailPassword(lvo);
		mav.setViewName("login/login");
		return mav;
	}

	// 아이디 찾기
	@RequestMapping("/memberIdselect.do")
	public ModelAndView memberIdselect(HttpSession session, MemberVO mvo) throws Exception {
		log.info("memberIdselect.do get방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		sendService.sendMailId(mvo);

		mav.setViewName("login/login");
		return mav;
	}

}
