//2019.09.05 김은수

//1번 텐트 이용 방법
$(document).ready(function() {

		$('#btnAll').click(function(e) {

			e.preventDefault();

			if ($(this).attr("mode") == "hide") {

			
				$('#ALLPRICE').slideDown(350);

				$(this).attr("mode", "show");

			} else {

		

				$('#ALLPRICE').slideUp(350);

				$(this).attr("mode", "hide");

			}

		});

	});
//2번 비밀번호 재 발급
$(document).ready(function() {
	
	$('#btnAll2').click(function(e) {
		
		e.preventDefault();
		
		if ($(this).attr("mode") == "hide") {
			
			
			$('#ALLPRICE2').slideDown(350);
			
			$(this).attr("mode", "show");
			
		} else {
			
			
			
			$('#ALLPRICE2').slideUp(350);
			
			$(this).attr("mode", "hide");
			
		}
		
	});
	
});
//3번 아이디 재 발급
$(document).ready(function() {
	
	$('#btnAll3').click(function(e) {
		
		e.preventDefault();
		
		if ($(this).attr("mode") == "hide") {
			
			
			$('#ALLPRICE3').slideDown(350);
			
			$(this).attr("mode", "show");
			
		} else {
			
			
			
			$('#ALLPRICE3').slideUp(350);
			
			$(this).attr("mode", "hide");
			
		}
		
	});
	
});
//4번 텐트 접는 방법
$(document).ready(function() {
	
	$('#btnAll4').click(function(e) {
		
		e.preventDefault();
		
		if ($(this).attr("mode") == "hide") {
			
			
			$('#ALLPRICE4').slideDown(350);
			
			$(this).attr("mode", "show");
			
		} else {
			
			
			
			$('#ALLPRICE4').slideUp(350);
			
			$(this).attr("mode", "hide");
			
		}
		
	});
	
});
//5번 이용 시간을 초과할시
$(document).ready(function() {
	
	$('#btnAll5').click(function(e) {
		
		e.preventDefault();
		
		if ($(this).attr("mode") == "hide") {
			
			
			$('#ALLPRICE5').slideDown(350);
			
			$(this).attr("mode", "show");
			
		} else {
			
			
			
			$('#ALLPRICE4').slideUp(350);
			
			$(this).attr("mode", "hide");
			
		}
		
	});
	
});