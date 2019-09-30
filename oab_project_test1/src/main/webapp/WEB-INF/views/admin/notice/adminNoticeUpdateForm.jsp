<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 화면</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		// 수정버튼 클릭 시 처리 이벤트 
		$("#noticeUpdateBtn").click(function() {

			if ($("#nt_title").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#nt_title").focus();
			} else if ($("#nt_content").val() == "") {
				alert("내용을 입력하세요");
				$("#nt_content").focus();
			} else {

				alert("공지사항 수정이 완료 되었습니다.");

				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/admin/notice/noticeUpdate"
				});
				$("#f_writeForm").submit();
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
</head>
<body>

	<div class="main_content">

		<div class="contentTit">
			<h3>공지사항 수정</h3>
		</div>

		<div class="contentTB_D">
			<form id="f_writeForm" name="f_writeForm">
				<input type="hidden" id="nt_number" name="nt_number"
					value="${updateData.nt_number }" />

				<table id="noticeupdate">

					<colgroup>
						<col width="150px" />
						<col width="150px" />
						<col width="150px" />
						<col width="150px" />
						<col width="150px" />
						<col width="250px" />
					</colgroup>
					<tr id="update">
						<th class="ac">글번호</th>
						<td>${updateData.nt_number }</td>
						<th class="ac">작성일</th>
						<td>${updateData.nt_regdate }</td>
						<th class="ac">작성자</th>
						<td>${updateData.nt_writer }</td>
					</tr>
					<tr id="update">
						<th class="ac">글제목</th>
						<td colspan="5"><input type="text" name="nt_title"
							id="nt_title" value="${updateData.nt_title }" /></td>
					</tr>
					<tr id="update">
						<th class="ac">내용</th>
						<td colspan="5"><textarea name="nt_content" id="nt_content">${updateData.nt_content }</textarea></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="수정" class="but" id="noticeUpdateBtn"><input
				type="button" value="목록" class="but" id="noticeListBtn">
		</div>

	</div>

</body>
</html>