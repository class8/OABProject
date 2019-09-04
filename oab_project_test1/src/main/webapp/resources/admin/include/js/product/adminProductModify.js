/**
 * 
 */
$(function(){
	if($("#old_image1").val().length == 0){
		$("#old_image1").attr({
			"src" : "/resources/images/common/noimage.png"
		});
	}
	if($("#old_image2").val().length == 0){
		$("#old_image2").attr({
			"src" : "/resources/images/common/noimage.png"
		});
	}
	if($("#old_image3").val().length == 0){
		$("#old_image3").attr({
			"src" : "/resources/images/common/noimage.png"
		});
	}
	
      // 수정 버튼 클릭 시 처리 이벤트 
      $("#productModify").click(function() {
    	  if(modifyFormCheck()){
         	// 입력값 체크 
         	$("#f_writeForm").attr({
               "method" : "POST",
               "action" : "/admin/product/adminProductModify"
            });
            $("#f_writeForm").submit();
            alert("수정 완료");
    	  }
      });

      //상품 종류 select 정보 불러오기
      if($("#pt_selectUpdate").val() == "세트상품"){
    	  $("#pt_set").attr({
    		  "checked" : "checked"
    	  });
      }else{
    	  $("#pt_add").attr({
    		  "checked" : "checked"
    	  });
      }
      //상품 상태select 정보 불러오기
      if($("#pt_statusUpdate").val() == "대여가능"){
    	  $("#pt_statusOk").attr({
    		  "checked" : "checked"
    	  });
      }else{
    	  $("#pt_statusNo").attr({
    		  "checked" : "checked"
    	  });
      }
      
      
      
});
//파일 선택시 변화
function filetest() {
	
	if($("#file").select().val().length > 0){
		$("#old_thumb").attr({
			"type" : "hidden"
		});
	}else if($("#file").select().val().length == 0) {
		$("#old_thumb").attr({
			"type" : "image"
		});
	}
	
	if($("#file1").select().val().length > 0){
		$("#old_image1").attr({
			"type" : "hidden"
		});
	}else if($("#file1").select().val().length == 0) {
		$("#old_image1").attr({
			"type" : "image"
		});
	}
	
	if($("#file2").select().val().length > 0){
		$("#old_image2").attr({
			"type" : "hidden"
		});
	}else if($("#file2").select().val().length == 0) {
		$("#old_image2").attr({
			"type" : "image"
		});
	}
	
	if($("#file3").select().val().length > 0){
		$("#old_image3").attr({
			"type" : "hidden"
		});
	}else if($("#file3").select().val().length == 0) {
		$("#old_image3").attr({
			"type" : "image"
		});
	}
	
}

//수정 필수입력 체크
function modifyFormCheck() {
	
	if($("#pt_name").val() == null || $("#pt_name").val() ==''){
		alert("상품명을 입력하세요.");
		$("#pt_name").focus();
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