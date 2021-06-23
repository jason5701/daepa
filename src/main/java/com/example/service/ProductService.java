package com.example.service;

import com.example.domain.ProductVO;

public interface ProductService {
	
	public void update(ProductVO vo)throws Exception;
	public ProductVO read(String product_id) throws Exception;
	
}
