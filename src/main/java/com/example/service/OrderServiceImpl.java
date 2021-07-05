package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.OrderVO;
import com.example.domain.PurchaseVO;
import com.example.persistence.PurchaseDAO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	PurchaseDAO purchase_dao;
	
	@Override
	public void update_orderstatus(OrderVO ordervo) throws Exception {
				
	}

}
