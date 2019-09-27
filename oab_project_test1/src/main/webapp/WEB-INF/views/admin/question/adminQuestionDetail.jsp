<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 목록</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/question.css" />
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/admin/reply.js"></script>
<script type="text/javascript">
	$(function() {

		// 해당 1:1문의 글이 답글일 경우에만 수정 버튼을 보여줌 
		if ($("#qt_writer").val() == "관리자") {
			document.getElementById("replyUpdateBtn").style.display = "block";
		} else {
			document.getElementById("replyUpdateBtn").style.display = "none";
		}

		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		var file = "<c:out value='${detail.qt_file}'/>";
		if (file != "") {
			$("#fileImage").attr({
				src : "/uploadStorage/qt_file/${detail.qt_file}",
				width : "250px",
				height : "100px"
			});
		}

		// 삭버튼 클릭 시 처리 이벤트 
		$("#questionDeleteBtn").click(function() {

			if (confirm("해당 문의 사항을 삭제하시겠습니까?")) {

				$("#f_data").attr({
					"method" : "post",
					"action" : "/admin/question/questionDelete"
				});

				$("#f_data").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#questionListBtn").click(function() {
			location.href = "/admin/question/questionList";
		});

		// 답글쓰기 버튼 클릭 시 처리 이벤트
		$("#replyUpdateBtn").click(function() {

			$("#f_data").attr({
				"methode" : "post",
				"action" : "/admin/question/replyUpdateForm"
			});

			$("#f_data").submit();
		});

	});
</script>
</head>
<body>
	<input type="hidden" id="qt_writer" value="${detail.qt_writer }">
	<input type="hidden" id="qt_status" value="${detail.qt_status }">
	<div class="main_content">

		<div class="contentTit">
			<h3>1:1 문의 상세보기</h3>
		</div>

		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="qt_number" value="${detail.qt_number }" />
			<input type="hidden" name="qt_file" id="qt_file"
				value="${detail.qt_file}" /> <input type="hidden" name="mt_id"
				id="mt_id" value="${detail.mt_id}" />
		</form>

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
					<tr id="Q_detail">
						<th class="ac" height="35px">글번호</th>
						<td id="number">${detail.qt_number }</td>
						<th class="ac">작성자</th>
						<td>${detail.qt_writer }</td>
						<th class="ac">작성일</th>
						<td>${detail.qt_regdate }</td>
					</tr>
					<tr id="Q_detail">
						<th class="ac" id="title_size" height="35px">제목</th>
						<td colspan="5" id="title_size">${detail.qt_title }</td>
					</tr>
					<tr id="Q_detail">
						<th class="ac" id="content_size" height="350px">내용</th>
						<td colspan="3" id="content_size">${detail.qt_content }</td>
						<th>첨부파일 이미지</th>
						<td><img id="fileImage"></td>
						<c:if test="${detail.qt_file != ''}">
						</c:if>
					</tr>
				</tbody>
			</table>

		</div>


		<div class="contentBtn">
			<input type="button" value="삭제" class="but" id="questionDeleteBtn">
			<input type="button" value="목록" class="but" id="questionListBtn">
			<input type="button" value="답글쓰기" class="but" id="replyWriteBtn">
			<input type="button" value="글 수정" class="but" id="replyUpdateBtn">
		</div>

	</div>

</body>
</html>