package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOImpl implements ChartDAO{
	String namespace="com.example.mapper.ChartMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> product_click() throws Exception {
		return session.selectList(namespace+".product_click");
	}

	@Override
	public List<HashMap<String, Object>> product_selling() throws Exception {
		return session.selectList(namespace+".product_selling");
	}

}
