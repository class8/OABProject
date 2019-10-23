package com.oab.admin.product.service;
//개발자 : 최대근
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.product.dao.AdminProductDao;
import com.oab.client.product.vo.ProductVO;

@Service
@Transactional
public class AdminProductServiceImpl implements AdminProductService {
	
	@Autowired
	private AdminProductDao adminProductDao;
	
	@Override
	public List<ProductVO> adminProductList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = adminProductDao.adminProductList(pvo);
		return productList;
	}

	@Override
	public int adminProductListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return adminProductDao.adminProductListCnt(pvo);
	}

	@Override
	public ProductVO adminProductDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail  = adminProductDao.adminProductDetail(pvo);
		return detail;
	}

	@Override
	public int adminProductWrite(ProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.adminProductWrite(pvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result=0;
		}
		return result;
	}

	@Override
	public int adminProductModify(ProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.adminProductModify(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int adminProductDelete(int pt_number) {
		int result = 0;
		try {
			result = adminProductDao.adminProductDelete(pt_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
