package com.example.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	String namespace="com.example.mapper.AdminMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public AdminVO admin_login(String admin_id) throws Exception {
		return session.selectOne(namespace+".admin_login",admin_id);
	}
	
	
}
