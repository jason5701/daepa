package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;

@Repository
public class CommonQADAOImpl implements CommonQADAO{
	String namespace="com.example.mapper.CommonQAMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<CommonQAVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public CommonQAVO read(int commonQA_number) throws Exception {
		return session.selectOne(namespace+".read",commonQA_number);
	}
	
	
}
