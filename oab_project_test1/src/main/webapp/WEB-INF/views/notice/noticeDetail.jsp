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
<title>공지사항 상세보기</title>
<!-- <link href="/resources/include/css/clientNotice.css" rel="stylesheet"> -->
<style type="text/css">
.contentContainer {
	width: 100%;
}

.contentTit {
	margin-top: 30px;
	font-size: 25pt;
	text-align: center;
}

#noticeTab {
	text-align: center;
	width: 100%;
}

.content {
	margin-top: 50px;
	width: 80%;
	margin-left: 100px;
	border: 0px; /*공지사항 선임*/
	text-align: left;
	/* 줄간격 */
	line-height: 200%;
}

.content th, .content td {
	padding: 8px;
	border-bottom: 1px solid #393939;
}

#back_noticeListBtn {
	margin-top: 20px;
	text-align: right;
	margin-bottom: 10px;
	display: inline-block;;
	vertical-align: middle;
	background-color: #42c8c5;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 12pt;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#back_noticeListBtn:hover {
	background-color: #fff;
	color: #42c8c5;
}

#back_noticeListBtn:before, #back_noticeListBtn:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #42c8c5;
	transition: 400ms ease all;
}

#back_noticeListBtn:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#back_noticeListBtn:hover:before, #back_noticeListBtn:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 목록 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
		$("#back_noticeListBtn").click(function() {
			location.href = "noticeList";
		});
	});
</script>


</head>
<body>

	<div class="contentContainer">
		<div class="contentTit">
			<h3>공지사항 상세보기</h3>
			<hr>
		</div>
		<form name="nt_data" id="nt_data" method="POST">
			<input type="hidden" name="nt_number" value="${detail.nt_number}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
		</form>

		<%-- =========== 상세 정보 보여주기 시작 =========== --%>
		<div id="noticeTab">
			<table class="content">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tbody id="content22">
					<tr>
						<td class="ac" id="nt_title">제목</td>
						<td colspan="3" id="nt_title_2">${detail.nt_title}</td>
					</tr>

					<tr>
						<td class="ac" id="writer">작 성 자</td>
						<td colspan="3">${detail.nt_writer}</td>
					</tr>
					<tr>
						<td class="ac" colspan="1">작 성 일</td>
						<td>${detail.nt_regdate}</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td id="noticecontent" colspan="4">${detail.nt_content}</td>
					</tr>
				</tbody>

			</table>
			<input type="button" value="목록" id="back_noticeListBtn">
		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>
	</div>
</body>
</html>