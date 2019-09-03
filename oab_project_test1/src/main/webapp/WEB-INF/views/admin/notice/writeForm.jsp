<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		// 저장 버튼 클릭 시 처리 이벤트 
		$("#noticeInsertBtn").click(function() {
			$("#f_writeForm").submit();
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#noticeListBtn").click(function() {
			location.herf = "/notice/noticeList.do";
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
</head>
<body>

	<div class="main_content">
		<div class="contentTit">
			<h3>공지사항 등록하기</h3>

			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm">
					<table id="noticeWrite">

						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
						<tr>
							<th class="ac">글제목</th>
							<td><input type="text" name="nt_title" id="nt_title"></td>
						</tr>
						<tr>
							<th class="ac">작성자</th>
							<td><input type="text" name="nt_writer" id="nt_writer"></td>
						</tr>
						<tr>
							<th class="ac vm">내용</th>
							<td><textarea name="nt_content" id="nt_content"></textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div class="contentBtn">
				<input type="button" value="등록" class="but" id="noticeInsertBtn"><input
					type="button" value="취소" class="but" id="noticeListBtn">
			</div>

		</div>
	</div>

</body>
</html>