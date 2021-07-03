package com.example.persistence;

import java.util.List;

import com.example.domain.FavVO;

public interface FavoriteDAO {
	public void favorite_delete(int favorite_number) throws Exception;
	public void product_favorite_insert(FavVO vo) throws Exception;
	public void meterial_favorite_insert(FavVO vo) throws Exception;
	public List<FavVO> product_favorite_list(String user_id) throws Exception;
	public List<FavVO> meterial_favorite_list(String user_id) throws Exception;
}
