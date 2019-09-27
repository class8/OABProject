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
		$(".updateRental").click(
	            function() {
	               var rent_number = $(this).parents("tr").attr("data-num");
	               var rest_number = $(this).parents("tr").attr(
	                     "data-restnumber");
	               var rent_expretrun = $(this).parents("tr").attr(
	                     "data-rent_expretrun");
	               var rent_status = $(this).parents("tr").attr(
	                     "data-rent_status");
	               $("#rent_status").val(rent_status);
	               $("#rent_expretrun").val(rent_expretrun);
	               $("#rent_number").val(rent_number);
	               $("#rest_number").val(rest_number);
	            });

	      $("#rentalCancel").click(function() {
	         if ($("#rent_status").val() == '') {
	            alert("상태를 변경할 리스트를 선택해주세요.");
	         } else if ($("#rent_status").val() == '반납완료') {
	            alert("반납완료인 예약건을 취소할수 없습니다.");
	         } else if (confirm("대여취소 하시겠습니까?")) {
	               $("#rentalListVerification").attr({
	                  "method" : "post",
	                  "action" : "/admin/rental/adminRentalDelete"
	               });
	               $("#rentalListVerification").submit();
	         }
	      });

	      $("#rentalSuccess").click(function() {
	         if ($("#rent_status").val() == '') {
	            alert("상태를 변경할 리스트를 선택해주세요.");
	         } else if ($("#rent_status").val() == '반납완료') {
	            alert("반납완료인 예약건을 반납완료 시킬수 없습니다.");
	         } else if(confirm("반납완료 하시겠습니까?")) {
	            $("#rentalListVerification").attr({
	               "method" : "post",
	               "action" : "/admin/rental/adminRentalModify"
	            });
	            $("#rentalListVerification").submit();
	         }
	      });

	});

	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#rentalSearch").attr({
			"method" : "get",
			"action" : "/admin/rental/adminRentalList"
		});
		$("#rentalSearch").submit();
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
			<h2>대여 정보</h2>
		</div>
		<form id="rentalListVerification">
			<input type="hidden" id="rent_expretrun" name="rent_expretrun" /> <input
				type="hidden" id="rent_number" name="rent_number"> <input
				type="hidden" id="rest_number" name="rest_number"> <input
				type="hidden" id="rest_status" name="rest_status" value="예약완료">
				<input type="hidden" id="rent_status">
		</form>

		<div id="rentalUpdate">
			<input type="button" value="대여취소" id="rentalCancel"> <input
				type="button" value="반납완료" id="rentalSuccess">
		</div>


		<div class="contentTB">
			<table>
				<colgroup>
					<col width="50px" />
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="170px" />
					<col width="120px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr id="list_th">
						<th></th>
						<th>묶음번호</th>
						<th>회원아이디</th>
						<th>예약자명</th>
						<th>연락처</th>
						<th>상품명</th>
						<th>수량</th>
						<th>총액</th>
						<th>지점명</th>
						<th data-value="rent_status" class="order">대여상태 <c:choose>
								<c:when
									test="${data.order_by=='rent_status' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rent_status' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>실대여일</th>
						<th data-value="rent_expretrun" class="order">반납예상일 <c:choose>
								<c:when
									test="${data.order_by=='rent_expretrun' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rent_expretrun' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>초과시간</th>
						<th>추가금액</th>
						<th data-value="rent_actretrun" class="order">실반납일 <c:choose>
								<c:when
									test="${data.order_by=='rent_actretrun' and data.order_sc == 'ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='rent_actretrun' and data.order_sc == 'DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty adminRentalList}">
							<c:forEach var="rentalList" items="${adminRentalList}"
								varStatus="status">
								<tr data-num="${rentalList.rent_number}"
									data-restnumber="${rentalList.rest_number}"
									data-rent_expretrun="${rentalList.rent_expretrun}" 
									data-rent_status="${rentalList.rent_status }" id="list_th">
									<td><input type="radio" class="updateRental"
										name="updateRental"></td>
									<td>${rentalList.rest_bnumber}</td>
									<td>${rentalList.mt_id}</td>
									<td>${rentalList.rest_name}</td>
									<td>${rentalList.rest_phone}</td>
									<td>${rentalList.pt_name}</td>
									<td>${rentalList.rest_count}</td>
									<td>${rentalList.rest_total}</td>
									<td>${rentalList.rest_bname}</td>
									<td>${rentalList.rent_status}</td>
									<td>${rentalList.rent_actrent}</td>
									<td>${rentalList.rent_expretrun}</td>
									<td>${rentalList.rent_overtime}</td>
									<td>${rentalList.rent_addcost}</td>
									<td>${rentalList.rent_actretrun}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div id="rentalPaging">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>

		<div class="reservationSearch">
			<form id="rentalSearch">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="pageSize" name="pageSize"
					value="${data.pageSize}"> <input type="hidden"
					id="order_by" name="order_by" value="${data.order_by}" /> <input
					type="hidden" id="order_sc" name="order_sc"
					value="${data.order_sc}" />
				<table summary="검색" id="search_tbl">
					<colgroup>
						<col width="6%" />
						<col width="8%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="11%" />
						<col width="8%" />
						<col width="6%" />
						<col width="13%" />
					</colgroup>
					<tr>
						<td><select id="search" name="search">
								<option value="all">전체</option>
								<option value="rest_bnumber">예약묶음번호</option>
								<option value="rest_name">예약자이름</option>
								<option value="rest_phone">예약자핸드폰번호</option>
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