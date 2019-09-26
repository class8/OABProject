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
<title>문의 게시글 작성 폼 화면</title>

<link href="/resources/include/css/question.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/client_question.js"></script>

</head>
<body>
	<c:if test="${login.mt_id != null }">
		<div class="questionContentContainer">
			<div class="contentsTit">
				<h3>1:1 문의 하기</h3>
				<hr>
			</div>
			<div class="ContentTB">
				<form id="questionwriteForm" name="questionwriteForm"
					enctype="multipart/form-data">
					<input type="hidden" name="mt_id" id="mt_id" value="${login.mt_id}">
					<input type="hidden" name="qt_status" id="qt_status" value="미답변">
					<div id="questionWriteTable">
						<table id="wrtTbl">
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
							<tr>
								<td class="ac">이름 *</td>
								<td><input type="text" name="qt_writer" id="qt_writer"
									placeholder="필수 사항입니다."></td>
							</tr>
							<tr>
								<td class="ac">비밀번호 *</td>
								<td><input type="password" name="qt_pw" id="qt_pw"
									placeholder="비밀번호는 숫자만, 5자리까지 입력이 가능합니다." maxlength="5"
									onkeyPress="InpuOnlyNumber(this);"></td>
							</tr>
							<tr>
								<td class="ac">제목 *</td>
								<td><input type="text" name="qt_title" id="qt_title"
									placeholder="필수 사항입니다"></td>
							</tr>
							<tr>
								<td class="ac"><p>문의 내용 *</p></td>
								<!-- 	<td><input type="text" name="qt_textcontent"
							id="qt_textcontent"></td> -->
								<td><textarea name="qt_content" id="qt_content"></textarea></td>
							</tr>
							<tr>
								<td class="ac">첨부 파일</td>
								<td><input type="file" name="file" id="file"
									placeholder="5Mbyte 미만의 파일만 가능합니다."></td>
							</tr>
						</table>
					</div>
					<div class="buttoncss">
						<input type="button" value="등록" class="but" id="questionInsertBtn">
						<input type="button" value="돌아가기" class="but" id="questionListBtn">
					</div>
				</form>
			</div>

		</div>
	</c:if>

	<c:if test="${login.mt_id == null}">
		<!-- 회원이 아닐 경우에! 로그인 하세요.  -->
		<div class="contentsTit">
			<h3>1:1 문의 하기</h3>
			<hr>
		</div>
		<div id="pleaseLogin">
			<p>
				로그인 한 회원만 이용이 가능합니다<br> <a href="/login/login"><span><strong
						id="textlogin">로그인</strong>을 클릭하시면 이동합니다.</span></a>
			</p>
		</div>
	</c:if>
</body>
</html>
