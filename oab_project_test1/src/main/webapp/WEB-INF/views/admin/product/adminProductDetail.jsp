<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세 보기</title>
<script type="text/javascript" src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/admin/include/js/adminProduct/productDetail.js"></script>
<script type="text/javascript">
$(function() {
	/* 첨부파일 이미지 보여주기 위한 속성 추가 */
	var file = "<c:out value='${detail.pt_thumb}'/>";
	if(file != ""){
		$("#fileImage").attr({
			src : "/uploadStorage/thumb/${detail.pt_thumb}",
			width : "450px",
			height : "200px"
		});
	}
		
	var file1 = "<c:out value='${detail.pt_image1}'/>";
	if(file1 != ""){
		$("#fileImage1").attr({
			src : "/uploadStorage/image1/${detail.pt_image1}",
			width : "450px",
			height : "200px"
		});
	}
		
	var file2 = "<c:out value='${detail.pt_image2}'/>";
	if(file2 != ""){
		$("#fileImage2").attr({
			src : "/uploadStorage/image2/${detail.pt_image2}",
			width : "450px",
			height : "200px"
		});
	}
		
	var file3 = "<c:out value='${detail.pt_image3}'/>";
	if(file3 != ""){
		$("#fileImage3").attr({
			src : "/uploadStorage/image3/${detail.pt_image3}",
			width : "450px",
			height : "200px"
		});
	}
	
	/* 목록 버튼 클릭 시 처리 이벤트 */
	$("#productListBtn").click(function(){
		location.href="/admin/product/adminProductList?page=${param.page}&pageSize=${param.pageSize}";
	});
	
	//삭제 버튼
	$("#productDeleteBtn").click(function () {
		if(confirm("${detail.pt_name}" + " 상품을 정말 삭제하시겠습니까?")){
			$("#f_data").attr("action" , "/admin/product/adminProductDelete");
			$("#f_data").submit();
		}
	});
});
</script>
</head>
<body>
	<div >
		<div ><h3>OBA 텐트 상세보기</h3></div>
		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="pt_number" value="${detail.pt_number}"/>
			<input type="hidden" name="page" id="page" value="${param.page}"/>
			<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
			<input type="hidden" name="pt_thumb" id="pt_thumb" value="${detail.pt_thumb}" />
			<input type="hidden" name="pt_image1" id="pt_image1" value="${detail.pt_image1}" />
			<input type="hidden" name="pt_image2" id="pt_image2" value="${detail.pt_image2}" />
			<input type="hidden" name="pt_image3" id="pt_image3" value="${detail.pt_image3}" />
		</form>
		<table >
			<tr>
				<td >
					<input type="button" value="수정" id="productModifyFormBtn"/>
					<input type="button" value="삭제" id="productDeleteBtn"/>
					<input type="button" value="목록" id="productListBtn"/>
				</td>
			</tr>
		</table>
		<%-- =========== 상세 정보 보여주기 시작 =========== --%>
		<div >
			<table>
				<tbody>
					<tr>
						<td >상품 종류</td>
						<td>${detail.pt_type}</td>
					</tr>
					<tr>
						<td >상품명</td>
						<td>${detail.pt_name}</td>
					</tr>
						<tr>
							<td >썸네일 이미지</td>
							<td><img id="fileImage"> </td>
						</tr>
					<c:if test="${detail.pt_image1 != ''}">
						<tr>
							<td >이미지1</td>
							<td><img id="fileImage1"> </td>
						</tr>
					</c:if>
					<c:if test="${detail.pt_image2 != ''}">
						<tr>
							<td>이미지2</td>
							<td><img id="fileImage2"> </td>
						</tr>
					</c:if>
					<c:if test="${detail.pt_image3 != ''}">
						<tr>
							<td>이미지3</td>
							<td><img id="fileImage3"> </td>
						</tr>
					</c:if>
					<tr>
						<td>상품 상세 설명</td>
						<td >${detail.pt_explain}</td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td >${detail.pt_price}</td>
					</tr>
					<tr>
						<td>상품 등록일자</td>
						<td>${detail.pt_regdate}</td>
					</tr>
					<tr>
						<td>상품 대여가능 유무</td>
						<td>${detail.pt_status}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>