package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.HotdealVO;

@Repository
public class HotdealDAOImpl implements HotdealDAO{
	String namespace="com.example.mapper.HotdealMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<HotdealVO> hotdeal(Criteria cri) throws Exception {
		return session.selectList(namespace+".hotdeal",cri);
	}

	@Override
	public List<HotdealVO> hotdeal_detail(int hotdeal_number) throws Exception {
		return session.selectList(namespace+".hotdeal_detail",hotdeal_number);
	}

}
