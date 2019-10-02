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
<title>포토후기 상세보기</title>
<link href="/resources/include/css/reviewDetail.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/client_review.js"></script>
<script type="text/javascript">
	//삭제를 위한 처리다 이녀석들아
	$(function() {
		if ($("#log_hidden").val() == $("#revt_hidden").val()) {
			document.getElementById("reviewDeleteBtn").style.display = "block";
		} else {
			document.getElementById("reviewDeleteBtn").style.display = "none";
		}

		$("#reviewDeleteBtn").click(
				function() {
					/* 버튼 클릭하면 삭제기능 시작하기 */
					var qt_writerPwCheck = $("#check_pw").val(); //삭제 시 비밀번호 확인을 위한 비밀번호
					var qt_pw = $("#revt_pw").val(); //원글의 비밀번호

					if (!($("#check_pw").val())) {
						alert("비밀번호를 입력해주세요");
						$("#check_pw").val("");
						$("#check_pw").focus();
					} else if ($("#revt_pw").val() != $("#check_pw").val()) {
						alert("입력하신 비밀번호가 일치하지 않습니다.");
						$("#check_pw").val("");

					} else if (confirm("[${detail.revt_title}]"
							+ " 작성하신 문의 글을 정말 삭제하시겠습니까?")) {
						$("#revt_data").attr("action", "/review/reviewDelete");
						$("#revt_data").submit();
					}

					else {
						alert("삭제가 불가능합니다.");
					}

				});

	});
</script>
</head>
<body>

	<input type="hidden" id="revt_hidden" value="${detail.mt_id}">
	<input type="hidden" id="log_hidden" value="${login.mt_id}">
	<div class="contentContainer">
		<div class="contentsTit">
			<h3>포토후기</h3>
			<hr>
		</div>
		<form name="revt_data" id="revt_data">
			<input type="hidden" name="revt_number" id="revt_number"
				value="${detail.revt_number}" /> <input type="hidden"
				name="revt_pw" id="revt_pw" value="${detail.revt_pw}" />

		</form>
		<%-- =========== 상세 정보 보여주기 시작 =========== --%>
		<div class="ContentTB">
			<div class="contentSlide">
				<div id="slide">
					<input type="radio" name="pos" id="pos1" checked> <input
						type="radio" name="pos" id="pos2"> <input type="radio"
						name="pos" id="pos3"> <input type="radio" name="pos"
						id="pos4">
					<ul>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_thumbnail/${detail.revt_thumbnail}"
							onerror="this.style.display='none'"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image1/${detail.revt_image1}"
							onerror="this.style.display='none'"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image2/${detail.revt_image2}"
							onerror="this.style.display='none'"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image3/${detail.revt_image3}"
							onerror="this.style.display='none'"></li>
					</ul>

					<!-- 버튼 -->
					<p class="pos">
						<label for="pos1"></label> <label for="pos2"></label> <label
							for="pos3"></label> <label for="pos4"></label>
					</p>
				</div>
			</div>
			<div class="detail_content">
				<!-- 상세내용 -->
				<div class="detail_text">
					<p>제목 : ${detail.revt_title }</p>
					<p>작성일 : ${detail.revt_regdate }</p>
					<p>
						작성자 : ${detail.revt_writer } | 비밀번호 : <input type="password"
							id="check_pw" name="check_pw" maxlength="5"
							onkeyPress="InpuOnlyNumber(this);">
					</p>
					<p>${detail.revt_content }</p>
					<p>조회수: ${detail.revt_readcnt }</p>
				</div>
				<div id="buttoncss">
					<p class="but">
						<input type="button" value="목록" id="back_reviewListBtn"> <input
							type="button" value="삭제" id="reviewDeleteBtn">
					</p>
				</div>
			</div>


		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>
	</div>
</body>
</html>