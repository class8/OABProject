var arr = []; //선택한 상품 번호가 들어갈 배열
var count = []; //선택한 상품의 개수가 들어갈 배열

$(function() {
	$(".btn_reservation").click(function() {
		if (FormCheck()) { //유효성 검사
			$(".rest_exprent").val($(".reservation_date").val()+" "+$(".rest_exptime").val());
			$("#reservation_form").attr({
				"method" : "post",
				"action" : "/reservation/reservationReg"
			});
			$("#reservation_form").submit();
		}
	});
	$(".rest_payoption").click(function() {
		var option_val = $(".rest_payoption:checked").val();
		if(option_val.match('계좌이체')){
			$(".pay").html("예금주명:홍길동<br>은행명:국민은행<br>계좌번호:123-45678-9101112<br>위 계좌로 송금하시면 확인후 예약완료 처리됩니다.");
			$(".pay").attr({"style" : "border: 1px solid black;"});
		}else{
			$(".pay").html("");
			$(".pay").attr({"style" : "border: none;"});
		}
	});
});

//등록 필수입력 체크
function FormCheck() {
	var expPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/; //연락처 정규식
	
	if($(".rest_name").val() == null || $(".rest_name").val() ==''){
		alert("이름을 입력해주세요.");
		$(".rest_name").focus();
		return false;
	}else if($(".rest_phone").val() == null || $(".rest_phone").val() ==''){
		alert("연락처를 입력해주세요.");
		$(".rest_phone").focus();
		return false;
	}else if(!/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/.test($(".rest_phone").val())){
		alert("연락처 형식이 다릅니다.");
		$(".rest_phone").focus();
		return false;
	}else if(arr.length==0){
		alert("상품을 선택하세요.");
		return false;
	}else if(!$(".agree").prop("checked")){
		alert("약관동의를 체크해주세요.");
		$(".agree").focus();
		return false;
	}
	return true;
}
//////////////////////////////////////////////////////////////
$(function() {
	//추가상품을 선택하여 값이 변할경우 이벤트
	$(".add_choice").change(function() {
		//선택항목에 넣을 선택값 변수
		var q = $(".add_choice .item").index($(".add_choice .item:selected")); //선택상품 인덱스값
		var str = $(".add_number:eq("+q+")").val(); //선택 상품의 상품번호
		//기존 선택항목에 있는지 검증하여 없을경우에만 실행
		if(!compareTo(arr, str)){
			//인덱스에 맞는 가격값
			var price = parseInt($(".add_price:eq("+q+")").val()); //추가상품 가격
			
			//선택항목에 label추가
			var choice_item = ("<label class='choice_item'>"+$(".add_choice").val()+"</label>");
			
			//선택값 옆에 -버튼,수량,+버튼추가
			var btn_minus = (" <input class='btn_minus' type='button' value='-'></input>");
			var cnt_num = (" <input type='text' name='num' value='1' class='num' readonly style='width:30px'>");
			var btn_plus = (" <input class='btn_plus' type='button' value='+'></input>");

			//선택한 상품번호
			var pt_num = (" <input name='pt_num' class='pt_num' type='hidden' value='"+str+"'></input>");
			var pt_cnt = (" <input name='pt_cnt' class='pt_cnt' type='hidden' value='1'></input>");
			
			var total = (" <input type='text' name='price' value='"+price+"' class='price' readonly style='width:100px'>");
			//X종료버튼 추가
			var cancel = (" <input class='btn_close' type='button' value='x'></input></div>");

			$(".select_product").append("<div class='select'>"+choice_item+btn_minus+cnt_num+btn_plus+pt_num+pt_cnt+total+"원"+cancel+"</div>");
			
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
	    $(".select:eq("+n+")").remove();
	   /* $("br:eq("+n+")").remove();
	    $(".choice_item:eq("+n+")").remove();
	    $(".btn_minus:eq("+n+")").remove();
	    $(".num:eq("+n+")").remove();
	    $(".btn_plus:eq("+n+")").remove();
	    $(".price:eq("+n+")").remove();
	    $(".btn_close:eq("+n+")").remove();*/
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
//숫자만	 받는 함수
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 )
	{
		return;
	}
	else
	{
		return false;
	}
}
//문자 삭제 함수
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

//문자만	 받는 함수
function onlyString(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=65 && keyID <= 90 ) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 )
	{
		return;
	}
	else
	{
		return false;
	}
}
//즉시실행
(function (){
			var str = $(".pt_num").val();
			//검증시 사용하는 선택한 항목 배열에 값 추가
			arr.push(str);
}());