package com.example.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CartVO;
import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;

@Repository
public class CartDAOImpl implements CartDAO{
	String namespace="com.example.mapper.CartMapper";
	
	@Autowired
	SqlSession session;

	//장바구니 담기
	@Override
	public void cart_insert(CartVO vo) throws Exception {
		session.insert(namespace+".cart_insert", vo);
	}

	//장바구니 목록
	@Override
	public List<CartVO> cart_list(String user_id) throws Exception {
		return session.selectList(namespace+".cart_list", user_id);
	}

	//장바구니 삭제
	@Override
	public void cart_delete(int cart_number) throws Exception {
		session.delete(namespace+".cart_delete", cart_number);
	}

	//장바구니 중복체크
	@Override
	public int cart_count(String product_id, String user_id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("user_id", user_id);
		return session.selectOne(namespace+".cart_count", map);
	}

	//장바구니 중복 수량수정
	@Override
	public void cart_update_qtt(CartVO vo) throws Exception {
		session.update(namespace+".cart_update_qtt", vo);
	}

	//장바구니 수정
	@Override
	public void cart_update(CartVO vo) throws Exception {
		session.update(namespace+".cart_update", vo);
	}

	@Override
	public int cart_total(String user_id) throws Exception {
		session.selectOne(namespace+".cart_total", user_id);
		return session.selectOne(namespace+".cart_total", user_id);
	}
	
}
