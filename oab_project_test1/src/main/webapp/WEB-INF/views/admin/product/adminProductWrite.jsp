<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/product/adminProductWrite.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/product.css" />
</head>
<body>
	<h1>상품 등록 폼</h1>
	<form id="productWriteForm" name="productWriteForm"
		enctype="multipart/form-data">
		<table class="contentTB">
			<tr id="write_th">
				<th>상품 종류 선택</th>
				<td><label for="pt_set">세트상품</label> <input type="radio"
					id="pt_set" name="pt_type" value="세트상품" checked="checked">
					<label for="pt_add">추가상품</label> <input type="radio" id="pt_add"
					name="pt_type" value="추가상품"></td>
			</tr>
			<tr id="list_th">
				<th>상품 명</th>
				<td><input type="text" id="pt_name" name="pt_name"></td>
			</tr>
			<tr id="list_th">
				<th>상품 이미지</th>
				<td id="btn"><input type="file" id="file" name="file"> <br /> <input
					type="file" id="file1" name="file1" /> <br /> <input type="file"
					id="file2" name="file2" /> <br /> <input type="file" id="file3"
					name="file3" /></td>
			</tr>
			<tr id="list_th">
				<th>상품 상세 설명</th>
				<td><textarea rows="5" cols="40" id="pt_explain"
						name="pt_explain"></textarea></td>
			</tr>
			<tr id="list_th">
				<th>상품 가격</th>
				<td><input type="text" id="pt_price" name="pt_price"></td>
			</tr>
			<tr id="write_th">
				<th>상품 대여가능 유무</th>
				<td><label for="pt_statusOk">대여가능</label> <input type="radio"
					id="pt_statusOk" name="pt_status" value="대여가능" checked="checked">
					<label for="pt_statusNo">대여불가</label> <input type="radio"
					id="pt_statusNo" name="pt_status" value="대여불가"></td>
			</tr>
		</table>
	</form>
	<div>
		<input type="button" id="productWrite" name="productWrite" value="등록" />
		<input type="button" id="productWriteCancel" value="취소">
	</div>
</body>
</html>