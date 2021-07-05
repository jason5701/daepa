package com.example.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.MeterialAndProductVO;
import com.example.domain.ProductVO;
import com.example.domain.PurchaseVO;

public interface ProductDAO {
	public List<ProductVO> list(Criteria cri)throws Exception;
	public ProductVO read(String product_id) throws Exception;
	public void admin_insert(ProductVO vo) throws Exception;
	public void update(ProductVO vo) throws Exception;
	public void delete(String product_id) throws Exception;
	public int totalCount(Criteria cri)throws Exception;
	public List<String> getDetail_images(String product_id)throws Exception;
	public List<ProductVO> admin_list(Criteria cri)throws Exception;
	public List<String> addDetail_images(@Param("product_id") String product_id,@Param("product_images") String product_images)throws Exception;
	public void delAttach(String product_id)throws Exception;
	public List<ProductVO> main_product_list(Criteria cri)throws Exception;
	public String getProduct_id()throws Exception;
	public void updateProduct_click(String product_id) throws Exception;
	public List<MeterialAndProductVO> meterial_list(String product_id) throws Exception;
	
	public void updateProduct_selling(PurchaseVO vo, String product_id) throws Exception;
}
