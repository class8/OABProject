/* 확인 버튼 클릭 시 처리 이벤트 */
$(function() {

	$("#mt_idemail").click(function() {
		// 입력값 체크
		if (!formCheck($('#mt_email'), $('.error:eq(0)'), "이메일 주소을 올바르게"))
			return false;
		else if (!inputVerify(3, '#mt_email', '.error:eq(0)'))
			return false;
		else if (!formCheck($('#mt_name'), $('.error:eq(1)'), "이름을"))
			return false;
	});

});
var EmailConfirm = 1;
function idcheck() {
	$.ajax({
		url : "/member/mt_EmailConfirm",
		type : "post",
		data : "mt_email=" + $("#mt_email").val(),
		error : function() {
			swal ('오류' , '사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.','error');
		},
		success : function(resultData) {
			console.log("resultData : " + resultData);
			if (resultData == "1") {
				// $("#mt_id").parents(".MS_input_txt1").find(".error").html("");

			} else if (resultData == "2") {
				emailConfirm = 2;
				// $("#mt_id").parents(".MS_input_txt1").find(".error").html("기존
				// 아이디를 입력해주세요 아이디가 잘못되었습니다.");
				$("#mt_email").val("");
				swal ('오류' , '가입시 입력한 이메일을 입력해주세요.','error');
				$("#mt_email").focus();
			}
		}
	});
}
$(function() {
	$("#mt_pwemail").click(
			function() {

				// 입력값 체크
				if (!formCheck($('#mt_id'), $('.error:eq(2)'), "아이디를"))
					return false;
				else if (!inputVerify(0, '#mt_id', '.error:eq(2)'))
					return false;
				else if (!formCheck($('#mt_emailpw'), $('.error:eq(3)'),
						"이메일 주소을 올바르게"))
					return false;
				else if (!inputVerify(3, '#mt_emailpw', '.error:eq(3)'))
					return false;
			});
});

function check() {
	$.ajax({
		url : "/member/mt_IdConfirm",
		type : "post",
		data : "mt_id=" + $("#mt_id").val(),
		error : function() {
			swal ('오류' , '사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.','error');
		},
		success : function(resultData) {
			console.log("resultData : " + resultData);
			if (resultData == "1") {
				// $("#mt_id").parents(".MS_input_txt1").find(".error").html("");

			} else if (resultData == "2") {
				idConfirm = 2;
				// $("#mt_id").parents(".MS_input_txt1").find(".error").html("기존
				// 아이디를 입력해주세요 아이디가 잘못되었습니다.");
				$("#mt_id").val("");
				swal ('오류' , '기존 아이디를 입력해주세요 아이디가 잘못되었습니다.','error');
				$("#mt_id").focus();
			}
		}
	});

}