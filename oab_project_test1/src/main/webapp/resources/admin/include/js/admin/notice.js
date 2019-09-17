$(function() {

	// 수정버튼 클릭 시 처리 이벤트
	$("#noticeUpdateBtn").click(function() {

		$("#f_data").attr({
			"methode" : "post",
			"action" : "/admin/notice/updateForm"
		});

		$("#f_data").submit();
	});

	// 답글쓰기 버튼 클릭 시 처리 이벤트
	$("#replyWriteBtn").click(function() {

		$("#f_data").attr({
			"methode" : "post",
			"action" : "/admin/question/replyWriteForm"
		});

		$("#f_data").submit();
	});

});
