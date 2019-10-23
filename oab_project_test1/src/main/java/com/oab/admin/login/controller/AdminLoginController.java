package com.oab.admin.login.controller;
//개발자 : 최대근
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oab.admin.login.service.AdminLoginService;
import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminLoginController {
	// 안먹힘.
	// private Logger log = LoggerFactory.getLogger(AdminLoginController.class);

	@Autowired
	private AdminLoginService adminLoginService;

	// 로그인 화면을 보여주기 위한 메서드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminLogin() {
		System.out.println("로그인 페이지 호출 성공");

		return "admin/login/adminLoginPage";
	}

	// 로그인 처리 메서드 로그인,로그인 실패 시 처리 내용 포함
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView adminLoginProc(@ModelAttribute("AdminLoginVO") AdminLoginVO aLvo, QuestionVO qvo,
			ReservationVO rvo, Model model, RentalVO Rvo, HttpSession session) {
		// 메소드가 post로 값이 전달됬을때 실행되는 이유는 login.js에서 loginform을 post방식으로 넘겨주기 때문.
		// loginform을 get 방식으로 넘겨주면 이메소드 또한 method = RequestMethod.get 가 되어야한다.
		System.out.println("로그인 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		// 로그인하는 관리자의 아이디와 비밀번호가 일치하는지 쿼리문이 담겨있는 adminLoginCheckResult
		AdminLoginVO adminLoginCheckResult = adminLoginService.adminLoginSelect(aLvo.getAdminID(), aLvo.getAdminPW());

		if (adminLoginCheckResult == null) {
			System.out.println("로그인 실패");
			mav.setViewName("admin/login/adminLoginPage");
			return mav;
		} else {
			System.out.println("로그인 성공");
			// login.jsp 에서 사용할 adminLogin 객체
			session.setAttribute("adminLogin", adminLoginCheckResult);
			System.out.println(session.getAttribute("adminLogin").toString());
			// 1:1 문의 리스트
			List<QuestionVO> mainQuestionList = adminLoginService.mainQuestionList();
			model.addAttribute("mainQuestionList", mainQuestionList);
			model.addAttribute("data");

			// 예약리스트
			List<ReservationVO> mainReservationList = adminLoginService.mainReservationList();
			model.addAttribute("mainReservationList", mainReservationList);
			model.addAttribute("data");

			// 대여 리스트
			List<RentalVO> mainRentalList = adminLoginService.mainRentalList();
			model.addAttribute("mainRentalList", mainRentalList);
			model.addAttribute("data");

			mav.setViewName("admin/template/mainLayout");
			return mav;
		}
	}

	// 로그 아웃
	@RequestMapping(value = "/logout")
	public String adminLogout(HttpSession session, HttpServletRequest request) {
		// 세션 삭제
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/admin/login";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage_Chk(QuestionVO qvo, ReservationVO rvo, Model model,HttpServletRequest request) {

		// 1:1 문의 리스트
		List<QuestionVO> mainQuestionList = adminLoginService.mainQuestionList();
		model.addAttribute("mainQuestionList", mainQuestionList);
		model.addAttribute("data");

		// 예약리스트
		List<ReservationVO> mainReservationList = adminLoginService.mainReservationList();
		model.addAttribute("mainReservationList", mainReservationList);
		model.addAttribute("data");
		
		// 대여 리스트
		List<RentalVO> mainRentalList = adminLoginService.mainRentalList();
		model.addAttribute("mainRentalList", mainRentalList);
		model.addAttribute("data");

		return "admin/template/mainLayout";

	}

	// 로그인 화면을 보여주기 위한 메서드
		@RequestMapping(value = "/error", method = RequestMethod.GET)
		public String error() {
			System.out.println("에러 페이지 호출 성공");
			return "admin/error/adminerror";
		}
	
}
