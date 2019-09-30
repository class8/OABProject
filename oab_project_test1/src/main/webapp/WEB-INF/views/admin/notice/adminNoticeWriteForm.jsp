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
		$("#noticeInsertBtn").click(function() {

			if ($("#nt_title").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#nt_title").focus();
			} else if ($("#nt_content").val() == "") {
				alert("내용을 입력하세요");
				$("#nt_content").focus();
			} else if (confirm(" 해당 공지사항을 등록하시겠습니까?")) {
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/notice/noticeInsert"
				});

				$("#f_writeForm").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#noticeCancelBtn").click(function() {
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
			<h3>공지사항 등록</h3>
		</div>

		<div class="contentTB_D">
			<form id="f_writeForm" name="f_writeForm">
				<table id="noticeWrite">

					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
					<tr id="write_tbl">
						<th class="ac">글제목</th>
						<td><input type="text" name="nt_title" id="nt_title"></td>
					</tr>
					<tr id="write_tbl">
						<th class="ac vm">내용</th>
						<td><textarea name="nt_content" id="nt_content"></textarea>
					</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="등록" class="but" id="noticeInsertBtn"><input
				type="button" value="취소" class="but" id="noticeCancelBtn">
		</div>

	</div>

</body>
</html>