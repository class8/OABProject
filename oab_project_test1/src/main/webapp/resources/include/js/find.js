/* 확인 버튼 클릭 시 처리 이벤트 */
$(function() {

	$("#mt_idemail").click(function() {
		// 입력값 체크
		if (!formCheck($('#mt_name'), $('.error:eq(0)'), "이름을"))
			return false;
		else if (!formCheck($('#mt_email'), $('.error:eq(1)'), "이메일 주소을 올바르게"))
			return false;
		else if (!inputVerify(3, '#mt_email', '.error:eq(1)'))
			return false;
	});

});
$(function() {
	$("#mt_pwemail").click(function() {
		
		// 입력값 체크
		if (!formCheck($('#mt_id'), $('.error:eq(2)'), "아이디를"))
			return false;
		else if (!inputVerify(0, '#mt_id', '.error:eq(2)'))
			return false;
		else if (!formCheck($('#mt_emailpw'), $('.error:eq(3)'), "이메일 주소을 올바르게"))
			return false;
		else if (!inputVerify(3, '#mt_emailpw', '.error:eq(3)'))
			return false;
	});
});

function check() {
	$.ajax({
		url : "/member/mt_IdConfirm.do",
		type : "post",
		data : "mt_id=" + $("#mt_id").val(),
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			console.log("resultData : " + resultData);
			if(resultData=="1"){
				//$("#mt_id").parents(".MS_input_txt1").find(".error").html("");
				
			}else if(resultData=="2"){
				idConfirm = 2;
				//$("#mt_id").parents(".MS_input_txt1").find(".error").html("불가다.");
				$("#mt_id").val("");
				$("#mt_id").focus();
			} 
		}
	});
	
}