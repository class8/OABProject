<%@page import="com.oab.client.product.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 화면</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/product/adminProductModify.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("input[type=image]").attr("disabled",true);
		// 취소 버튼 클릭 시 디테일 페이지 이동 처리 이벤트 
		$("#productModifyCancel")
				.click(
						function() {
							location.href = "/admin/product/adminProductDetail?pt_number=${modifyData.pt_number}&page=${param.page}&pageSize=${param.pageSize}";
						});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/product.css" />
</head>
<body>

	<div class="main_content">
		<div>
		</div>

		<div class="contentTB_D">

			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<input type="hidden" id="pt_number" name="pt_number"
					value="${modifyData.pt_number }" /> <input type="hidden"
					id="pt_thumb" name="pt_thumb" value="${modifyData.pt_thumb }">
				<input type="hidden" name="pt_image1" id="pt_image1"
					value="${modifyData.pt_image1}" /> <input type="hidden"
					name="pt_image2" id="pt_image2" value="${modifyData.pt_image2}" />
				<input type="hidden" name="pt_image3" id="pt_image3"
					value="${modifyData.pt_image3}" /> <input type="hidden"
					name="pt_selectUpdate" id="pt_selectUpdate"
					value="${modifyData.pt_type}" /> <input type="hidden"
					name="pt_statusUpdate" id="pt_statusUpdate"
					value="${modifyData.pt_status}" /> <input type="hidden"
					name="page" id="page" value="${param.page }" /> <input
					type="hidden" name="pageSize" id="pageSize"
					value="${param.pageSize }">
				<table>
					<tbody>
						<tr id="P_update">
							<th height="35px">상품 종류 선택</th>
							<td><label for="pt_set">세트상품</label> <input type="radio"
								id="pt_set" name="pt_type" value="세트상품"> <label
								for="pt_add">추가상품</label> <input type="radio" id="pt_add"
								name="pt_type" value="추가상품"></td>
						</tr>
						<tr id="P_update">
							<th height="35px">상품명</th>
							<td><input type="text" id="pt_name" name="pt_name"
								value="${modifyData.pt_name }"></td>
						</tr>
						<tr id="P_update">
							<th>상품 썸네일</th>
							<td colspan="3"><input type="image" id="old_thumb"
								src="/uploadStorage/thumb/${modifyData.pt_thumb}" height="100px" >
								<input type="file" id="file" name="file" onchange="filetest()"></td>
						</tr>
						<tr id="P_update">
							<th>상품 이미지1</th>
							<td colspan="3"><input type="image" id="old_image1"
								src="/uploadStorage/image1/${modifyData.pt_image1}"
								width="350xp" height="100px" value="${modifyData.pt_image1}">
								<input type="file" id="file1" name="file1" onchange="filetest()" />
							</td>
						</tr>
						<tr id="P_update">
							<th>상품 이미지2</th>
							<td colspan="3"><input type="image" id="old_image2"
								src="/uploadStorage/image2/${modifyData.pt_image2}"
								width="350xp" height="100px" value="${modifyData.pt_image2}">
								<input type="file" id="file2" name="file2" onchange="filetest()" />
							</td>
						</tr>
						<tr id="P_update">
							<th>상품 이미지3</th>
							<td colspan="3"><input type="image" id="old_image3"
								src="/uploadStorage/image3/${modifyData.pt_image3}"
								width="350xp" height="100px" value="${modifyData.pt_image3}">
								<input type="file" id="file3" name="file3" onchange="filetest()" />
							</td>
						</tr>
						<tr id="P_update">
							<th>상품 상세 설명</th>
							<td colspan="3"><textarea rows="5" cols="40"
									id="pt_explain" name="pt_explain">
						${modifyData.pt_explain}
                     </textarea></td>
						</tr>
						<tr id="P_update">
							<th height="35px">상품 가격</th>
							<td><input type="text" name="pt_price" id="pt_price"
								value="${modifyData.pt_price}" /></td>
						</tr>
						<tr id="P_update">
							<th height="35px">상품 등록일</th>
							<td>${modifyData.pt_regdate}</td>
						</tr>
						<tr id="P_update">
							<th height="35px">상품 대여 가능 유무</th>
							<td colspan="3"><label for="pt_statusOk">대여가능</label> <input
								type="radio" id="pt_statusOk" name="pt_status" value="대여가능">
								<label for="pt_statusNo">대여불가</label> <input type="radio"
								id="pt_statusNo" name="pt_status" value="대여불가"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<input type="button" value="수정" id="productModify"> <input
			type="button" value="취소" id="productModifyCancel">
	</div>
</body>
</html>