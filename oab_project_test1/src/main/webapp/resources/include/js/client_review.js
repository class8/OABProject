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

/*function reviewCheck() {

	var value = $('#revt_writer').val();
	var value = $('#revt_pw').val();
	var value = $('#revt_branch').val();
	var value = $('#revt_title').val();
	var value = $('#revt_content').val();
	// 파일의 확장자 명을 막기 위해서
	var pt_thumbCheck = $("#revt_thumbnail").val().split('.').pop().toLowerCase();
	var pt_image1Check = $("#revt_image1").val().split('.').pop().toLowerCase();
	var pt_image2Check = $("#revt_image2").val().split('.').pop().toLowerCase();
	var pt_image3Check = $("#revt_image3").val().split('.').pop().toLowerCase();

	if ($("#revt_writer").val() == null || $("#revt_writer").val() == '') {
		alert("작성자 명은 필수입니다");
		$("#revt_writer").focus();
		return false;
	} else if ($("#revt_pw").val() == null || $("#revt_pw").val() == '') {
		alert("포토후기의 비밀번호 입력은 필수입니다");
		$("#revt_pw").focus();
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
	} else if ($("#file").select().val() == '') {
		alert("썸네일 사진은 필수 등록입니다.");
		return false;
	} else
		return true;
}

else if (jQuery.inArray(pt_thumbCheck, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1
		|| jQuery.inArray(pt_image1Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1
		|| jQuery.inArray(pt_image2Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1
		|| jQuery.inArray(pt_image3Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
	alert('파일은 gif, png, jpg, jpeg 만 업로드를 할 수 있습니다.');
	return false;*/