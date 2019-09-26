package com.oab.admin.rental.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.rental.vo.RentalVO;

@Repository
public class AdminRentalDaoImpl implements AdminRentalDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<RentalVO> adminRentalList(RentalVO arvo) {
		// TODO Auto-generated method stub
		return session.selectList("adminRentalList",arvo);
	}

	@Override
	public int adminRentalListCnt(RentalVO arvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("adminRentalListCnt");
	}

	@Override
	public int adminRentalInsert(RentalVO arvo) {
		// TODO Auto-generated method stub
		return session.insert("adminRentalInsert",arvo);
	}

	@Override
	public int adminRentalDelete(int rent_number) {
		return session.delete("adminRentalDelete",rent_number);
	}

	@Override
	public int adminRentalModify(RentalVO arvo) {
		// TODO Auto-generated method stub
		return session.update("adminRentalModify",arvo);
	}
	

}
