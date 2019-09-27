<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/adminLogin.js"></script>
<c:if test="${adminLogin.adminID != null}">
	<div class="header">

		<div id="logo">
			<a href="/admin/login"><img
				src="/resources/admin/images/logo.PNG" width="250px" height="149px"></a>
		</div>

		<nav id="logout">
			<button id="logoutBtn">로그아웃</button>
		</nav>

		<nav class="nav_topmenu">
			<ul id="main_menu">
				<!-- <li>HOME
					<ul id="sub_menu">
						<li><a href="/admin/login">HOME</a></li>
					</ul>
				</li> -->
				<li>상품관리
					<ul id="sub_menu">
						<li><a href="/admin/product/adminProductList?page=1">상품관리
						</a></li>
					</ul>
				</li>
				<li>회원정보
					<ul id="sub_menu">
						<li><a href="/admin/member/adminMemberList?page=1">회원정보
								관리</a></li>
						<li><a
							href="/admin/reservation/adminReservationWaitingList?page=1&order_by=rest_status&order_sc=ASC">예약정보
								관리</a></li>
						<li><a
							href="/admin/reservation/adminReservationRefundList?page=1&order_by=rest_status&order_sc=DESC">환불
								관리</a></li>
						<li><a
							href="/admin/rental/adminRentalList?page=1&order_by=rent_status&order_sc=ASC">대여/반납
								관리</a></li>
					</ul>
				</li>
				<li>고객센터
					<ul id="sub_menu">
						<li id="link"><a href="/admin/question/questionList">1:1
								문의 관리</a></li>
						<li id="link"><a href="/admin/notice/noticeList">공지사항 관리</a></li>
						<li id="link"><a href="/admin/review/reviewList">포토 후기 관리</a></li>
					</ul>
				</li>
				<li>통계정보
					<ul id="sub_menu">
						<li><a href="#">일별 매출</a></li>
						<li><a href="#">월별 매출</a></li>
						<li><a href="#">상품별 월 매출</a></li>
						<li><a href="#">상품별 일 매출</a></li>
						<li><a href="#">이용 회원별 년 매출</a></li>
						<li><a href="#">이용 회원별 월 매출</a></li>
						<li><a href="#">이용 회원 통계</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</c:if>
