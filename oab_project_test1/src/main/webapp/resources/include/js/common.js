/**
 * 
 */
/*
 * 배열: 유효성 체크 시 필요한 정규식으로 배열을 초기화. pattern = [ 아이디 , 비밀번호, 핸드폰번호, 이메일, 생년월일] 함수명:
 * inputVerify(배열 인덱스번호, 비교할 값, 출력영역)
 */
var pattern = [ "((?=.*[a-zA-Z])(?=.*[0-9]).{8,20})",
		"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,20})", "^\\d{3}\\d{3,4}\\d{4}", 
		"[0-9a-zA-Z]@[0-9a-zA-Z]", 
		"[0-9]{6}" ];

function inputVerify(index, data, printarea) {
	var data_regExp = new RegExp(pattern[index]);
	var match = data_regExp.exec($(data).val());
	if (match == null) {
		$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$(data).val("");
		return false;
	} else {
		return true;
	}
}
function formCheck(main, item, msg) {
	if (main.val().replace(/\s/g, "") == "") {
		item.css("color", "#000099").html(msg + " 입력해 주세요");
		main.val("");
		return false;
	} else {
		return true;
	}
}