
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${adminLogin.adminID != null}">
	<div class="left">

		<h3 align="center">ADMIN MAIMPAGE</h3>
		<ul>
			<li><a href="/admin/login">HOME</a></li>
			<li><a href="/admin/product/adminProductList?page=1">상 품</a></li>
			<li><a href="/admin/member/adminMemberList?page=1">회 원</a></li>
			<li><a href="/admin/question/questionList">고객센터</a></li>

		</ul>
	</div>
</c:if>

