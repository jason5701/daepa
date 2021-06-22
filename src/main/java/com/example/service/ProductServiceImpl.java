package com.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductVO;
import com.example.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDAO product_dao;

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
}