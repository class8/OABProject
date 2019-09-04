/**
 * 2019.08.28 첫시작
 */

$(function() {
	// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
	errCodeCheck()
	$('#mt_id, #mt_pw').bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});

	/* 로그인 버튼 클릭 시 처리 이벤트 */
	$("#loginBtn").click(function() {
		if (!formCheck($('#mt_id'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0, '#mt_id', '.error:eq(0)'))
			return;
		else if (!formCheck($('#mt_pw'), $('.error:eq(1)'), "비밀번호를"))
			return;
		else if (!inputVerify(1, '#mt_pw', '.error:eq(1)'))
			return;
		else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/login/login"
			});
			$("#loginForm").submit();
		}
	});

	/* 회원가입 버튼 클릭 시 처리 이벤트 */
	$("#joinBtn").click(function() {
		location.href = "/member/join.do";
	});
});


