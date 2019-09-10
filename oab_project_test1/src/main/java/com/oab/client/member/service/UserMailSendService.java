package com.oab.client.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.oab.client.common.util.BCrypt;
import com.oab.client.common.util.MailUtils;
import com.oab.client.common.util.Util;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.dao.MemberDao;
import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;

@Service
public class UserMailSendService {

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

			
			if ((num >= 48 && num <= 57) && sb.length() <= (size/2)) {
				sb.append((char) num);
			}
			if((num >= 65 && num <= 90) || (num >= 97 && num <= 122) && sb.length() >= (size/2)) {
				sb.append((char) num);
			}
				continue;
			
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

	public void sendMailPassword(LoginVO lvo) throws Exception {
		MemberSecurity sec = new MemberSecurity();
		String salt = Util.getRandomString();
		sec.setMt_id(lvo.getMt_id());
		sec.setSalt(salt);
		
		memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("난수 값 넣기");
		String prePw=getKey(false, 8);
		String pw = null;
		System.out.println("암호화 전 "+prePw);
		pw= new String(BCrypt.getSHA256(prePw, sec.getSalt()));
		System.out.println("암호화 후 " + pw);
		lvo.setMt_pw(pw);
		int securityresult = memberDao.securityPwUpdate(sec);
		int memberresult = memberDao.memberPwUpdate(lvo);
		System.out.println("pw 수정 이메일 보내기");
		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);

		System.out.println("이메일 보내기");
		sendMail.setSubject("[OAB TENT] 비밀번호 찾기 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>귀하.</p>")
				.append("<p>")
				.append(prePw)
				.append("</p>").toString());
		sendMail.setFrom("OABTENT ", "admin");
		sendMail.setTo(lvo.getMt_email());
		sendMail.send();
	}
	
	public void sendMailId(MemberVO mvo) throws Exception {

		memberDao = sqlSession.getMapper(MemberDao.class);
		mvo = memberDao.memberIdselect(mvo);
		System.out.println("id 수정 이메일 보내기");
		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		System.out.println(mvo.getMt_email());
		System.out.println("이메일 보내기");
		sendMail.setSubject("[OAB TENT] 비밀번호 찾기 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<p>")
				.append(mvo.getMt_id())
				.append("</p>").toString());
		sendMail.setFrom("OABTENT ", "admin");
		sendMail.setTo(mvo.getMt_email());
		sendMail.send();
	}

}