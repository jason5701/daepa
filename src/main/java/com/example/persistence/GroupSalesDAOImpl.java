package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.GroupSalesVO;

@Repository
public class GroupSalesDAOImpl implements GroupSalesDAO{
	String namespace="com.example.mapper.GroupSalesMapper";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<GroupSalesVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".group_list",cri);
	}

	@Override
	public GroupSalesVO read(String sales_id) throws Exception {
		return session.selectOne(namespace+".read",sales_id);
	}

}
