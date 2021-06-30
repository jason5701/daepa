package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.MeterialAndProductVO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	String namespace="com.example.mapper.SearchMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<MeterialAndProductVO> search_plist(Criteria cri) throws Exception {
		return session.selectList(namespace + ".search_plist", cri);
	}

	@Override
	public List<MeterialAndProductVO> search_mlist(Criteria cri) throws Exception {
		return session.selectList(namespace + ".search_mlist", cri);
	}

	@Override
	public int search_plist_count(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".search_plist_count", cri);
	}

	@Override
	public int search_mlist_count(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".search_mlist_count", cri);
	}

}
