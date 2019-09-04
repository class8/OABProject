$(function() {
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
      $("#search").change(function() {
         if ($("#search").val() == "all") {
            $("#keyword").val("전체 데이터 조회합니다.");
         } else if ($("#search").val() != "all") {
            $("#keyword").val("");
            $("#keyword").focus();
         }
      });

      /* 검색 버튼 클릭 시 처리 이벤트 */
      $("#searchData").click(function() {
         if ($("#search").val() != "all") {
            if (!chkSubmit($('#keyword'), "검색어를")) {
               return;
            }
         }
         goPage(1);
      });

      $(".order").click(function() {
         var order_by = $(this).attr("data-value");
         console.log("선택값 : " + order_by);
         $("#order_by").val(order_by);
         if ($("#order_sc").val() == 'DESC') {
            $("#order_sc").val('ASC');
         } else {
            $("#order_sc").val('DESC');
         }
         goPage(1);
      });

      // 한페이지에 보여줄 레코드 수가 변경될 때마다 처리 이벤터 
      $("#pageSize").change(function() {
         goPage(1);
      });

      /* 글쓰기 버튼 클릭 시 처리 이벤트 */
      $("#productWrite").click(function() {
         location.href = "/admin/product/productWriteForm";
      });

      /* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
      $(".goDetail").click(function() {
         var p_num = $(this).parents("tr").attr("data-num");
         $("#pt_number").val(p_num);
         console.log("글번호 : " + p_num);
         //상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
         $("#detailForm").attr({
            "method" : "get",
            "action" : "/admin/product/adminProductDetail"
         });
         $("#detailForm").submit();
      });
});

   /* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실직적인 처리 함수 */
   function goPage(page) {
      if ($("#search").val() == "all") {
         $("#keyword").val("");
      }
      $("#page").val(page);
      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/product/adminProductList"
      });
      $("#f_search").submit();
   }
   
   //키워드 체크
   function chkSubmit(item, msg) {
		if (item.val().replace(/\s/g, "") == "") {
			alert(msg + " 입력해 주세요");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}