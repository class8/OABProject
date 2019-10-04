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
				<a href="/login/login"><span>로그인</span></a>
			</c:when>
			<c:when test="${login.mt_id != null or login.mt_id != ''}">
				<a href="/login/logout"><span>로그아웃</span></a>
			</c:when>
		</c:choose>
			|
				<a href="/member/join"><span>회원가입</span></a>
	</div>
</nav>
<nav class="header_menu">
	<h2>메인메뉴</h2>
	<ul class="navi">
		<li><a href="/greeting/greetingPage"> <img
				src="/resources/images/icon/home.jpg" class="icon"><span>
					OAB소개</span>
		</a>
			<ul>
				<li><a href="/greeting/greetingPage"><img
						src="/resources/images/icon/greeting.jpg" class="icon"><span>
							인사말</span></a></li>
				<li><a href="/notice/noticeList"><img
						src="/resources/images/icon/notice.jpg" class="icon"><span>
							공지사항</span></a></li>
				<li><a href="/branch/branchPage"><img
						src="/resources/images/icon/branch.jpg" class="icon"><span>
							지점안내</span></a></li>
			</ul></li>
		<li><a href="/product/productList"><img
				src="/resources/images/icon/rental.jpg" class="icon"><span>
					대여</span></a>
			<ul>
				<li><a href="/product/productList"> <img
						src="/resources/images/icon/tent.jpg" class="icon"><span>
							대여상품</span>
				</a></li>
				<li><a href="/review/reviewList"> <img
						src="/resources/images/icon/photo.jpg" class="icon"><span>
							포토후기</span>
				</a></li>
			</ul></li>
		<li><a href="/member/info/memberUserInfo"> <img
				src="/resources/images/icon/mypage.jpg" class="icon"><span>
					마이페이지</span>
		</a>
			<ul>
				<li><a href="/member/info/memberUserInfo"> <img
						src="/resources/images/icon/myinfo.jpg" class="icon"><span>
							내 이용정보</span>
				</a></li>
				<li><a href="/member/memberModify"><img
						src="/resources/images/icon/member.jpg" class="icon"><span>
							내 정보수정</span></a></li>
				<li><a href="/member/memberSecede"><img
						src="/resources/images/icon/secede.jpg" class="icon"><span>
							회원 탈퇴</span></a></li>
			</ul></li>
		<li><a href="/faq/faqPage"><img
				src="/resources/images/icon/faq.jpg" class="icon"><span>
					고객센터</span></a>
			<ul>
				<li><a href="/faq/faqPage"><img
						src="/resources/images/icon/qna.jpg" class="icon"><span>
							자주묻는질문</span></a></li>
				<li><a href="/question/questionWrite"><img
						src="/resources/images/icon/question.jpg" class="icon"><span>
							1:1 문의</span></a></li>
				<li><a href="/question/questionList"><img
						src="/resources/images/icon/myquestion.jpg" class="icon"><span>
							내가 한 문의</span></a></li>
				<li><a href="/login/find"><img
						src="/resources/images/icon/find.jpg" class="icon"><span>
							ID/PW찾기</span></a></li>
			</ul></li>
	</ul>
</nav>