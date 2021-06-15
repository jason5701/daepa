package com.example.persistence;

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

}
