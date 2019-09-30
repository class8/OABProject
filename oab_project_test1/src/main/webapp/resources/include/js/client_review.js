/**
 * 2019.09.20 : 포토 후기 게시판 작성 기능
 */

// 포토후기 작성 비밀번호 : 숫자만 입력가능
function InpuOnlyNumber(obj) {
	if (event.keyCode >= 48 && event.keyCode <= 57) { // 숫자키만 입력
		return true;
	} else {
		event.returnValue = false;
	}
}

// 업데이트
$(function() {

	// 수정 버튼 클릭 시 처리 이벤트
	$("#reviewUpdateBtn").click(function() {
		alert("제발!")
		if (updateFormCheck()) {
			// 입력값 체크
			$("#reviewUpdateForm").attr({
				"method" : "POST",
				"action" : "/review/reviewUpdate"
			});
			$("#reviewUpdateForm").submit();
			alert("수정이 완료 되었습니다. 감사합니다.");
		}
	});

});

// 파일 선택시 변화
function filetest() {

	if ($("#file").select().val().length > 0) {
		$("#old_thumbnail").attr({
			"type" : "hidden"
		});
	} else if ($("#file").select().val().length == 0) {
		$("#old_thumbnail").attr({
			"type" : "image"
		});
	}
	alert("dlrj")

	if ($("#file1").select().val().length > 0) {
		$("#old_image1").attr({
			"type" : "hidden"
		});
	} else if ($("#file1").select().val().length == 0) {
		$("#old_image1").attr({
			"type" : "image"
		});
	}

	if ($("#file2").select().val().length > 0) {
		$("#old_image2").attr({
			"type" : "hidden"
		});
	} else if ($("#file2").select().val().length == 0) {
		$("#old_image2").attr({
			"type" : "image"
		});
	}

	if ($("#file3").select().val().length > 0) {
		$("#old_image3").attr({
			"type" : "hidden"
		});
	} else if ($("#file3").select().val().length == 0) {
		$("#old_image3").attr({
			"type" : "image"
		});
	}

}

// 수정시 필수 입력체크
function updateFormCheck() {

	var value = $('#revt_writer').val();
	var value = $('#old_pw').val();
	var value = $('#check_pw').val();
	var value = $('#revt_branch').val();
	var value = $('#revt_title').val();
	var value = $('#revt_content').val();
	/*
	 * // 파일의 확장자 명을 막기 위해서 var pt_thumbCheck =
	 * $("#revt_thumbnail").val().split('.').pop() .toLowerCase(); var
	 * pt_image1Check = $("#revt_image1").val().split('.').pop().toLowerCase();
	 * var pt_image2Check =
	 * $("#revt_image2").val().split('.').pop().toLowerCase(); var
	 * pt_image3Check = $("#revt_image3").val().split('.').pop().toLowerCase();
	 */
	if ($("#revt_writer").val() == null || $("#revt_writer").val() == '') {
		alert("작성자 명은 필수입니다");
		$("#revt_writer").focus();
		return false;
	} else if ($("#check_pw").val() == null || $("#check_pw").val() == '') {
		alert("비밀번호란이 공백입니다.");
		alert("#check_pw");
		$("#check_pw").focus();
		return false;
	} else if ($("#revt_branch").val() == null || $("#revt_branch").val() == '') {
		alert("포토후기의 이용지점 입력은 필수입니다");
		$("#revt_branch").focus();
		return false;
	} else if ($("#revt_title").val() == null || $("#revt_title").val() == '') {
		alert("포토후기의 제목 입력은 필수입니다");
		$("#revt_title").focus();
		return false;
	} else if ($("#revt_content").val() == null
			|| $("#revt_content").val() == '') {
		alert("포토후기의 내용 입력은 필수입니다");
		$("#revt_content").focus();
		return false;

	} else if ($("#old_thumbnail").select().val() == '') {
		alert("썸네일 사진은 필수 등록입니다.");
		return false;
	} else if (extension_check($("#old_thumbnail"))) {
		return false;
	} else if (extension_check($("#old_imagel"))) {
		return false;
	} else if (extension_check($("#old_image2"))) {
		return false;
	} else if (extension_check($("#old_image3"))) {
		return false;
	} else if ($("#old_pw").val() != $("#check_pw").val()) {
		alert("포토후기 작성 시 입력했던 비밀번호와 일치 하지 않습니다.");
		$("#check_pw").focus();
	} else
		(confirm("[${updateData.revt_title}]" + " 작성하신 문의글이 수정됩니다."))
	{ // 입력한
		return true;
	}
	// 확장자 체크 함수
	function extension_check(file) {
		// 입력한 파일이 공백이 아닐경우 작동
		if (file.val() != '') {
			// .뒤로 자르기
			var extension = file.val().split('.').pop().toLowerCase();
			// 자른 확장자명이 없을경우 -1 있으면 배열의 인덱스값 반환(0~3)
			// 입력한 파일의 확장자명이 배열중에 없으면 true
			if (jQuery.inArray(extension, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				alert('파일은 gif, png, jpg, jpeg 만 업로드를 할 수 있습니다.');
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}