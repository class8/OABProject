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
	<a href="/member/memberLogin"><span>로그인|</span></a>
	<a href="#"><span>로그아웃|</span></a>
	<a href="/member/memberJoin"><span>회원가입</span></a>
	</div>
</nav>
<nav class="header_menu">
	<h2>메인메뉴</h2>
	<ul class="navi">
		<li>OAB텐트 소개
			<ul>
				<li><a href="/greeting/greetingPage">인사말</a></li>
				<li><a href="/notice/noticeList">공지사항</a></li>
				<li><a href="/branch/branchPage">지점안내</a></li>
			</ul>
		</li>
		<li>이용안내
			<ul>
				<li><a href="/product/productList">상품소개</a></li>
				<li><a href="/reservation/reservationList">예약하기</a></li>
				<li><a href="/review/reviewList">포토후기</a></li>
			</ul>
		</li>
		<li>마이페이지
			<ul>
				<li><a href="/member/memberUseInfo">내 이용정보</a></li>
				<li><a href="/member/memberInfo">내 정보수정</a></li>
				<li><a href="/member/memberSecede">회원 탈퇴</a></li>
			</ul>
		</li>
		<li>고객센터
			<ul>
				<li><a href="/faq/faqPage">자주묻는질문</a></li>
				<li><a href="/question/questionWrite">1:1 문의</a></li>
				<li><a href="/question/questionList">내가 한 문의</a></li>
				<li><a href="/member/memberIdSearch">ID/PW찾기</a></li>
			</ul>
		</li>
	</ul>
</nav>