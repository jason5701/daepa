package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.PurchaseVO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO{
	
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.PurchaseMapper";

	@Override
	public List<PurchaseVO> order_List(String user_id, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
