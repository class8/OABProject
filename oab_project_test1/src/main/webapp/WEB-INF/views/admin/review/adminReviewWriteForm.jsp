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
<title>포토후기 작성 폼 화면</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/admin/review.js"></script>
<script type="text/javascript">
	$(function() {
		/* 취소 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
		$("#reviewListBackBtn").click(function() {
			location.href = "/review/reviewList";
		});

		// 저장 버튼 클릭 시 처리 이벤트
		$("#reviewInsertBtn")
				.click(
						function() {
							if (reviewCheck()) {
								$("#reviewWriteForm").attr({ // 속성의 값을 가져오는 것
									"method" : "POST",
									"action" : "/admin/review/reviewInsert"
								});

								$("#reviewWriteForm").submit();
								alert("포토후기가 작성 되었습니다. 고객님의 아름다운 한강을 위해 오늘도 노력하는 OAB가 되도록 하겠습니다.");
								// 알림창!
							}
						});
	});
</script>
</head>
<body>



	<div class="main_content">

		<div class="contentsTit">
			<h3>포토후기 작성</h3>
			<hr>
		</div>
		<div class="ContentTB">
			<form id="reviewWriteForm" enctype="multipart/form-data">
				<table id="reviewWrite">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<td class="ac">작성자</td>
						<td><input type="text" name="revt_writer" id="revt_writer"
							placeholder="필수 사항입니다."></td>
					</tr>
					<tr>
						<td><input type="hidden" name="mt_id" id="mt_id"
							value="kkoohh319"></td>
					</tr>
					<tr>
						<td class="ac">비밀번호</td>
						<td><input type="password" name="revt_pw" id="revt_pw"
							placeholder="비밀번호는 숫자로 5자리까지 입력이 가능합니다." maxlength="5"
							onkeyPress="InpuOnlyNumber(this);"></td>
					</tr>
					<tr>
						<td class="ac">이용지점 선택 *</td>
						<td><select id="revt_branch" name="revt_branch">
								<option value="여의도점">여의도점</option>
								<option value="뚝섬점">뚝섬점</option>
								<option value="잠원점">잠원점</option>
						</select> <input type="hidden" value="revt_branch"></td>
					</tr>
					<tr>
						<td class="ac">제목 *</td>
						<td><input type="text" name="revt_title" id="revt_title"
							placeholder="필수 사항입니다"></td>
					</tr>
					<tr>
						<td class="ac">텍스트 *</td>
						<!--    <td><input type="text" name="qt_textcontent"
                     id="qt_textcontent"></td> -->
						<td><textarea name="revt_content" id="revt_content"></textarea></td>
					</tr>
					<tr>
						<td class="ac">썸네일 *</td>
						<td><input type="file" name="revt_file" id="revt_thumbnail">
							<p id="file_guide">5Mbyte 미만의 파일만 가능합니다.</td>
					</tr>
					<tr>
						<td class="ac">이미지파일 1</td>
						<td><input type="file" name="revt_file1" id="revt_image1"></td>
					</tr>
					<tr>
						<td class="ac">이미지파일2</td>
						<td><input type="file" name="revt_file2" id="revt_image2"></td>
					</tr>
					<tr>
						<td class="ac">이미지파일3</td>
						<td><input type="file" name="revt_file3" id="revt_image3"></td>
					</tr>
				</table>
			</form>
			<p>파일 용량 초과 시 등록이 되지 않습니다.</p>
			<div class="buttoncss">
				<input type="button" value="등록" class="but" id="reviewInsertBtn">
				<input type="button" value="돌아가기" class="but" id="reviewListBackBtn">
			</div>

		</div>

	</div>

</body>
</html>