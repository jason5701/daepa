package com.example.persistence;

import java.util.List;

import com.example.domain.CartVO;

public interface CartDAO {
	
	public void cart_insert(CartVO vo) throws Exception;
	public List<CartVO> cart_list(String user_id) throws Exception;

}
