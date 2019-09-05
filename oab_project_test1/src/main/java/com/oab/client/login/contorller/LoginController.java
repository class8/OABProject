package com.oab.client.login.contorller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oab.client.login.service.LoginService;
import com.oab.client.login.vo.LoginVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/login")
@Log
public class LoginController {
	@Autowired
	private LoginService loginService;

	// 로그인 화면 보여주기 위한 메서드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출 성공");
		return "login/login";
	}

	// 로그인 처리 메서드
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		log.info("login.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		String mt_Id = lvo.getMt_id();

		int resultData = loginService.loginHistory2Insert(lvo);

		if (resultData == 1) {
			mav.addObject("errCode", 1);
			mav.setViewName("login/login");
			return mav;
		} else {
			LoginVO vo = loginService.loginHistory2Select(mt_Id);
			log.info("최근 로그인 일시:" + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			log.info("retry:" + vo.getRetry());

			// 로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금
			if (vo.getRetry() >= 5) {
				if (new Date().getTime() - vo.getLastFailedLogin() > 30000) {
					mav.addObject("errCode", 6);// 30초 동안 로그인 잠금 알림
					mav.setViewName("login/login");
					return mav;
				} else {
					vo.setRetry(0);
					vo.setLastFailedLogin(0);
					loginService.loginHistory2Update(vo);
				}
			}
			LoginVO loginCheckResult = loginService.loginSelect(lvo.getMt_id(), lvo.getMt_pw());
			if (loginCheckResult == null) {
				vo.setRetry(vo.getRetry() + 1);
				vo.setLastFailedLogin(new Date().getTime());
				loginService.loginHistory2Update(vo);

				mav.addObject("retry", vo.getRetry());
				mav.addObject("errCode", 1);
				mav.setViewName("login/login");
				return mav;
			}
			// 로그인이 성공하면, 로그인 시도횟수를 0로 reset,
// 마지막으로 로그인 실패 시간 0으로 reset, 
			// 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트
			else {
				vo.setRetry(0);
				vo.setLastFailedLogin(0);
				vo.setLastSuccessedLogin(new Date().getTime());
				vo.setClientIP(request.getRemoteAddr());
				loginService.loginHistory2Update(vo);

				session.setAttribute("login", loginCheckResult);
				mav.setViewName("intro");
				return mav;
			}
		}
	}

	// 로그아웃 처리 메소드
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/login/login.do";
	}

}