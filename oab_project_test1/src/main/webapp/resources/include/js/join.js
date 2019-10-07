/**
 * 2019.08.30 첫시작
 */
// 비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck() {
	if ($("#mt_pw").val() != $("#mt_pwCheck").val()) {
		swal ('오류' , '비밀번호와 비밀번호 확인이 일치하지 않습니다.','error');
		$("#mt_pwCheck").focus();
		$("#mt_pwCheck").val("");
		return false;
	} else {
		return true;
	}
}
// 아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var mt_Id = $("#mt_id").val();
	var mt_Pw = $("#mt_pw").val();
	if (mt_Pw.indexOf(mt_Id) > -1) {
		swal ('오류' , '비밀번호에 아이디를 포함 할 수 없습니다.','error');
		$("#mt_pw").val("");
		$("#mt_pw").focus();
		return false;
	} else {
		return true;
	}
}

var idConfirm = 1;
$(function() {
	errCodeCheck();
	// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = [ "영문,숫자만 가능. 8 ~ 20자로 입력해 주세요",
			"영문,숫자,특수문자만 가능. 8 ~ 20자 입력해 주세요.", "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
			"- 제외하고 입력해 주세요. 예시) 01012345678", "@포함 ex)example@naver.com", "생년월일 6자리 ex)950101" ];

	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});

	$('#mt_id, #mt_pw, #mt_pwCheck, #mt_phone, #mt_email, #mt_birth').bind("focus", function() {
		var idx = $("#mt_id, #mt_pw, #mt_pwCheck, #mt_phone, #mt_email, #mt_birth").index(this);
		// console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});

	$("#idConfirmBtn").click(function() {
		if (!formCheck($('#mt_id'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0, '#mt_id', '.error:eq(0)'))
			return;
		else {
			$.ajax({
				url : "/member/mt_IdConfirm.do",
				type : "post",
				data : "mt_id=" + $("#mt_id").val(),
				error : function() {
					swal ('오류' , '사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.','error');
				},
				success : function(resultData) {
					console.log("resultData : " + resultData);
					if(resultData=="1"){
						$("#mt_id").parents(".form-group").find(".error").html("현재 사용 중인 아이디입니다.");
					}else if(resultData=="2"){
						$("#mt_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					} 
				}
			});
		}
	});

	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#joinInsert").click(function() {
		// 입력값 체크
		if (!formCheck($('#mt_id'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0, '#mt_id', '.error:eq(0)'))
			return;
		else if (!formCheck($('#mt_pw'), $('.error:eq(1)'), "비밀번호를"))
			return;
		else if (!inputVerify(1, '#mt_pw', '.error:eq(1)'))
			return;
		else if (!idPwdCheck()) return;
		else if (!formCheck($('#mt_pwCheck'), $('.error:eq(2)'), "비밀번호 확인을"))
			return;
		else if (!inputVerify(1, '#mt_pwCheck', '.error:eq(2)'))
			return;
		else if (!passwordCheck()) return;
		else if (!formCheck($('#mt_phone'), $('.error:eq(3)'), "전화번호를"))
			return;
		else if (!inputVerify(2, '#mt_phone', '.error:eq(3)'))
			return;

		else if (!formCheck($('#mt_email'), $('.error:eq(4)'), "이메일 주소을 올바르게"))
			return;
		else if (!inputVerify(3, '#mt_email', '.error:eq(4)'))
			return;

		else if (!formCheck($('#mt_birth'), $('.error:eq(5)'), "생년월일을 숫자로만"))
			return;
		else if (!inputVerify(4, '#mt_birth', '.error:eq(5)'))
			return;

		else if (!formCheck($('#mt_name'), $('.error:eq(6)'), "이름을"))
			return;
		else if (idConfirm != 2) {
			swal ('오류' , '아이디 중복체크를 해주세요.','error');
			return;
		} else {

			var req = document.form.req.checked;
			var num = 0;
			if (req == true) {
				num = 1;
			}
			if (num == 1) {
				document.form.submit();
			} else {
				swal ('오류' , '개인정보 약관에 동의하셔야 합니다.','error');
				return true;
			}
			$("#mt_birth").val($("#mt_birth").val());
			$("#memberForm").attr({
				"method" : "post",
				"action" : "/member/join"
			});
			$("#memberForm").submit();
		}
	});


	$("#joinReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});
});
