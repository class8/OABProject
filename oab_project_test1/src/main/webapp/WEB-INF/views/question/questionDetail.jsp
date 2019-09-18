<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 사항 상세 보기</title>
<link href="/resources/include/css/questionDetail.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 목록 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
		$("#back_questionListBtn").click(function() {

			location.href = "questionList"; //주소값
		});
	});
	$(function() {
		/* 수정 버튼을 누르면 수정창으로 이동합니다 */
		$("#update_questionBtn").click(function() {
			$("#qt_data").attr({
				"method" : "get",
				"action" : "/question/questionUpdateForm"
			});
			$("#qt_data").submit();
		});
	});

	$(function() {
		//첨부파일 이미지를 보여주기 위한 속성을 추가한다
		var file = "<c:out value='${detail.qt_file}'/>";
		if (file != "") {
			$("#fileImage").attr({
				src : "updateStorage/qt_file/${detail.qt_file}",
				width : "450px",
				height : "200px"
			});
		}
	})
	//삭제버튼
	$(function name() {
		$("#delete_questionBtn").click(function() {
			if (confirm("${detail.qt_title}" + "작성하신 문의 글을 정말 삭제하시겠습니까?")) {
				$("#qt_data").attr("action", "/question/questionList");
				$("#qt_data").submit();
			}
		});
	});
</script>
</head>
<body>


	<div class="contentContainer">
		<div class="contentsTit">
			<h3>내 문의글 상세보기</h3>
		</div>
		<form name="qt_data" id="qt_data">
			<input type="hidden" name="qt_number" value="${detail.qt_number}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<input type="hidden" name="pageSize" id="pageSize"
				value="${param.pageSize}" /> <input type="hidden" name="qt_file"
				id="qt_file" value="${detail.qt_file}" />
		</form>

		<%-- =========== 상세 정보 보여주기 시작 =========== --%>
		<div class="ContentTB">
			<table>
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody id="content22">
					<tr>
						<td class="ac" id="qt_title">제목</td>
						<td colspan="3" id="qt_title_2">${detail.qt_title}</td>
					</tr>

					<tr>
						<td class="ac" id="qt_writer">작 성 자</td>
						<td colspan="3">${detail.qt_writer}</td>
					</tr>
					<tr>
						<td class="ac" colspan="1">작 성 일</td>
						<td>${detail.qt_regdate}</td>
						<td class="ac" id="qt_status">답 변 여 부</td>
						<td>${detail.qt_status}</td>
					</tr>
					<tr>
						<td id="question_content" colspan="4">${detail.qt_content}</td>
					</tr>
					<tr>
						<td class="ac" id="qt_file">첨부파일</td>
						<td><img id="fileImage"></td>
					</tr>
				</tbody>
			</table>
			<div id="buttoncss">
				<input type="button" value="목록" id="back_questionListBtn"> 
				<input type="button" value="삭제" id="delete_questionBtn">
			</div>
		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>
	</div>



</body>
</html>