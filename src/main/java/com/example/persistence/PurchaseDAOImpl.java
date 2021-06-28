package com.example.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	public List<PurchaseVO> orderList(@Param("order_number") int order_number,@Param("user_id") String user_id) throws Exception {		
		Map<String, Object> map=new HashMap<>();
		map.put("order_number", order_number);
		map.put("user_id", user_id);
		return session.selectList(namespace+".orderList",map);
	}

	@Override
	public List<PurchaseVO> admin_order_list(Criteria cri) throws Exception {
		return session.selectList(namespace+".admin_order_list",cri);
	}

	@Override
	public List<PurchaseVO> orders(@Param("user_id") String user_id,@Param("cri") Criteria cri) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("cri", cri);
		return session.selectList(namespace+".orders",map);
	}

	@Override
	public int total_Orders(@Param("user_id") String user_id,@Param("cri") Criteria cri) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("cri", cri);
		return session.selectOne(namespace+".total_Orders",map);
	}

}
