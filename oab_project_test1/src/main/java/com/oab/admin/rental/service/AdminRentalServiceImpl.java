package com.oab.admin.rental.service;
//개발자 : 최대근
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.rental.dao.AdminRentalDao;
import com.oab.client.rental.vo.RentalVO;

@Service
@Transactional
public class AdminRentalServiceImpl implements AdminRentalService {

	@Autowired
	private AdminRentalDao adminRentalDao;
	
	@Override
	public List<RentalVO> adminRentalList(RentalVO arvo) {
		List<RentalVO> adminRentalList = null;
		adminRentalList = adminRentalDao.adminRentalList(arvo);
		return adminRentalList;
	}

	@Override
	public int adminRentalListCnt(RentalVO arvo) {
		return adminRentalDao.adminRentalListCnt(arvo);
	}

	@Override
	public int adminRentalInsert(RentalVO arvo) {
		int result = 0;
		try {
			result = adminRentalDao.adminRentalInsert(arvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int adminRentalDelete(int rent_number) {
		int result = 0;
		try {
			result = adminRentalDao.adminRentalDelete(rent_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int adminRentalModify(RentalVO arvo) {
		int result = 0;
		try {
			result = adminRentalDao.adminRentalModify(arvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
