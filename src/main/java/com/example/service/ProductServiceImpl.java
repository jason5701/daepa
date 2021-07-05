package com.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductVO;
import com.example.domain.PurchaseVO;
import com.example.persistence.ProductDAO;
import com.example.persistence.PurchaseDAO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	PurchaseDAO purchase_dao;
	
	@Transactional
	@Override
	public void update(ProductVO vo) throws Exception {
		product_dao.update(vo);
		product_dao.delAttach(vo.getProduct_id());
		
		String files[]=vo.getDetail_images();

		if(files==null) return;
		for(String fullName:files){
			product_dao.addDetail_images(vo.getProduct_id(), fullName);
		}
	}
	
	@Transactional
	@Override
	public ProductVO read(String product_id) throws Exception {
		ProductVO vo=product_dao.read(product_id);
		product_dao.updateProduct_click(product_id);
		return vo;
	}

	@Transactional
	@Override
	public void updateProduct_selling(PurchaseVO vo, String product_id) throws Exception {
		purchase_dao.purchase_insert(vo);
		product_id=vo.getProduct_id();
		product_dao.updateProduct_selling(vo, product_id);
	}
}
