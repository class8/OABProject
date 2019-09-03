<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="header">

	<div id="logo">
		<a href="/"><img src="/resources/admin/images/logo.PNG" width="170px"
			height="100px"></a>
	</div>

	<nav id="logout">
		<button>로그아웃</button>
	</nav>

	<nav id="nav_topmenu">
		<ul>
			<li><a href="/admin">HOME </a></li>
			<li><a href="#">상품관리 </a></li>
			<li><a href="#">회원정보 </a></li>
			<li><a href="/admin/notice/noticeList">고객센터 </a></li>
			<li><a href="#">통계정보</a></li>
		</ul>
	</nav>
</div>
