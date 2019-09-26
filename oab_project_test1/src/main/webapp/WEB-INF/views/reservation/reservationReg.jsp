<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 기본CSS -->
<link href="/resources/include/css/contentLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
<link href="/resources/include/css/reservation.css" rel="stylesheet">
<link href="/resources/include/css/jquery-ui.min.css" rel="stylesheet">
<!--  -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css'
	rel='stylesheet'>
<!-- <link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
	rel='stylesheet' /> -->
<link href='/resources/include/fullcalendar/bootstrap/bootstrap.css'
	rel='stylesheet' />
<!--  -->
<link href='/resources/include/fullcalendar/core/main.css'
	rel='stylesheet' />
<link href='/resources/include/fullcalendar/daygrid/main.css'
	rel='stylesheet' />
<link href='/resources/include/fullcalendar/bootstrap/main.css'
	rel='stylesheet' />
<!--  -->
<script src='/resources/include/fullcalendar/core/main.js'></script>
<script src='/resources/include/fullcalendar/daygrid/main.js'></script>
<script src='/resources/include/fullcalendar/bootstrap/main.js'></script>
<script src='/resources/include/fullcalendar/google-calendar/main.js'></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									plugins : [ 'dayGrid', 'bootstrap',
											'googleCalendar' ],
									header : {
										left : '',
										center : 'title',
										right : 'today,prevYear,prev,next,nextYear'
									},
									titleFormat : { // will produce something like "Tuesday, September 18, 2018"
										month : 'long',
										year : 'numeric',
									},
									themeSystem : 'bootstrap',
									locale : 'ko',
									googleCalendarApiKey : 'AIzaSyArnJqCak6gfWlux_SnVtEIo2UgeOshR1U',
									eventSources : [
											// 대한민국의 공휴일
											{
												googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
												className : "koHolidays",
												color : "#ff4242",
												textColor : "#FFFFFF"
											},
											{
												googleCalendarId : "deecnlqcgl5raoa3rda5ot81a0@group.calendar.google.com",
												className : "OAB",
												color : "#0000FF",
												textColor : "#FFFF00"
											} ]
								/* events: {
									googleCalendarId: 'eu86uop7je06p27uoolvohcaec@group.calendar.google.com',
								} */
								});
						calendar.render();

					});
</script>
<!--  -->
<style type="text/css">
.fc-sat {
	background-color: #cae4ff;
}

.fc-sun {
	background-color: #ffcece;
}

.fc-today {
	background-color: #aaffaa;
}
</style>
<!--  -->
<script type="text/javascript"
	src="/resources/include/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/reservationReg_logic.js"></script>
