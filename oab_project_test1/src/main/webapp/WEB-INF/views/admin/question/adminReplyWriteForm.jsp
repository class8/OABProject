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
		$("#replyInsertBtn").click(function() {

			if ($("#qt_title").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#qt_title").focus();
			} else if ($("#qt_content").val() == "") {
				alert("내용을 입력하세요");
				$("#qt_content").focus();
			} else if (confirm(" 해당 답글을 등록하시겠습니까?")) {
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/question/replyInsert"
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
			<h2>원글 정보</h2>
		</div>

		<div class="contentTB_D">
			<table id="notice_detail">
				<colgroup>
					<col width="150px" />
					<col width="180px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="320px" />
				</colgroup>

				<tbody>
					<tr id="detail">
						<th class="ac" height="30px">글번호</th>
						<td id="number">${question.qt_number }</td>
						<th class="ac">작성자</th>
						<td>${question.qt_writer }</td>
						<th class="ac">작성일</th>
						<td>${question.qt_regdate }</td>
					</tr>
					<tr id="detail">
						<th class="ac" id="title_size" height="30px">제목</th>
						<td colspan="5" id="title_size">${question.qt_title }</td>
					</tr>
					<tr id="detail">
						<th class="ac" id="content_size" height="250px">내용</th>
						<td colspan="3" id="content_size">${question.qt_content }</td>
						<th>첨부파일 이미지</th>
						<td><img id="fileImage"></td>
						<c:if test="${question.qt_file != ''}">
						</c:if>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="contentTit">
			<h2>답글 등록</h2>
		</div>

		<div class="contentTB_D">
			<form id="f_writeForm" name="f_writeForm">
				<input type="hidden" name="qt_number" id="qt_number"
					value="${question.qt_number }" /> <input type="hidden"
					name="qt_step" id="qt_step" value="${question.qt_step}" /> <input
					type="hidden" name="qt_level" id="qt_level"
					value="${question.qt_level}" /> <input type="hidden"
					name="qt_root" id="qt_root" value="${question.qt_number}" /><input
					type="hidden" name="mt_id" id="mt_id" value="${question.mt_id }">
				<table id="replyWrite">

					<colgroup>
						<col width="300px" />
						<col width="700px" />
					</colgroup>
					<tr id="reply">
						<th class="ac" height="30px">제목</th>
						<td><input type="text" name="qt_title" id="qt_title"></td>
					</tr>
					<tr id="reply">
						<th class="ac vm" height="250px">내용</th>
						<td><textarea name="qt_content" id="qt_content"></textarea>
					</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="등록" class="but" id="replyInsertBtn">
			<input type="button" value="취소" class="but" id="replyListBtn">
		</div>

	</div>

</body>
</html>