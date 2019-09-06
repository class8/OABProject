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
<title>문의 게시글 작성 폼 화면</title>

<link href="/resources/include/css/reset.css?ver=1" rel="stylesheet">
<link href="/resources/include/css/contentLayout.css?ver=1"
	rel="stylesheet">
<link href="/resources/include/css/header.css?ver=1" rel="stylesheet">
<link href="/resources/include/css/footer.css?ver=1" rel="stylesheet">
<link href="/resources/include/css/question.css" rel="stylesheet">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 저장 버튼을 클릭 시 처리 이벤트 */

		$("#questionInsertBtn").click(function() {

			//입력값을 체크한다
			if (!chkSubmit($('#qt_writer'), "작성자 성함을"))
				return;
			else if (!chkSubmit($('#qt_title'), "게시글의 제목을"))
				return;
			else if (!chkSubmit($('#qt_content'), "게시글의 내용을"))
				return;
			else if (!chkSubmit($('#qt_pw'), "게시글의 비밀번호를"))
				return;
			else {

				$("#questionwriteForm").attr({

					"method" : "POST",
					"action" : "/question/questionInsert"
				});

				$("#questionwriteForm").submit();

			}
			;
		});

	});

	$(function() {

		/* 취소 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
		$("#questionListBtn").click(function() {

			location.href = "/";

		});
	});
</script>
</head>
<body>


	<div class="questionContentContainer">

		<div class="contnetTit">
			<h3>1:1 문의 게시글 작성</h3>
			<hr>
		</div>

		<div class="ContentTB">
			<form id="questionwriteForm" name="questionwriteForm">

				<table id="questionWrite">

					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<td class="ac">이름 *</td>
						<td><input type="text" name="qt_writer" id="qt_writer"></td>
					</tr>

					<tr>
						<td class="ac">비밀번호</td>
						<td><input type="text" name="qt_pw" id="qt_pw"></td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td><input type="text" name="qt_" id="qt_title"></td>
					</tr>

					<tr>
						<td class="ac">문의 내용</td>
						<!-- 	<td><input type="text" name="qt_textcontent"
							id="qt_textcontent"></td> -->
						<td><textarea id="qt_textcontent"></textarea></td>
					</tr>

					<tr>
						<td class="ac">첨부 파일</td>
						<td><input type="text" name="qt_addfile" id="qt_addfile"
							placeholder="5Mbyte 미만의 파일만 가능합니다."></td>
					</tr>
				</table>
				<div class="buttoncss">
					<input type="button" value="문의하기" class="but"
						id="questionInsertBtn"> <input type="button" value="취소"
						class="but" id="questionListBtn">
				</div>
			</form>
		</div>

	</div>

</body>
</html>
