<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="header_logo">
	<h2>메인로고</h2>
	<a href="/"><img src="/resources/images/main_logo.png"></a>
</div>
<nav class="header_nav">
	<h2>상단네비</h2>
	<div class="header_nav2">
		<c:choose>
			<c:when test="${login.mt_id == null or login.mt_id == ''}">
				<a href="/login/login"><span>로그인|</span></a>
			</c:when>
			<c:when test="${login.mt_id != null or login.mt_id != ''}">
				<a href="/login/logout"><span>로그아웃|</span></a>
			</c:when>
		</c:choose>
		<a href="/member/join"><span>회원가입|</span></a> <a href="/admin/login"><span>관리자
				페이지</span></a>
	</div>
</nav>
<nav class="header_menu">
	<h2>메인메뉴</h2>
	<ul class="navi">
		<li><a href="/greeting/greetingPage"> <img
				src="/resources/images/icon/greeting.PNG" class="icon"> OAB소개
		</a>
			<ul>
				<li><a href="/notice/noticeList"><img
						src="/resources/images/icon/notice.PNG" class="icon">공지사항</a></li>
				<li><a href="/branch/branchPage"><img
						src="/resources/images/icon/branch.PNG" class="icon">지점안내</a></li>
			</ul></li>
		<li><a href="/product/productList"><img
				src="/resources/images/icon/tent.PNG" class="icon">대여서비스</a>
			<ul>
				<li><a href="/product/productList"> <img
						src="/resources/images/icon/tent.PNG" class="icon"> 대여상품
				</a></li>
				<li><a href="/review/reviewList"> <img
						src="/resources/images/icon/photo.PNG" class="icon"> 포토후기
				</a></li>
			</ul></li>
		<li><a href="/member/info/memberUserInfo"> <img
				src="/resources/images/icon/mypage.PNG" class="icon"> 마이페이지
		</a>
			<ul>
				<li><a href="/member/info/memberUserInfo"> <img
						src="/resources/images/icon/mypage.PNG" class="icon"> 내 이용정보
				</a></li>
				<li><a href="/member/memberModify"><img
						src="/resources/images/icon/member.PNG" class="icon">내 정보수정</a></li>
				<li><a href="/member/memberSecede"><img
						src="/resources/images/icon/secede.PNG" class="icon">회원 탈퇴</a></li>
			</ul></li>
		<li><a href="/faq/faqPage"><img
				src="/resources/images/icon/faq.PNG" class="icon">고객센터</a>
			<ul>
				<li><a href="/faq/faqPage"><img
						src="/resources/images/icon/faq.PNG" class="icon">자주묻는질문</a></li>
				<li><a href="/question/questionWrite"><img
						src="/resources/images/icon/question.PNG" class="icon">1:1
						문의</a></li>
				<li><a href="/question/questionList"><img
						src="/resources/images/icon/question.PNG" class="icon">내가 한
						문의</a></li>
				<li><a href="/login/find"><img
						src="/resources/images/icon/find.PNG" class="icon">ID/PW찾기</a></li>
			</ul></li>
	</ul>
</nav>