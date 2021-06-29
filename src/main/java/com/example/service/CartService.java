package com.example.service;

import java.util.List;

import com.example.domain.CartVO;

public interface CartService {
	
	public void cart_insert(CartVO vo) throws Exception;
	public List<CartVO> cart_list(String user_id) throws Exception;
	public void cart_delete(int cart_number) throws Exception;
	public int cart_count(String product_id, String user_id) throws Exception;
	public void cart_update_qtt(CartVO vo) throws Exception;
	public void cart_update(CartVO vo) throws Exception;
	public int cart_total(String user_id) throws Exception;
	
}
