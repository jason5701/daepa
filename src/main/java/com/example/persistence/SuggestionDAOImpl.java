package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.SuggestionVO;

@Repository
public class SuggestionDAOImpl implements SuggestionDAO{
	String namespace="com.example.mapper.SuggestionMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<SuggestionVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".admin_list",cri);
	}

	@Override
	public int suggestion_count() throws Exception {
		return session.selectOne(namespace+".suggestion_count");
	}

	@Override
	public SuggestionVO read(int suggestion_number) throws Exception {
		return session.selectOne(namespace+".admin_read",suggestion_number);
	}

	@Override
	public void suggestion_confirm(int suggestion_number) throws Exception {
		session.update(namespace+".suggestion_confirm",suggestion_number);
	}


}
