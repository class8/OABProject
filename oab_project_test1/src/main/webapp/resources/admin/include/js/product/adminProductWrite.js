/**
 * 
 */
$(function() {
		//등록
		$("#productWrite").click(function() {
			if(writeFormCheck()){
				$("#productWriteForm").attr({
					"method" : "post",
					"action" : "/admin/product/adminProductWrite"
				});
				$("#productWriteForm").submit();
				alert($("#pt_name").val()+"상품 등록 완료.");
			}
		}); 
		//취소
		$("#productWriteCancel").click(function() {
			location.href="/admin/product/productList";
		});
	});
	
//등록 필수입력 체크
function writeFormCheck() {
	
	if($("#pt_name").val() == null || $("#pt_name").val() ==''){
		alert("상품명을 입력하세요.");
		$("#pt_name").focus();
		return false;
	}else if($("#file").select().val() == ''){
		alert("썸네일 사진은 필수 등록입니다.");
		return false;
	}else if($("#pt_explain").val() == null || $("#pt_explain").val() == ''){
		alert("상품 상세 설명을 입력해주세요.");
		return false;
	}else if($("#pt_price").val() == null || $("#pt_price").val() == ''){
		alert("상품 가격을 입력해주세요.");
		return false;
	}
	return true;
}