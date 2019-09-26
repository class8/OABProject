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
<script type="text/javascript">
	$(function() {
		/* 버튼을 클릭하면 리스트로 다시 이동*/
		$("#back_reviewListBtn").click(function() {
			location.href = "/review/reviewList";
		})

	});

	//업데이트 버튼 누르면 넘어가야한다
	$(function() {

		//해당 문의글에 포함된 회원만 
		if ($("#log_hidden").val() == $("#revt_hidden").val()) {
			document.getElementById("Update_reviewBtn").style.display = "block";
		} else {
			document.getElementById("Update_reviewBtn").style.display = "none";
		}
		/* 버튼을 클릭하면 업데이트로 이동하기*/
		$("#Update_reviewBtn").click(function() {

			alert($("#revt_number").val());
			$("#revt_data").attr({
				"method" : "get",
				"action" : "/review/reviewUpdateForm"
			});
			$("#revt_data").submit();
		})
	});
</script>
</head>
<body>

	<input type="hidden" id="revt_hidden" value="${detail.mt_id}">
	<input type="hidden" id="log_hidden" value="${login.mt_id}">
	<div class="contentContainer">
		<div class="contentsTit">
			<h3>포토후기</h3>
			<label>현재 접속 중 아이디 : ${login.mt_id}</label>
			<hr>
		</div>
		<form name="revt_data" id="revt_data">
			<input type="hidden" name="revt_number" id="revt_number"
				value="${detail.revt_number}" />
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
							src="/uploadStorage/revt_thumbnail/${detail.revt_thumbnail}"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image1/${detail.revt_image1}"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image2/${detail.revt_image2}"></li>
						<li><img class="review_thumbnail"
							src="/uploadStorage/revt_image3/${detail.revt_image3}"></li>
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
					<p>작성자 : ${detail.revt_writer } | 조회수 : ${detail.revt_readcnt }</p>
					<p>${detail.revt_content }</p>
				</div>
				<div id="buttoncss">
					<input type="button" value="목록" id="back_reviewListBtn"> <input
						type="button" value="업데이트" id="Update_reviewBtn">
				</div>
			</div>


		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>
	</div>
</body>
</html>