<script type="text/javascript" src="/resources/include/js/datepicker.js"></script>
</head>
<body>
	<div class="reservation_calendar">
		<h4 style="display: block; text-align: center">영업 일정</h4>
		<div id="calendar"></div>
	</div>
	<div class="reservation_select">
		<form id="reservation_form">
			<p>${code}</p>
			<table>
				<tr>
					<td colspan="2">지점선택 : <select class="select_bname">
							<option value="여의도" selected>여의도점</option>
							<option value="뚝섬">뚝섬점</option>
							<option value="잠원">잠원점</option>
					</select> <input type="hidden" class="rest_bname" name="rest_bname"
						value="여의도"></td>
				</tr>
				<tr>
					<td colspan="2"><label class="reservation_label">이름 :
					</label><input type="text" placeholder="이름" name="rest_name"
						class="rest_name" onkeydown="return onlyString(event)"
						maxlength="15">
					<p class="res_name"></p></td>
				</tr>
				<tr>
					<td colspan="2"><label class="reservation_label">연락처 :
					</label><input type="text" placeholder="연락처" name="rest_phone"
						class="rest_phone" maxlength="11"
						onkeydown="return onlyNumber(event)" onkeyup='removeChar(event)'
						onblur='removeChar(event)' style='ime-mode: disabled;'>
					<p class="res_phone">-를 제외한 숫자만 입력해주세요.</p></td>
				</tr>
				<tr>
					<td>예약날짜 : <input id="reservation_date" type="text" readonly
						placeholder="날짜선택" class="reservation_date"></td>
					<td>예약시간 : <select class="rest_exptime"><option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
					</select> <input type="hidden" name="rest_exprent" class="rest_exprent">
					<p class="res_date"></p></td>
				</tr>
				<tr>
					<td colspan="2"><div id="setList">
							<c:choose>
								<c:when test="${not empty setList}">
									<select class="set_choice">
										<option selected disabled hidden>세트상품선택</option>
										<c:forEach var="setItem" items="${setList}" varStatus="status">
											<option class="item">${status.count + (param.page-1) * data.pageSize}.
												${setItem.pt_name}</option>
										</c:forEach>
									</select>
									<c:forEach var="setItem" items="${setList}" varStatus="status">
										<input class="set_number" type="hidden"
											value="${setItem.pt_number}">
										<input class="set_price" type="hidden"
											value="${setItem.pt_price}">
									</c:forEach>
								</c:when>
								<c:otherwise>
									등록된 상품이 존재하지 않습니다.
								</c:otherwise>
							</c:choose>
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><c:choose>
							<c:when test="${not empty addList}">
								<select class="add_choice">
									<option selected disabled hidden>추가상품선택</option>
									<c:forEach var="addItem" items="${addList}" varStatus="status">
										<option class="item">${status.count + (param.page-1) * data.pageSize}.
											${addItem.pt_name}</option>
									</c:forEach>
								</select>
								<c:forEach var="addItem" items="${addList}" varStatus="status">
									<input class="add_number" type="hidden"
										value="${addItem.pt_number}">
									<input class="add_price" type="hidden"
										value="${addItem.pt_price}">
								</c:forEach>
							</c:when>
							<c:otherwise>
									등록된 상품이 존재하지 않습니다.
								</c:otherwise>
						</c:choose>
						</p></td>
				</tr>
				<tr>
					<td colspan="2"><article class="agree_text">
							<h4 style="display: inline">개인정보 수집 안내</h4>
							<br /> <br />○ 개인정보의 수집의 목적 <br />- 본인 확인절차 <br />- 고지사항 전달,
							불만 처리 등을 위한 원활한 의사소통 경로의 확보 <br />- OAB 텐트 대여 서비스를 이용 시 발생하는 사항에
							있어서 이용자의 정보 확보 <br />- 기타 서비스를 이용하기 위하여 필요 <br /> <br />○ 개인정보
							수집 항목 <br />- 성명, 전화번호 (휴대폰, 전화번호) <br /> <br />○ 개인정보 보유기간 <br />-
							개인정보 보호법에 의거 법률로 정한 목적 이외의 다른 어떠한 목적으로도 사용되지 않으며 내부 규정에 의해 일정 기간
							저장 <br /> <br />○ 동의하지 않을 경우의 처리 <br />- 이용자는 개인정보 수집 동의에 거부할
							수 있으며, 이 경우 대여서비스이용이 불가합니다.
						</article> <br /> <label><input class="agree" type="checkbox"
							value="약관동의"><strong>본인은 개인정보 보호법 제15조에 의거하여 본인의
								개인정보를 제공할 것을 동의합니다.</strong></label>
					<p class="res_agree"></p></td>
				</tr>
				<tr>
					<td colspan="2"><div class="select_product">선택한 상품 :</div></td>
				</tr>
				<tr>
					<td colspan="2">총 비용 : <input name="rest_total"
						class="rest_total" type="text" value="0" readonly></td>
				</tr>
				<tr>
					<td colspan="2"><label class="reservation_label">결제방법
							: </label><label><input class="rest_payoption" type="radio"
							name="rest_payoption" value="카드" checked>카드</label><label><input
							class="rest_payoption" type="radio" name="rest_payoption"
							value="계좌이체">계좌이체</label></td>
				</tr>
				<tr>
					<td colspan="2"><p>이용안내(주의사항)</p>
						<p>● 세트 상품 선택 시에만 추가 상품 구매 가능</p>
						<p>● 이용 시간 안내 : 모든 세트 결제 완료 후 4시간대여 가능</p>
						<p>● 이용 시간 초과금 안내 : 1시간 초과당 3천원 비용 부가</p>
						<p>● 이용 반납은 오후 10시까지입니다.</p>
						<p>● 환불 안내 : 예약시간 1시간 전에 취소, 기상악화로 인한 취소는 100% 환불</p>
						<p>대여 예약 시간 초과시 환불은 30분전까지며 50% 환불 가능</p>
						<p>● 한강 공원 규정 상 텐트의 양면 문을 개방되어야 하며, 오후 7시 이후 과태료가 부가될 수 있습니다.</p>
						<p>● 오후 7시에는 단속으로 과태료가 부과 될 수 있으니 유의하시길 바랍니다.</p>
						<p>● [한강공원 잔디] 규정상 잔디 훼손으로 인한 텐트 고정 설치가 금지되어있습니다.</p></td>
				</tr>
				<tr>

					<td colspan="2"><c:if test="${login.mt_id != null }">
							<input type="button" class="btn_reservation" value="예약신청">
						</c:if> <c:if test="${login.mt_id == null }">
							<input type="button" value="예약신청"
								onclick="alert('예약은 로그인후에 가능합니다.')">
						</c:if></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>