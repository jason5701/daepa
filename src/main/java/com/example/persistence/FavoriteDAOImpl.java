package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.FavVO;

@Repository
public class FavoriteDAOImpl implements FavoriteDAO{
	String namespace="com.example.mapper.FavMapper";
	
	@Autowired
	 SqlSession session;
	  
	@Override
	public void favorite_delete(int favorite_number) throws Exception {
		session.delete(namespace+".favorite_delete", favorite_number);
		
	}

	@Override
	public List<FavVO> product_favorite_list(String user_id) throws Exception {
		return session.selectList(namespace+".product_favorite_list", user_id);
	}

	@Override
	public List<FavVO> meterial_favorite_list(String user_id) throws Exception {
		return session.selectList(namespace+".meterial_favorite_list", user_id);
	}

	@Override
	public void product_favorite_insert(FavVO vo) throws Exception {
		  session.insert(namespace+".product_favorite_insert", vo);
		
	}

	@Override
	public void meterial_favorite_insert(FavVO vo) throws Exception {
		session.insert(namespace+".meterial_favorite_insert", vo);
		
	}

}
