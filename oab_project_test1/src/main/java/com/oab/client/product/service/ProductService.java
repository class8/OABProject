package com.oab.client.product.service;

import java.util.List;

import com.oab.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);

	public int productListCnt(ProductVO pvo);

	public int setListCnt(ProductVO pvo);

	public int addListCnt(ProductVO pvo);

	public List<ProductVO> setList(ProductVO pvo);

	public List<ProductVO> addList(ProductVO pvo);

	public List<ProductVO> mainList();
	
	public ProductVO productDetail(int pt_num);

}
