package com.oab.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.product.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("productList", pvo);
	}

	// 전체 레코드 건수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return (Integer) session.selectOne("productListCnt");
	}
}
