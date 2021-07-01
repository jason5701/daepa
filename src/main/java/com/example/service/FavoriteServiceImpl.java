package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.FavVO;
import com.example.persistence.FavoriteDAO;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	@Autowired
	FavoriteDAO favorite_dao;
	
	@Override
	public void favorite_delete(int favorite_number) throws Exception {
		favorite_dao.favorite_delete(favorite_number);
		
	}

	@Override
	public List<FavVO> product_favorite_list(String user_id) throws Exception {
		return favorite_dao.product_favorite_list(user_id);
	}

	@Override
	public List<FavVO> meterial_favorite_list(String user_id) throws Exception {
		return favorite_dao.meterial_favorite_list(user_id);
	}



}
