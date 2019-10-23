/**
 *개발자 : 최대근 
 */
$(function() {
	/* 수정 버튼 클릭 시 처리 이벤트 */
	$("#productModifyFormBtn").click(function() {
		$("#f_data").attr("action" , "/admin/product/productModifyForm");
		$("#f_data").submit();
	});
});