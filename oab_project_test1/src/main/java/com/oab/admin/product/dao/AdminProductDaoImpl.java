package com.oab.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.product.vo.ProductVO;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ProductVO> adminProductList(ProductVO pvo) {
		return session.selectList("adminProductList",pvo);
	}

	@Override
	public int adminProductListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("adminProductListCnt");
	}

	@Override
	public ProductVO adminProductDetail(ProductVO pvo) {
		return (ProductVO) session.selectOne("adminProductDetail" , pvo);
	}

	@Override
	public int adminProductWrite(ProductVO pvo) {
		return session.insert("adminProductInsert",pvo);
	}

	@Override
	public int adminProductModify(ProductVO pvo) {
		return session.update("adminProductUpdate",pvo);
	}
	
	@Override
	public int adminProductDelete(int pt_number) {
		return session.delete("adminProductDelete",pt_number);
	}

}
