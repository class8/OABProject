<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		// 저장 버튼 클릭 시 처리 이벤트 
		$("#updateBtn").click(function() {

			if ($("#qt_content").val() == "") {
				alert("내용을 입력하세요");
				$("#qt_content").focus();
			} else if (confirm("수정이 완료되었습니다.")) {
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/question/replyUpdate"
				});

				$("#f_writeForm").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#replyListBtn").click(function() {
			location.href = "/admin/question/questionList";
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/question.css" />
</head>
<body>

	<div class="main_content">
		<div class="contentTit">
			<h3>댓글 수정하기</h3>
		</div>

		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm">
				<input type="hidden" name="qt_number"
					value="${replyUpdateForm.qt_number }" />

				<table id="replyUpdate" border="1">

					<colgroup>
						<col width="200px" />
						<col width="300px" />
						<col width="200px" />
						<col width="300px" />
					</colgroup>
					<tr id="reply">
						<th class="ac">글제목</th>
						<td>${replyUpdateForm.qt_title }</td>
						<th class="ac">원글 작성자</th>
						<td>${replyUpdateForm.mt_id }</td>
					</tr>
					<tr id="reply">
						<th class="ac">카테고리</th>
						<td>${replyUpdateForm.qt_status }</td>
						<th class="ac">답글 작성자</th>
						<td>${replyUpdateForm.qt_writer }</td>
					</tr>
					<tr id="reply">
						<th class="ac vm">내용</th>
						<td colspan="3"><textarea name="qt_content" id="qt_content">${replyUpdateForm.qt_content }</textarea>
					</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="수정완료" class="but" id="updateBtn">
			<input type="button" value="취소" class="but" id="replyListBtn">
		</div>

	</div>

</body>
</html>