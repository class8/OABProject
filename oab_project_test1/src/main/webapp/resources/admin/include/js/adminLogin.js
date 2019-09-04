$(function() {
	// 로그인 버튼 클릭시 처리 이벤트
	$("#loginBtn").click(function() {
		if (loginChecktest() == true) {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/admin/login"
			});
			$("#loginForm").submit();
		}
	});

	//로그 아웃 버튼 클릭시 처리 이벤트
	$("#logoutBtn").click(function() {
		if(confirm("관리자님 로그아웃 하시겠습니까?")){
			location.href="/admin/logout";
		}
	
	});
});

function loginChecktest() {
	if ($("#adminID").val() == null || $("#adminID").val() == "") {
		alert("아이디를 입력해 주세요.");
		$("#adminID").focus();
		return false;
	} else if ($("#adminPW").val() == null || $("#adminPW").val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$("#adminPW").focus();
		return false;
		// 관리자는 고정 ID , PW 단 하나의 계정을 가지고있기때문에 이렇게 사용
	} else if ($("#adminID").val() != "admin" || $("#adminPW").val() != "1234") {
		alert("아이디 또는 비밀번호가 일치하지 않습니다.")
		$("#adminID").val("");
		$("#adminPW").val("");
		$("#adminID").focus();
		return false;
	} else {
		return true;
	}
	return true;
}