
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${adminLogin.adminID != null}">
<div class="left">

	<h3 align="center">ADMIN MAIMPAGE</h3>
	<ul>

		<li><a href="#">상품관리</a></li>
		<li><a href="#">회원정보</a></li>
		<li><a href="#">고객센터</a></li>
		<li><a href="#">통계관리</a></li>

	</ul>
</div>
</c:if>