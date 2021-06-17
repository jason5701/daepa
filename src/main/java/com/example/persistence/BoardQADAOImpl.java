package com.example.persistence;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;

@Repository
public class BoardQADAOImpl implements BoardQADAO{
	String namespace="com.example.mapper.BoardQAMapper";
	
	@Autowired
	SqlSession session;
			
	@Override
	public List<BoardQAVO> boardQA_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".boardQA_list", cri);
	}

	@Override
	public BoardQAVO boardQA_read(int boardQA_number) throws Exception {
		return session.selectOne(namespace + ".boardQA_read", boardQA_number);
	}

	@Override
	public int totalCount() throws Exception {
		return session.selectOne(namespace + ".totalCount");
	}
	

}
