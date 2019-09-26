<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		// 삭제버튼 클릭 시 처리 이벤트 
		$("#reviewDeleteBtn").click(function() {

			if (confirm("해당 후기를 삭제하시겠습니까?")) {

				$("#f_data").attr({
					"method" : "post",
					"action" : "/admin/review/reviewDelete"
				});

				$("#f_data").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트 
		$("#reviewListBtn").click(function() {
			location.href = "/admin/review/reviewList";
		});

	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/review_D.css" />
</head>
<body>

	<div class="main_content">

		<div class="contentTit">
			<h2>상세보기</h2>
		</div>

		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="revt_number"
				value="${reviewDetail.revt_number }" />
		</form>

		<div class="ContentTB">
			<div class="contentSlide">
				<div id="slide">
					<input type="radio" name="pos" id="pos1" checked> <input
						type="radio" name="pos" id="pos2"> <input type="radio"
						name="pos" id="pos3"> <input type="radio" name="pos"
						id="pos4">
					<ul>
						<c:if
							test="${reviewDetail.revt_thumbnail != null && reviewDetail.revt_thumbnail != ''}">
							<li><img class="review_thumbnail"
								src="/uploadStorage/revt_thumbnail/${reviewDetail.revt_thumbnail}"></li>
						</c:if>

						<c:if
							test="${reviewDetail.revt_image1 != null && reviewDetail.revt_image1 != ''}">
							<li><img class="review_thumbnail"
								src="/uploadStorage/revt_image1/${reviewDetail.revt_image1}"></li>
						</c:if>

						<c:if
							test="${reviewDetail.revt_image2 != null && reviewDetail.revt_image2 != ''}">
							<li><img class="review_thumbnail"
								src="/uploadStorage/revt_image2/${reviewDetail.revt_image2}"></li>
						</c:if>

						<c:if
							test="${reviewDetail.revt_image3 != null && reviewDetail.revt_image3 != ''}">
							<li><img class="review_thumbnail"
								src="/uploadStorage/revt_image3/${reviewDetail.revt_image3}"></li>
						</c:if>
					</ul>

					<!-- 버튼 -->
					<p class="pos">
						<label for="pos1"></label> <label for="pos2"></label> <label
							for="pos3"></label> <label for="pos4"></label>
					</p>
				</div>
			</div>
			<!-- 상세내용 -->
			<div class="detail_text">
				<h4>제목 : ${reviewDetail.revt_title }</h4>
				<h4>작성자 : ${reviewDetail.revt_writer }</h4>
				<nav id="content">
					<p>${reviewDetail.revt_content }</p>
				</nav>

				<input type="button" value="삭제" class="but" id="reviewDeleteBtn">
				<input type="button" value="목록" class="but" id="reviewListBtn">
			</div>

		</div>
		<%-- =========== 상세 정보 보여주기 종료 =========== --%>

	</div>
</body>
</html>