package com.oab.client.mail.controller;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oab.client.common.util.BCrypt;
import com.oab.client.common.util.MailUtils;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.dao.MemberDao;
import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;

@Controller
public class MailController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;

	private MemberDao memberDao;

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 아이디 찾기
	@RequestMapping(value = "/sendMail/mt_id", method = RequestMethod.POST)
	public void sendMailId(HttpSession session, @RequestParam String mt_email, @RequestParam String captcha,
			RedirectAttributes ra, MemberVO mvo) throws MessagingException, UnsupportedEncodingException {
		//String captchaValue = (String) session.getAttribute("captcha");
		/*
		 * if (captchaValue == null || !captchaValue.equals(captcha)) {
		 * ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다."); return
		 * "redirect:/find/mt_id"; }
		 */

		System.out.println("아이디 찾기 이메일 보내기");

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);

		System.out.println("이메일 보내기");
		sendMail.setSubject("[OAB TENT] 회원가입 이메일 인증");
		try {
			sendMail.setText(new StringBuffer()
					.append("<h1>[OAB TENT]</h1>")
					.append("<p>")
					.append("귀하의 아이디는 ")
					.append(mvo.getMt_id())
					.append("</p>").toString());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setFrom("OAB TENT ", "admin");
		sendMail.setTo(mvo.getMt_id());
		sendMail.send();
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
	public void sendMailPassword(HttpSession session, LoginVO lvo) throws MessagingException, UnsupportedEncodingException {
		//@RequestParam String captcha, RedirectAttributes ra,
		System.out.println("비밀번호 찾기 이메일 보내기");
		
		String tem = null;
		tem = getKey(false, 8);
		lvo.setMt_pw(tem);
		lvo.setMt_id(lvo.getMt_id());
		lvo.setMt_name("1111");
		/*
		 * System.out.println(lvo.getMt_id()); System.out.println(lvo.getMt_pw());
		 */
		//memberDao.memberPwUpdate(lvo);
		
		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		
		System.out.println("이메일 보내기");
		sendMail.setSubject("[OAB TENT] 회원가입 이메일 인증");
		try {
			sendMail.setText(new StringBuffer()
					.append("<h1>[OAB TENT]</h1>")
					.append("<p>")
					.append("귀하의 임시 비밀번호는 ")
					.append(lvo.getMt_pw())
					.append("</p>").toString());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setFrom("OAB TENT ", "admin");
		sendMail.setTo(lvo.getMt_id());
		sendMail.send();
		
		
	}

}
