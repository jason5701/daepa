package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;
import com.example.domain.ReviewVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	String namespace="com.example.mapper.BoardMapper";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<ReviewVO> review_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".review_list", cri);
	}

	@Override
	public void review_insert(ReviewVO vo) throws Exception {
		session.insert(namespace + ".review_insert", vo);
		
	}

	@Override
	public ReviewVO review_read(int review_number) throws Exception {
		return session.selectOne(namespace + ".review_read", review_number);
	}

	@Override
	public void review_delete(int review_number) throws Exception {
		session.delete(namespace + ".review_delete", review_number);
		
	}

	@Override
	public void review_update(ReviewVO vo) throws Exception {
		session.update(namespace + ".review_update", vo);
		
	}

	@Override
	public String lastNumber() {
		return session.selectOne(namespace + ".lastNumber");
	}

	@Override
	public int totalCount() {
		return session.selectOne(namespace + ".totalCount");
	}

	@Override
	public void updateReview_click(int review_number) throws Exception {
		session.update(namespace + ".updateReview_click", review_number);
		
	}
	
}
