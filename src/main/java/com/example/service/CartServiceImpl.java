package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.CartVO;
import com.example.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO cart_dao;

	@Override
	public void cart_insert(CartVO vo) throws Exception {
		cart_dao.cart_insert(vo);
	}

	@Override
	public List<CartVO> cart_list(String user_id) throws Exception {
		return cart_dao.cart_list(user_id);
	}

	@Override
	public void cart_delete(int cart_number) throws Exception {
		cart_dao.cart_delete(cart_number);
	}

}
