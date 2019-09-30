<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/admin/notice.js"></script>
<script type="text/javascript">
	$(function() {

		// 삭제버튼 클릭 시 처리 이벤트 
		$("#noticeDeleteBtn").click(function() {

			if (confirm(" 해당 공지사항을 삭제하시겠습니까?")) {

				$("#f_data").attr({
					"method" : "post",
					"action" : "/admin/notice/noticeDelete"
				});

				$("#f_data").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#noticeListBtn").click(function() {
			location.href = "/admin/notice/noticeList";
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
</head>
<body>

	<div class="main_content">

		<div class="contentTit">
			<h2>공지사항 상세보기</h2>
		</div>

		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="nt_number" value="${detail.nt_number }" />
		</form>

		<div class="contentTB_D">
			<table id="notice_detail">
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="250px" />
				</colgroup>

				<tbody>
					<tr id="detail_th">
						<th class="ac" height="30px">글번호</th>
						<td id="number">${detail.nt_number }</td>
						<th class="ac">작성자</th>
						<td>${detail.nt_writer }</td>
						<th class="ac">작성일</th>
						<td>${detail.nt_regdate }</td>
					</tr>
					<tr id="detail_th">
						<th class="ac" id="title_size" height="30px">제목</th>
						<td colspan="5" id="title_size">${detail.nt_title }</td>
					</tr>
					<tr id="detail_th">
						<th class="ac" id="content_size" height="350px">내용</th>
						<td colspan="5" id="content_size">${detail.nt_content }</td>
					</tr>
				</tbody>
			</table>

		</div>

		<div></div>

		<div class="contentBtn">
			<input type="button" value="수정" class="but" id="noticeUpdateBtn"><input
				type="button" value="삭제" class="but" id="noticeDeleteBtn"> <input
				type="button" value="목록" class="but" id="noticeListBtn">
		</div>

	</div>

</body>
</html>