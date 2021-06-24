package com.example.persistence;

import java.util.HashMap;
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
	public List<GroupSalesVO> user_list(Criteria cri,String user_id) throws Exception {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("user_id", user_id);
		return session.selectList(namespace+".group_user_list",map);
	}

	@Override
	public GroupSalesVO read(String sales_id) throws Exception {
		return session.selectOne(namespace+".read",sales_id);
	}

	@Override
	public int user_total_count(String user_id) throws Exception {
		return session.selectOne(namespace+".user_total_count",user_id);
	}

}
