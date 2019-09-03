package com.oab.client.product.dao;

import java.util.List;

import com.oab.client.product.vo.ProductVO;

public interface ProductDao {
	public List<ProductVO> productList(ProductVO pvo);

	public int productListCnt(ProductVO pvo);
}
