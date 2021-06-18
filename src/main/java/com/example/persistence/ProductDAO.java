package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface ProductDAO {
	public List<ProductVO> list(Criteria cri)throws Exception;
	public ProductVO read(String product_id) throws Exception;
	public void insert(ProductVO vo) throws Exception;
	public void update(ProductVO vo) throws Exception;
	public void delete(String product_id) throws Exception;
	public int totalCount(Criteria cri)throws Exception;
}
