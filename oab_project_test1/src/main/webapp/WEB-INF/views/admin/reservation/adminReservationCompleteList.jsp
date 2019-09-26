<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 검색후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
			$("#searchBox").val("<c:out value='${data.searchBox}' />")
		}

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});

		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		$(".order").click(function() {
			var order_by = $(this).attr("data-value");
			alert("선택값 : " + order_by);
			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC') {
				$("#order_sc").val('ASC');
			} else {
				$("#order_sc").val('DESC');
			}
			goPage(1);
		});

		$("#pageSize").change(function() {
			goPage(1);
		});
		//상태변경하는select
		//document.getElementById("updateStatus").style.display="none";
		$(".updateRest_status").click(function() {
			var rest_number = $(this).parents("tr").attr("data-num");
			var pt_number = $(this).parents("tr").attr("data-ptnumber");
			var mt_id = $(this).parents("tr").attr("data-value");
			var rest_statusCheck = $(this).parents("tr").attr("data-rest_status");
			$("#rest_statusCheck").val(rest_statusCheck)
			$("#pt_number").val(pt_number);
			$("#rest_number").val(rest_number);
			$("#update_rest_number").val(rest_number);
			$("#mt_id").val(mt_id);
		});

		$("#statusSelect").click(function() {
			if ($("#rest_statusCheck").val() == null || $("#rest_statusCheck").val() == '') {
	            alert("상태를 변경할 리스트를 선택하세요.");
	         }else{
	        	 
			var rest_status = $("#selectBox").val()
			$("#rest_status").val(rest_status);
			$("#reservationStatusUpdate").attr({
				"method" : "post",
				"action" : "/admin/reservation/adminReservationStatusUpdate"
			});
			$("#reservationStatusUpdate").submit();
	         }
		});

		$("#rentalBtn").click(function() {
			if ($("#rest_statusCheck").val() == null || $("#rest_statusCheck").val() == '') {
	            alert("상태를 변경할 리스트를 선택하세요.");
	         }else{
	        	 
			$("#rentalInsert").attr({
				"method" : "post",
				"action" : "/admin/rental/adminRentalInsert"
			});
			$("#rentalInsert").submit();
	         }
		});
	});

	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#reservationSearch").attr({
			"method" : "get",
			"action" : "/admin/reservation/adminReservationCompleteList"
		});
		$("#reservationSearch").submit();
	}

	//키워드 체크
	function chkSubmit(item, msg) {
		if (item.val().replace(/\s/g, "") == "") {
			alert(msg + " 입력해 주세요");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/reservation.css" />
</head>
<body>

	<div class="main_content">

		<div class="contentTit">
			<h2>예약 완료</h2>
		</div>
		<form id="rentalInsert">
			<input type="hidden" id="pt_number" name="pt_number"> <input
				type="hidden" id="mt_id" name="mt_id"> <input type="hidden"
				id="update_rest_number" name="rest_number"> <input
				type="hidden" id="rent_status" name="rent_status" value="대여중">
			<input type="hidden" id="update_rest_status" name="rest_status"
				value="예약종료">
		</form>


		<form id="reservationStatusUpdate">
		<input type="hidden" id="rest_statusCheck">
			<input type="hidden" id="rest_number" name="rest_number"> <input
				type="hidden" id="rest_status" name="rest_status"> <input
				type="hidden" id="url" name="url"
				value="/admin/reservation/adminReservationCompleteList?page=1&order_by=rest_status&order_sc=ASC">
		</form>

		<div id="updateStatus">
			<label>예약상태 변경</label> <select id="selectBox" name="selectBox">
				<option value="환불요청">환불요청</option>
				<option value="예약대기">예약대기</option>
			</select> <input type="button" value="선택" id="statusSelect"> <input
				type="button" value="대여" id="rentalBtn">
		</div>


		<div class="contentTB">
			<table>
				<colgroup>
					<col width="50px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="170px" />
					<col width="100px" />
					<col width="100px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr id="list_th">
						<th></th>
						<th data-value="rest_bnumber" class="order">묶음번호 <c:choose>
								<c:when
									test="${data.order_by=='rest_bnumber' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_bnumber' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>예약번호</th>
						<th>회원아이디</th>
						<th>상품번호</th>
						<th data-value="rest_bname" class="order">지점명 <c:choose>
								<c:when
									test="${data.order_by=='rest_bname' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_bname' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th data-value="rest_name" class="order">예약자명 <c:choose>
								<c:when
									test="${data.order_by=='rest_name' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_name' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th data-value="rest_phone" class="order">연락처 <c:choose>
								<c:when
									test="${data.order_by=='rest_phone' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_phone' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th data-value="rest_status" class="order">예약상태 <c:choose>
								<c:when
									test="${data.order_by=='rest_status' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_status' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>이용금액</th>
						<th data-value="rest_exprent" class="order">대여예상일시 <c:choose>
								<c:when
									test="${data.order_by=='rest_exprent' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_exprent' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th data-value="rest_payoption" class="order">결제방법 <c:choose>
								<c:when
									test="${data.order_by=='rest_payoption' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_payoption' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th data-value="rest_regdate" class="order">등록일 <c:choose>
								<c:when
									test="${data.order_by=='rest_regdate' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rest_regdate' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty adminReservationCompleteList}">
							<c:forEach var="reservationComplete"
								items="${adminReservationCompleteList}" varStatus="status">
								<tr data-num="${reservationComplete.rest_number}"
									data-ptnumber="${reservationComplete.pt_number}"
									data-value="${reservationComplete.mt_id}"
									data-rest_status="${reservationComplete.rest_status}" id="list_th">
									<td><input type="radio" class="updateRest_status"
										name="updateRest_status"></td>
									<td>${reservationComplete.rest_bnumber}</td>
									<td>${reservationComplete.rest_number}</td>
									<td>${reservationComplete.mt_id}</td>
									<td>${reservationComplete.pt_number}</td>
									<td>${reservationComplete.rest_bname}</td>
									<td>${reservationComplete.rest_name}</td>
									<td>${reservationComplete.rest_phone}</td>
									<td>${reservationComplete.rest_status}</td>
									<td>${reservationComplete.rest_total}</td>
									<td>${reservationComplete.rest_exprent}</td>
									<td>${reservationComplete.rest_payoption}</td>
									<td>${reservationComplete.rest_regdate}</td>
									<td>${reservationComplete.rest_count}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>

		</div>

		<div id="reservationPaging">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>

		<div class="reservationSearch">
			<form id="reservationSearch">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="pageSize" name="pageSize"
					value="${data.pageSize}"> <input type="hidden"
					id="order_by" name="order_by" value="${data.order_by}" /> <input
					type="hidden" id="order_sc" name="order_sc"
					value="${data.order_sc}" />
				<table summary="검색" id="search_tbl">
					<colgroup>
						<col width="50px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="170px" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
					</colgroup>
					<tr>
						<td><select id="search" name="search">
								<option value="all">전체</option>
								<option value="rest_number">예약번호</option>
								<option value="rest_bnumber">묶음번호</option>
								<option value="mt_id">회원아이디</option>
						</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
							<select id="searchBox" name="searchBox">
								<option value="전체">전체</option>
								<option value="여의도">여의도</option>
								<option value="뚝섬">뚝섬</option>
								<option value="잠원">잠원</option>
						</select> <input type="button" value="검색" id="searchData"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>