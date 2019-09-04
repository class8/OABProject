
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${adminLogin.adminID != null}">
<div class="left">

	<h3 align="center">DATA</h3>
	<ul>

		<li><a href="#">일별 매출</a></li>
		<li><a href="#">월별 매출</a></li>
		<li><a href="#">상품별 월 매출</a></li>
		<li><a href="#">상품별 일 매출</a></li>
		<li><a href="#">이용 회원별 년 매출</a></li>
		<li><a href="#">이용 회원별 월 매출</a></li>
		<li><a href="#">이용 회원 통계</a></li>

	</ul>
</div>
</c:if>