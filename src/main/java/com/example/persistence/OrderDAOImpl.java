package com.example.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.OrderVO;
import com.example.domain.PurchaseVO;
import com.example.domain.UserVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.PurchaseMapper";

	@Override
	public List<PurchaseVO> orderList(@Param("user_id") String user_id,@Param("cri") Criteria cri) throws Exception {		
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("cri", cri);
		return session.selectList(namespace+".orderList",map);
	}	

}
