package com.oab.client.product.service;

import java.util.List;

import com.oab.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);

	public int productListCnt(ProductVO pvo);
}
