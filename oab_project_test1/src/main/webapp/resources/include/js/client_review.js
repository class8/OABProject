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

$(function() {
	/* 취소 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
	$("#back_reviewListBtn").click(function() {
		location.href = "/review/reviewList";
	});
});
