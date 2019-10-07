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

		// 저장 버튼 클릭 시 처리 이벤트
		$("#reviewInsertBtn")
				.click(
						function() {
							if (reviewCheck()) {
								/*  */
									swal({
				     title: "등록",
				     text: "작성하신 후기글을 등록하시겠습니까?",
				     icon: "info",
				     buttons: ["아니오", "예"],
				}
				).then((예) => {
				     if (예) {
				    	 swal('등록', '후기글이 등록되었습니다.', 'success').then((OK)=>{
				    		 $("#reviewWriteForm").attr({ // 속성의 값을 가져오는 것
									"method" : "POST",
									"action" : "/review/reviewInsert"
								});
								$("#reviewWriteForm").submit();
				    	   	 });
				     }
				});
							}
						});
	});
	function reviewCheck() {

		/* var value = $('#revt_writer').val();
		var value = $('#revt_pw').val();
		var value = $('#revt_branch').val();
		var value = $('#revt_title').val();
		var value = $('#revt_content').val(); */
		// 파일의 확장자 명을 막기 위해서
		var pt_thumbCheck = $("#revt_thumbnail").val().split('.').pop()
				.toLowerCase();
		var pt_image1Check = $("#revt_image1").val().split('.').pop()
				.toLowerCase();
		var pt_image2Check = $("#revt_image2").val().split('.').pop()
				.toLowerCase();
		var pt_image3Check = $("#revt_image3").val().split('.').pop()
				.toLowerCase();

		if ($("#revt_writer").val() == null || $("#revt_writer").val() == '') {
			swal('오류', '작성자 명은 필수입니다.', 'error');
			$("#revt_writer").focus();
			return false;
		} else if ($("#revt_pw").val() == null || $("#revt_pw").val() == '') {
			swal('오류', '포토후기의 비밀번호 입력은 필수입니다.', 'error');
			$("#revt_pw").focus();
			return false;
		} else if ($("#revt_branch").val() == null
				|| $("#revt_branch").val() == '') {
			swal('오류', '포토후기의 이용지점 입력은 필수입니다.', 'error');
			$("#revt_branch").focus();
			return false;
		} else if ($("#revt_title").val() == null
				|| $("#revt_title").val() == '') {
			swal('오류', '포토후기의 제목 입력은 필수입니다.', 'error');
			$("#revt_title").focus();
			return false;
		} else if ($("#revt_content").val() == null
				|| $("#revt_content").val() == '') {
			swal('오류', '포토후기의 내용 입력은 필수입니다.', 'error');
			$("#revt_content").focus();
			return false;
		} else if ($("#revt_thumbnail").select().val() == '') {
			swal('오류', '썸네일 사진은 필수 등록입니다.', 'error');
			return false;
		} else if (extension_check($("#revt_thumbnail"))) {
			return false;
		} else if (extension_check($("#revt_image1"))) {
			return false;
		} else if (extension_check($("#revt_image2"))) {
			return false;
		} else if (extension_check($("#revt_image3"))) {
			return false;
		}
		return true;
	}

	//확장자 체크 함수
	function extension_check(file) {
		//입력한 파일이 공백이 아닐경우 작동
		if (file.val() != '') {
			// .뒤로 자르기
			var extension = file.val().split('.').pop().toLowerCase();
			// 자른 확장자명이 없을경우 -1 있으면 배열의 인덱스값 반환(0~3)
			// 입력한 파일의 확장자명이 배열중에 없으면 true
			if (jQuery.inArray(extension, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				swal('오류', '파일은 gif, png, jpg, jpeg 만 업로드를 할 수 있습니다.', 'error');
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
</script>
</head>
<body>
	<c:if test="${login.mt_id != null }">
		<div class="reviewContentContainer">
			<div class="contentsTit">
				<h3>포토후기 작성</h3>
				<hr>
			</div>
			<div class="ContentTB">
				<form id="reviewWriteForm" enctype="multipart/form-data">
					<input type="hidden" name="mt_id" id="mt_id" value="${login.mt_id}">
					<table id="reviewWrite">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tr>
							<td class="ac">작성자 *</td>
							<td><input type="text" name="revt_writer" id="revt_writer"
								placeholder="필수 사항입니다."></td>
						</tr>
						<tr>
							<td class="ac">비밀번호 *</td>
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
							<td class="ac">썸네일 * </td>
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