<%@page import="com.oab.client.member.service.MemberService"%>
<%@page import="org.apache.poi.ss.formula.ptg.MemErrPtg"%>
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
<title>포토후기 게시판 수정 삭제</title>
<link href="/resources/include/css/review.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/client_review.js"></script>
<script type="text/javascript">
	$(function() {
		/* 취소 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
		$("#reviewListBackBtn").click(function() {
			location.href = "/review/reviewList";
		});
	});
</script>
</head>
<body>
	<c:if test="${login.mt_id != null }">
		<div class="reviewContentContainer">
			<div class="contentsTit">
				<h3>포토후기 수정페이지</h3>
				<hr>
			</div>
			<div class="ContentTB">
				<!-- 수정사항폼입니다 -->
				<form name="reviewUpdateForm" id="reviewUpdateForm" method="get">
					<input type="hidden" id="revt_number"
						value="${updateData.revt_number }"> <input type="hidden"
						id="revt_title" value="${updateData.revt_title }"> <input
						type="hidden" id="old_pw" value="${updateData.revt_pw }">
					<input type="hidden" id="revt_thumbnail"
						value="${updateData.revt_thumbnail }"> <input
						type="hidden" id="revt_image1" value="${updateData.revt_image1 }">
					<input type="hidden" id="revt_image1"
						value="${updateData.revt_image2 }"> <input type="hidden"
						id="revt_image1" value="${updateData.revt_image3 }">

					<p>${updateData.revt_number }</p>
					<p>${updateData.revt_pw }</p>
					<table id="reviewUpdate">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tr>
							<td class="ac">작성자 *</td>
							<td><input type="text" name="revt_writer" id="revt_writer"
								readonly="readonly" value="${updateData.revt_writer}"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="mt_id" id="mt_id"
								value="${login.mt_id}"></td>
						</tr>
						<tr>
							<td class="ac">비밀번호 *</td>
							<td><input type="password" name="check_pw" id="check_pw"
								value="${updateDatae.revt_pw }"
								placeholder="비밀번호는 숫자로 5자리까지 입력이 가능합니다." maxlength="5"
								onkeyPress="InpuOnlyNumber(this);"></td>
						</tr>
						<tr>
							<td class="ac">이용지점 *</td>
							<td><input type="text" name="revt_branch" id="revt_branch"
								readonly="readonly" value="${updateData.revt_branch}"></td>
						</tr>
						<tr>
							<td class="ac">제목 *</td>
							<td><input type="text" name="revt_title" id="revt_title"
								value="${updateData.revt_title }"></td>
						</tr>
						<tr>
							<td class="ac">텍스트 *</td>
							<!-- 	<td><input type="text" name="qt_textcontent"
							id="qt_textcontent"></td> -->
							<td><textarea name="revt_content" id="revt_content"
									value="${updateData.revt_content }"></textarea></td>
						</tr>
						<tr>
							<td class="ac">썸네일 *</td>
							<td><input type="file" id="revt_oldFile" name="revt_file"
								onchange="filetest()"></td>
						</tr>
						<tr>
							<td class="ac">이미지파일 1</td>
							<td><input type="file" name="revt_oldFile1" id="revt_image1"
								onchange="filetest()"></td>
						</tr>
						<tr>
							<td class="ac">이미지파일2</td>
							<td><input type="file" name="revt_oldFile2" id="revt_image2"
								onchange="filetest()"></td>
						</tr>
						<tr>
							<td class="ac">이미지파일3</td>
							<td><input type="file" name="revt_oldFile3" id="revt_image3"
								onchange="filetest()"></td>
						</tr>
					</table>
				</form>
				<p>파일 용량 초과 시 등록이 되지 않습니다.</p>
				<div class="buttoncss">
					<input type="button" value="업데이트" class="but" id="reviewUpdateBtn">
					<input type="button" value="돌아가기" class="but"
						id="reviewListBackBtn">
				</div>

			</div>

		</div>
	</c:if>

	<c:if test="${login.mt_id == null}">
		<!-- 회원이 아닐 경우에! 로그인 하세요.  -->
		<div class="contentsTit">
			<h3>포토 후기 작성</h3>
			<hr>
		</div>
		<div id="pleaseLogin">
			<p>
				로그인 한 회원만 이용이 가능합니다<br> <a href="/login/login"><span><strong
						id="textlogin" color="blue">로그인</strong>을 클릭하시면 이동합니다.</span></a>
			</p>
		</div>
	</c:if>
</body>
</html>