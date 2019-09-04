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
		<a href="/"><img src="/resources/admin/images/logo.PNG" width="170px"
			height="100px"></a>
	</div>

	<nav id="logout">
		<button id="logoutBtn">로그아웃</button>
	</nav>

	<nav id="nav_topmenu">
		<ul>
			<li><a href="/admin/login">HOME </a></li>
			<li><a href="/admin/product/adminProductList?page=1">상품관리 </a></li>
			<li><a href="#">회원정보 </a></li>
			<li><a href="/admin/notice/noticeList">고객센터 </a></li>
			<li><a href="#">통계정보</a></li>
		</ul>
	</nav>
</div>
</c:if>
