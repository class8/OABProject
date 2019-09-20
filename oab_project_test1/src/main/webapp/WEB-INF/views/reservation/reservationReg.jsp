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
<link href="/resources/include/css/reset.css" rel="stylesheet">
<link href="/resources/include/css/contentLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
<link href="/resources/include/css/reservation.css" rel="stylesheet">
<link href="/resources/include/css/jquery-ui.min.css" rel="stylesheet">
<!--  -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css'
	rel='stylesheet'>
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
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
						                      googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
						                    , className : "koHolidays"
						                    , color : "#ff4242"
						                    , textColor : "#FFFFFF"
						                }
						                , {
						                      googleCalendarId : "deecnlqcgl5raoa3rda5ot81a0@group.calendar.google.com"
						                    , className : "OAB"
						                    , color : "#0000FF"
						                    , textColor : "#FFFF00"
						                }
						            ]
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
			<table>
				<tr>
					<td colspan="2"><select class="select_bname">
							<option value="여의도" selected>여의도점</option>
							<option value="뚝섬">뚝섬점</option>
							<option value="잠원">잠원점</option>
					</select> <input type="hidden" class="rest_bname" name="rest_bname"
						value="여의도"></td>
				</tr>
				<tr>
					<td colspan="2"><label class="reservation_label">이름 :
					</label><input type="text" placeholder="이름" name="rest_name"
						class="rest_name"></td>
				</tr>
				<tr>
					<td colspan="2"><label class="reservation_label">연락처 :
					</label><input type="text" placeholder="연락처" name="rest_phone"
						class="rest_phone" maxlength="11"></td>
				</tr>
				<tr>
					<td>예약날짜 : <input id="reservation_date" type="text" readonly
						placeholder="날짜선택" class="reservation_date"></td>
					<td>예약시간 : <select class="rest_exptime"><option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
					</select> <input type="hidden" name="rest_exprent" class="rest_exprent"></td>
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
						</c:choose></td>
				</tr>
				<tr>
					<td colspan="2"><label><input class="agree"
							type="checkbox" value="약관동의">약관동의</label></td>
				</tr>
				<tr>
					<td colspan="2"><div class="select_product">
							선택한 상품 :
							<!-- <input type="hidden" name="pt_number" class="pt_number"
								value=""><input type="hidden" name="rest_count"
								class="rest_count" value=""> -->
						</div></td>
				</tr>
				<tr>
					<td colspan="2">총 비용 : <br> <input name="rest_total"
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