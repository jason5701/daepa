package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	String namespace="com.example.mapper.ProductMapper";
	@Autowired
	SqlSession session;
	
	@Override
	public List<ProductVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public ProductVO read(String product_id) throws Exception {
		return session.selectOne(namespace+".read",product_id);
	}

	@Override
	public void insert(ProductVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(ProductVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(String product_id) throws Exception {
		session.update(namespace+".delete",product_id);
	}

	@Override
	public int totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".totalCount",cri);
	}

	@Override
	public List<String> getDetail_images(String product_id) throws Exception {
		return session.selectList(namespace+".getDetail_images",product_id);
	}

	@Override
	public List<ProductVO> admin_list(Criteria cri) throws Exception {
		return session.selectList(namespace+".admin_list",cri);
	}
	@Override
	public List<String> addDetail_images(String product_id, String product_images) throws Exception {
		HashMap<String,Object> map=new HashMap<>();
		map.put("product_id", product_id);
		map.put("product_images", product_images);
		
		return session.selectList(namespace+".addDetail_images",map);
	}
	@Override
	public void delAttach(String product_id) throws Exception {
		session.delete(namespace+".delAttach",product_id);
	}
	
	@Override
	public List<ProductVO> main_product_list(Criteria cri) throws Exception {
		return session.selectList(namespace+".main_product_list", cri);
	}
}
