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
			location.href="/admin/product/adminProductList?page=1";
		});
	});

//등록 필수입력 체크
function writeFormCheck() {
	var pt_thumbCheck = $("#file").val().split('.').pop().toLowerCase();
	var pt_image1Check = $("#file1").val().split('.').pop().toLowerCase();
	var pt_image2Check = $("#file2").val().split('.').pop().toLowerCase();
	var pt_image3Check = $("#file3").val().split('.').pop().toLowerCase();
	
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
	}else if(jQuery.inArray(pt_thumbCheck, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1 || jQuery.inArray(pt_image1Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1 || jQuery.inArray(pt_image2Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1 ||jQuery.inArray(pt_image3Check, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
		alert('파일은 gif, png, jpg, jpeg 만 업로드를 할 수 있습니다.');
		return false;
	}
	return true;
}