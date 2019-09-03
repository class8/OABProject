package com.oab.client.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.product.dao.ProductDao;
import com.oab.client.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	private Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Autowired
	private ProductDao productDao;

	// 글 목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> myList = null;
		// 정렬에 대한 기본값 설정
		if (pvo.getOrder_by() == null) {
			pvo.setOrder_by("pt_name");
		}
		if (pvo.getOrder_sc() == null) {
			pvo.setOrder_sc("DESC");
		}
		myList = productDao.productList(pvo);
		return myList;
	}

	// 전체 레코드 수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return productDao.productListCnt(pvo);
	}
}
