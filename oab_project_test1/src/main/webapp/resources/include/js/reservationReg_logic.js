var arr = []; //선택한 상품 번호가 들어갈 배열
var count = []; //선택한 상품의 개수가 들어갈 배열

$(function() {
	$(".btn_reservation").click(function() {
		if (FormCheck()) { //유효성 검사
			 //ajax 호출
            /*$.ajax({
                url         :   "/reservation/reservationReg",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   data,
                success     :   function(retVal){

                    if(retVal.code == "OK") {
                        alert(retVal.message);
                    } else {
                        alert(retVal.message);
                    }
                     
                },
                error       :   function(request, status, error){
                    console.log("AJAX_ERROR");
                }
            });*/
			$(".rest_exprent").val($(".reservation_date").val()+" "+$(".rest_exptime").val());
			$("#reservation_form").attr({
				"method" : "post",
				"action" : "/reservation/reservationReg"
			});
			$("#reservation_form").submit();
		}
	});
});

//등록 필수입력 체크
function FormCheck() {
	if($(".rest_name").val() == null || $(".rest_name").val() ==''){
		alert("이름을 입력하세요.");
		$(".rest_name").focus();
		return false;
	}else if($(".rest_phone").val() == null || $(".rest_phone").val() ==''){
		alert("연락처를 입력하세요.");
		$(".rest_phone").focus();
		return false;
	}else if(arr.length==0){
		alert("상품을 선택하세요.");
		return false;
	}else if(!$(".agree").prop("checked")){
		alert("약관동의를 체크해주세요.");
		return false;
	}
	return true;
}

//////////////////////////////////////////////////////////////
$(function() {
	//세트상품을 선택하여 값이 변할경우 이벤트
	$(".set_choice").change(function() {
		//선택항목에 넣을 선택값 변수
		var q = $(".set_choice .item").index($(".set_choice .item:selected")); //선택상품 인덱스값
		var str = $(".set_number:eq("+q+")").val(); //선택 상품의 상품번호
		//기존 선택항목에 있는지 검증하여 없을경우에만 실행
		if(!compareTo(arr, str)){
			//선택항목에 label추가
			$(".select_product").append("<label class='choice_item' value='1234'><br>"+$(".set_choice").val()+" </label>");
			//선택값 옆에 -버튼,수량,+버튼추가
			$(".select_product").append("<input class='btn_minus' type='button' value='-'></input>");
			$(".select_product").append("<input type='text' name='num' value='1' class='num'>");
			$(".select_product").append("<input class='btn_plus' type='button' value='+'></input>");

			//선택한 상품번호
			$(".select_product").append("<input name='pt_num' class='pt_num' type='hidden' value='"+str+"'></input>");
			$(".select_product").append("<input name='pt_cnt' class='pt_cnt' type='hidden' value='1'></input>");
			
			
			//인덱스에 맞는 가격값
			var q = $(".set_choice .item").index($(".set_choice .item:selected")); //선택상품 인덱스값
			var price = parseInt($(".set_price:eq("+q+")").val()); //선택상품 가격
			$(".select_product").append("<input type='text' name='price' value='"+price+"' class='price'>");
			//X종료버튼 추가
			$(".select_product").append("<input class='btn_close' type='button' value='X'></input>");
			//검증시 사용하는 선택한 항목 배열에 값 추가
			arr.push(str);
			}
		calculation_total();
		// select 선택값을 '세트상품선택'으로 하고 선택할수 없도록
		$(".set_choice").val('세트상품선택').attr("disabled hidden");
	});
	//추가상품을 선택하여 값이 변할경우 이벤트
	$(".add_choice").change(function() {
		//선택항목에 넣을 선택값 변수
		var q = $(".add_choice .item").index($(".add_choice .item:selected")); //선택상품 인덱스값
		var str = $(".add_number:eq("+q+")").val(); //선택 상품의 상품번호
		//기존 선택항목에 있는지 검증하여 없을경우에만 실행
		if(!compareTo(arr, str)){
			//선택항목에 label추가
			$(".select_product").append("<label class='choice_item'><br>"+$(".add_choice").val()+" </label>");
			//선택값 옆에 -버튼,수량,+버튼추가
			$(".select_product").append("<input class='btn_minus' type='button' value='-'></input>");
			$(".select_product").append("<input type='text' name='num' value='1' class='num'>");
			$(".select_product").append("<input class='btn_plus' type='button' value='+'></input>");
			
			//선택한 상품번호
			$(".select_product").append("<input name='pt_num' class='pt_num' type='hidden' value='"+str+"'></input>");
			$(".select_product").append("<input name='pt_cnt' class='pt_cnt' type='hidden' value='1'></input>");
			
			//인덱스에 맞는 가격값
			var q = $(".add_choice .item").index($(".add_choice .item:selected")); //선택상품 인덱스값
			var price = parseInt($(".add_price:eq("+q+")").val()); //선택상품 가격
			$(".select_product").append("<input type='text' name='price' value='"+price+"' class='price'>");
			//X종료버튼 추가
			$(".select_product").append("<input class='btn_close' type='button' value='X'></input>");
			//검증시 사용하는 선택한 항목 배열에 값 추가
			arr.push(str);
			}
		calculation_total();
		// select 선택값을 '추가상품선택'으로 하고 선택할수 없도록
		$(".add_choice").val('추가상품선택').attr("disabled hidden");
	});
	function calculation_total(){
		// 총액 계산
		 var sum = 0;
		 $('.price').each(function(){
			 sum += Number($(this).val());
		 });
		 $(".rest_total").val(sum); //총액
	}
	$(document).on("click",".btn_plus",function(){ 
		    var n = $('.btn_plus').index(this); //인덱스
		    var num = $(".num:eq("+n+")").val(); //수량
		    var price = $(".price:eq("+n+")").val()/num; //상품가격
		    var result = 0;
		    if(num<20){
		    $(".num:eq("+n+")").val(num*1+1);
		    $(".pt_cnt:eq("+n+")").val(num*1+1);
		    num = $(".num:eq("+n+")").val();
		    result = num*price;
		    $(".price:eq("+n+")").val(result);
		    calculation_total();
		    }
		  });
	$(document).on("click",".btn_minus",function(){ 
	    var n = $('.btn_minus').index(this); //인덱스
	    var num = $(".num:eq("+n+")").val(); //수량
	    var price = $(".price:eq("+n+")").val()/num; //상품가격
	    var result = 0;
	    if(num>1){
	    $(".num:eq("+n+")").val(num*1-1);
	    $(".pt_cnt:eq("+n+")").val(num*1-1);
	    num = $(".num:eq("+n+")").val();
	    result = num*price;
	    $(".price:eq("+n+")").val(result);
	    calculation_total();
	    }
	  });
	$(document).on("click",".btn_close",function(){
	    var n = $('.btn_close').index(this);
	    var num = $(".num:eq("+n+")").val();
	    $(".choice_item:eq("+n+")").remove();
	    $(".btn_minus:eq("+n+")").remove();
	    $(".num:eq("+n+")").remove();
	    $(".btn_plus:eq("+n+")").remove();
	    $(".price:eq("+n+")").remove();
	    $(".btn_close:eq("+n+")").remove();
	    arr.splice(n,1);
	    calculation_total();
	  });
	
	//지점선택
	$(".select_bname").change(function() {
		var select = $(".select_bname").val();
		$(".rest_bname").val(select);
	});
});
function compareTo(arr, str){
	for(var i = 0; i<arr.length; i++){
		if(arr[i] == str){
			return true;
		}
	}
	return false;
}