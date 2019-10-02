var loginmt_id = "";
$(function() {
	errCodeCheck();
	/*emailCheck();*/

	var message = [ "기존 비밀번호를 입력해 주세요.", "영문,숫자,특수문자만 가능. 8 ~ 20자 입력해 주세요.",
			"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.", "- 포함 입력해 주세요. 예시) 010-0000-0000" ];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});

	$('#oldmt_pw, #mt_pw, #mt_pwCheck, #mt_phone, #mt_email, #mt_birth').bind("focus",function() {
		var idx = $("#oldmt_pw, #mt_pw, #mt_pwCheck, #mt_phone, #mt_email, #mt_birth").index(this);
						// console.log("대상 : "+ idx );
						$(this).parents(".form-group").find(".error").html(message[idx]);
					});

	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#modify").click(function() {
		// 입력값 체크
		if (!formCheck($('#oldmt_pw'), $('.error:eq(0)'), "기존 비밀번호를"))
			return;
		else if (!inputVerify(1, '#oldmt_pw', '.error:eq(0)'))
			return;
		else if (!formCheck($('#mt_pw'), $('.error:eq(1)'), "변경할 비밀번호를"))
			return;
		else if (!formCheck($('#mt_pwCheck'), $('.error:eq(2)'), "변경할 비밀번호 확인을"))
			return;
		else if (!formCheck($('#mt_phone'), $('.error:eq(3)'), "전화번호를"))
			return;
		else if (!inputVerify(2, '#mt_phone', '.error:eq(3)'))
			return;
		else if (!formCheck($('#mt_email'), $('.error:eq(4)'), "이메일 주소를"))
			return;
		
		else if (!formCheck($('#mt_birth'), $('.error:eq(5)'), "생년월일을 숫자로만"))
			return;
		else if (!inputVerify(4, '#mt_birth', '.error:eq(5)'))
			return;

		else if (!formCheck($('#mt_name'), $('.error:eq(6)'), "이름을"))
			return;
		else {
			if ($('#mt_pw').val() != "") {
				if (!inputVerify(1, '#mt_pw', '.error:eq(1)'))
					return;
				if (!idPwdCheck())
					return;
			}
			if ($('#oldmt_pw').val() != "") {
				if (!inputVerify(1, '#oldmt_pw', '.error:eq(2)'))
					return;
			}
			if ($('#mt_pw').val() != "" && $('#mt_pwCheck').val() != "") {
				if (!passwordCheck())
					return;
			}
			$("#memberForm").attr({
				"method" : "post",
				"action" : "/member/memberModify"
			});
			$("#memberForm").submit();
		}
	});

	$("#modifyReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});

	
});

function passwordCheck() {
	if ($("#mt_pw").val() != $("#mt_pwCheck").val()) {
		alert("패스워드 입력이 일치하지 않습니다");
		$("#mt_pw").val("");
		$("#mt_pwCheck").val("");
		$("#mt_pw").focus();
		return false;
	}
	return true;
}

function idPwdCheck() {
	var mt_id = loginmt_id;
	var mt_pw = $("#mt_pw").val();
	if (mt_pw.indexOf(mt_id) > 0) {
		alert(mt_pw.indexOf(mt_id));
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#mt_pw").val("");
		$("#mt_pw").focus();
		return false;
	} else {
		return true;
	}
}
