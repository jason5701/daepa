package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ReviewVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	String namespace="com.example.mapper.BoardMapper";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<ReviewVO> product_review_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".product_review_list", cri);
	}

	@Override
	public void product_review_insert(ReviewVO vo) throws Exception {
		session.insert(namespace + ".product_review_insert", vo);
		
	}

	@Override
	public ReviewVO product_review_read(int review_number) throws Exception {
		return session.selectOne(namespace + ".product_review_read", review_number);
	}

	@Override
	public void product_review_delete(int review_number) throws Exception {
		session.delete(namespace + ".product_review_delete", review_number);
		
	}

	@Override
	public void product_review_update(ReviewVO vo) throws Exception {
		session.update(namespace + ".product_review_update", vo);
		
	}

	@Override
	public String lastNumber() {
		return session.selectOne(namespace + ".lastNumber");
	}

	@Override
	public int product_totalCount(Criteria cri)throws Exception{
		
		return session.selectOne(namespace + ".product_totalCount", cri);
	}

	@Override
	public void updateReview_click(int review_number) throws Exception {
		session.update(namespace + ".updateReview_click", review_number);
		
	}

	@Override
	public List<ReviewVO> meterial_review_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".meterial_review_list", cri);
	}

	@Override
	public int meterial_totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".meterial_totalCount", cri);
	}

	@Override
	public void meterial_review_insert(ReviewVO vo) throws Exception {
		session.insert(namespace + ".meterial_review_insert", vo);
		
	}

	@Override
	public void meterial_review_delete(int review_number) throws Exception {
		session.delete(namespace + ".meterial_review_delete", review_number);
		
	}

	@Override
	public void meterial_review_update(ReviewVO vo) throws Exception {
		session.update(namespace + ".meterial_review_update", vo);
		
	}

	@Override
	public ReviewVO meterial_review_read(int review_number) throws Exception {
		return session.selectOne(namespace + ".meterial_review_read", review_number);
	}

	@Override
	public List<ReviewVO> user_review_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".user_review_list", cri);
	}

	@Override
	public void user_review_insert(ReviewVO vo) throws Exception {
		session.insert(namespace + ".user_review_insert", vo);
		
	}

	@Override
	public void user_review_delete(int review_number) throws Exception {
		session.delete(namespace + ".user_review_delete", review_number);
		
	}

	@Override
	public void user_review_update(ReviewVO vo) throws Exception {
		session.update(namespace + ".user_review_update", vo);
		
	}

	@Override
	public int user_totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".user_totalCount", cri);
	}

	@Override
	public ReviewVO user_review_read(int review_number) throws Exception {
		return session.selectOne(namespace + ".user_review_read", review_number);
	}

}
