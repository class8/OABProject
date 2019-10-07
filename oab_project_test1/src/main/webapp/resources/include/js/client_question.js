//사용자의 정보를 받아서 문의 게시글을 작성하기 위한 js : 09.06

$(function() {
	//저장 버튼 클릭 시 처리 이벤트 
	$("#questionInsertBtn").click(function() {
	if(qtCheck()){
		
		swal({
		     title: "등록",
		     text: "작성하신 문의글을 등록하시겠습니까?",
		     icon: "info",
		     buttons: ["아니오", "예"],
		}
		).then((예) => {
		     if (예) {
		    	 swal('등록', '문의글이 등록되었습니다.', 'success').then((OK)=>{
		    		 $("#questionwriteForm").attr({ // 속성의 값을 가져오는 것
		    				"method" : "POST",
		    				"action" : "/question/questionInsert"
		    			});
		    			$("#questionwriteForm").submit();
		    	   	 });
		     }
		});
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
		swal('오류', '이름은 필수 사항입니다.', 'error');
		return false;
	}
	if (qt_pw.value == '' || qt_pw.value == null) {
		swal('오류', '게시글의 비밀번호는 필수 사항입니다.', 'error');
		return false;
	}
	if (qt_title.value == '' || qt_title.value == null) {
		swal('오류', '게시글의 제목은 필수 사항입니다.', 'error');
		return false;
	}
	if (qt_content.value == '' || qt_content.value == null) {
		swal('오류', '문의 내용 작성은 필수 사항입니다.', 'error');
		return false;
	}
	return true;
}