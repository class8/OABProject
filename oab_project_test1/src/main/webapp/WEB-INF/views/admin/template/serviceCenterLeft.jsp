
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${adminLogin.adminID != null}">
	<div class="left">

		<h3 align="center">SERVICE CENTER</h3>
		<ul>

			<li><a href="/admin/question/questionList">1:1 문의</a></li>
			<li><a href="/admin/notice/noticeList">공지사항</a></li>
			<li><a href="/admin/review/reviewList">포토 후기</a></li>

		</ul>
	</div>
</c:if>