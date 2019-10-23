package com.oab.admin.product.service;
//개발자 : 최대근
import java.util.List;

import com.oab.client.product.vo.ProductVO;

public interface AdminProductService {
	public List<ProductVO> adminProductList(ProductVO pvo); // 상품 리스트
	public int adminProductListCnt(ProductVO pvo); // 상품 레코드 수
	public ProductVO adminProductDetail(ProductVO pvo); // 상품 상세보기
	public int adminProductWrite(ProductVO pvo); // 상품 등록
	public int adminProductModify(ProductVO pvo); // 상품 수정
	public int adminProductDelete(int pt_number); // 상품 삭제
}
