package com.example.service;

import com.example.domain.ProductVO;
import com.example.domain.PurchaseVO;

public interface ProductService {
	
	public void update(ProductVO vo)throws Exception;
	public ProductVO read(String product_id) throws Exception;
	public void updateProduct_selling(PurchaseVO vo, String product_id) throws Exception;
	
}
