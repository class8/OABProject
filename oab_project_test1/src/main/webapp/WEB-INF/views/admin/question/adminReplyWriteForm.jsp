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
			} else if (confirm(" 해당 공지사항을 등록하시겠습니까?")) {
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/question/replyInsert"
				});

				$("#f_writeForm").submit();
			}
		});

		/* // 목록 버튼 클릭 시 처리 이벤트 
		$("#noticeListBtn").click(function() {
			location.href = "/admin/notice/noticeList";
		}); */
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
</head>
<body>

	<div class="main_content">
		<div class="contentTit">
			<h3>댓글 등록하기</h3>
		</div>

		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm">
				<input type="hidden" name="qt_number" value="${question.qt_number }" />
				<input type="hidden" name="qt_step" id="qt_step"
					value="${question.qt_step}" /> <input type="hidden"
					name="qt_level" id="qt_level" value="${question.qt_level}" /> <input
					type="hidden" name="qt_root" id="qt_root"
					value="${question.qt_root}" />

				<table id="noticeWrite" border="1">

					<colgroup>
						<col width="250px" />
						<col width="250px" />
						<col width="250px" />
						<col width="250px" />
					</colgroup>
					<tr id="write_tbl">
						<th class="ac">원글번호</th>
						<td><input type="text" name="qt_number" id="qt_number"
							value="${question.qt_root }"></td>
						<th class="ac">원글작성자</th>
						<td><input type="text" name="mt_id" id="mt_id"
							value="${question.mt_id }"></td>
						<th class="ac">글제목</th>
						<td><input type="text" name="qt_title" id="qt_title"
							value="---▶"></td>
					</tr>
					<tr id="write_tbl">
						<th class="ac">카테고리</th>
						<td><input type="text" name="qt_status" id="qt_status" value=" "></td>
						<th class="ac">작성자</th>
						<td><input type="text" name="qt_writer" id="qt_writer"
							value="관리자"></td>
					</tr>
					<tr id="write_tbl">
						<th class="ac vm">내용</th>
						<td colspan="3"><textarea name="qt_content" id="qt_content"></textarea>
					</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="등록" class="but" id="replyInsertBtn">
			<!-- <input
				type="button" value="취소" class="but" id="noticeListBtn"> -->
		</div>

	</div>

</body>
</html>