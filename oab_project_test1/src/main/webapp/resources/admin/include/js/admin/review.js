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

function reviewCheck() {

	var value = $('#revt_writer').val();
	var value = $('#revt_pw').val();
	var value = $('#revt_branch').val();
	var value = $('#revt_title').val();
	var value = $('#revt_content').val();

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
		alert("포토후기의 비밀번호 입력은 필수입니다");
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

// 포토후기 업데이트

$(function() {

	// 저장 버튼 클릭 시 처리 이벤트
	$("#reviewUpdateBtn").click(function() {

		if (reviewCheck()) {
			$("#reviewUpdateForm").attr({ // 속성의 값을 가져오는 것
				"method" : "POST",
				"action" : "/review/reviewUpdate"
			});

			$("#reviewUpdateForm").submit();
			alert("포토후기가 작성 되었습니다. 고객님의 아름다운 한강을 위해 오늘도 노력하는 OAB가 되도록 하겠습니다.");
			// 알림창!
		}
	});
});

function reviewCheck() {

	var value = $('#revt_writer').val();
	var value = $('#revt_pw').val();
	var value = $('#revt_branch').val();
	var value = $('#revt_title').val();
	var value = $('#revt_content').val();

	if ($("#revt_pw").val() == null ) {
		alert("포토후기의 비밀번호 입력을 해야 삭제가 가능합니다.");
		$("#revt_pw").focus();
		return false;
	} else if ($("#revt_title").val() == null || $("#revt_title").val() == '') {
		alert("포토후기의 제목을 입력해주세요");
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