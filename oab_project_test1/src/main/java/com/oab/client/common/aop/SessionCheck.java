package com.oab.client.common.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.login.vo.LoginVO;

@Aspect
@Component
public class SessionCheck {
	//관리자용 포인트 컷
	@Pointcut("execution(* com.oab.admin..*Controller.*_Chk(..))")
	public void adminPointCut() {}
	
	
	//사용자 포인트 컷
	@Pointcut("execution(* com.oab.client..*Controller.*Chk(..))")
	public void clientPointCut() {}
	
	//관리자 Around
	@Around("adminPointCut()")
	public Object adminSessionCheck(ProceedingJoinPoint pjp) throws Throwable {
		HttpServletRequest request = null;
		Model model = null;
		ModelAndView mav = new ModelAndView();
		Object result = null;
		for (Object o : pjp.getArgs()) {
			if (o instanceof HttpServletRequest) {
				request = (HttpServletRequest) o;
			} else if (o instanceof Model) {
				model = (Model) o;
			}
		}
		if (request != null) {
			HttpSession session = request.getSession();
			AdminLoginVO alvo = (AdminLoginVO) session.getAttribute("adminLogin");

			try {
				alvo.getAdminID();
			} catch (Exception e) {
				  
	            if( pjp.getSignature().toString().contains("ModelAndView") ) {
	               mav.setViewName("admin/login");
	               return mav;
	            }

				return "admin/login";
			}
		}
		result = pjp.proceed();
		// }
		return result;
	}
	
	//사용자 Around
	@Around("clientPointCut()")
	public Object clientSessionCheck(ProceedingJoinPoint pjp) throws Throwable {
		HttpServletRequest request = null;
		Model model = null;
		ModelAndView mav = new ModelAndView();
		Object result = null;
		for (Object o : pjp.getArgs()) {
			if (o instanceof HttpServletRequest) {
				request = (HttpServletRequest) o;
			} else if (o instanceof Model) {
				model = (Model) o;
			}
		}
		if (request != null) {
			HttpSession session = request.getSession();
			LoginVO lvo = (LoginVO) session.getAttribute("login");
			
			try {
				lvo.getMt_id();
			} catch (Exception e) {
				
				if( pjp.getSignature().toString().contains("ModelAndView") ) {
		               request.setAttribute("logincheck", "로그인이 필요한 이용 입니다.");
		               mav.setViewName("login/login");
		               return mav;
		            }
		            request.setAttribute("logincheck", "로그인이 필요한 이용 입니다.");
		            return "login/login";
			}
		}
		result = pjp.proceed();
		// }
		return result;
	}

}
