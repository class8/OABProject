
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left">

	<h3 align="center">MEMBER</h3>
	<ul>
		<li><a href="/admin/member/adminMemberList?page=1">회 원</a></li>
		<li><a href="/admin/reservation/adminReservationWaitingList?page=1&order_by=rest_status&order_sc=ASC">예약대기</a></li>
		<li><a href="/admin/reservation/adminReservationCompleteList?page=1&order_by=rest_status&order_sc=DESC">예약완료</a></li>
		<li><a href="/admin/reservation/adminReservationCancelList?page=1&order_by=rest_status&order_sc=ASC">예약취소</a></li>
		<li><a href="/admin/reservation/adminReservationRefundList?page=1&order_by=rest_status&order_sc=DESC">환 불</a></li>
		<li><a href="/admin/rental/adminRentalList?page=1&order_by=rent_status&order_sc=DESC">대여/반납</a></li>
	</ul>
</div>
