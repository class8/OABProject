<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>

	<div class="contentContainer">
		<div class="contentTit">
			<h3>공지사항 상세보기</h3>
		</div>
		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="b_num" value="${detail.nt_number}" /> <input
				type="hidden" name="page" id="page" value="${param.page}" />
		</form>

		<%-- =========== 상세 정보 보여주기 시작 =========== --%>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td>${detail.nt_writer}</td>
						<td class="ac">작성일</td>
						<td>${detail.nt_regdate}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="3">${detail.nt_title}</td>
					</tr>
					<tr>
						<td class="ac vm">내용</td>
						<td colspan="3">${detail.nt_content}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>
	</div>
</body>
</html>