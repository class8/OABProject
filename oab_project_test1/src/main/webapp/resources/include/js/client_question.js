//사용자의 정보를 받아서 문의 게시글을 작성하기 위한 js : 09.06

$(function() {
	//저장 버튼 클릭 시 처리 이벤트 
	$("#questionInsertBtn").click(function() {
	if(qtCheck()){
		$("#questionwriteForm").attr({ // 속성의 값을 가져오는 것
			"method" : "POST",
			"action" : "/question/questionInsert"
		});
		$("#questionwriteForm").submit();
		alert("문의사항이 작성 되었습니다. 신속하고 정확한 답변으로 서비스하겠습니다. 감사합니다."); // 알림창으로 줄건지
	}
	});
});

// 비밀번호에 오로지 숫자키만 입력가능
function InpuOnlyNumber(obj) {
	if (event.keyCode >= 48 && event.keyCode <= 57) { // 숫자키만 입력
		return true;
	} else {
		event.returnValue = false;
	}
}

$(function() {
	/* 취소 버튼을 누르면 리스트로 돌아갈 수 있게 만들기 */
	$("#questionListBtn").click(function() {
		location.href = "/";
	});
});

function qtCheck() {
	
	// 이름, 비밀번호, 제목 내용
	var qt_writer = document.getElementById('qt_writer');
	var qt_pw = document.getElementById('qt_pw');
	var qt_title = document.getElementById('qt_title');
	var qt_content = document.getElementById('qt_content');

	if (qt_writer.value == '' || qt_writer.value == null) {
		alert('이름은 필수 사항입니다');
		return false;
	}
	if (qt_pw.value == '' || qt_pw.value == null) {
		alert('게시글의 비밀번호는 필수 사항입니다');
		return false;
	}
	if (qt_title.value == '' || qt_title.value == null) {
		alert('게시글의 제목은 필수 사항입니다');
		return false;
	}
	if (qt_content.value == '' || qt_content.value == null) {
		alert('문의 내용 작성은 필수 사항입니다');
		return false;
	}
	return true;
}