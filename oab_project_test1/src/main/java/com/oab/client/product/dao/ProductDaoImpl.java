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

	// 세트 레코드 건수 구현
	@Override
	public int setListCnt(ProductVO pvo) {
		return (Integer) session.selectOne("setListCnt");
	}

	// 추가 레코드 건수 구현
	@Override
	public int addListCnt(ProductVO pvo) {
		return (Integer) session.selectOne("addListCnt");
	}

	// 글 목록 구현
	@Override
	public List<ProductVO> setList(ProductVO pvo) {
		return session.selectList("setList", pvo);
	}

	// 글 목록 구현
	@Override
	public List<ProductVO> addList(ProductVO pvo) {
		return session.selectList("addList", pvo);
	}

	// 메인페이지 신상품 구현
	@Override
	public List<ProductVO> mainList() {
		return session.selectList("mainList");
	}

	// 예약하기 상품 구현
	@Override
	public ProductVO productDetail(int pt_num) {
		return session.selectOne("productDetail", pt_num);
	}
}
