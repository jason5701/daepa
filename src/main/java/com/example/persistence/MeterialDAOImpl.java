package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.MeterialVO;

@Repository
public class MeterialDAOImpl implements MeterialDAO{
	String namespace="com.example.mapper.MeterialMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<MeterialVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public MeterialVO read(String meterial_id) throws Exception {
		return session.selectOne(namespace+".read",meterial_id);
	}

	@Override
	public void insert(MeterialVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(MeterialVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(String meterial_id) throws Exception {
		session.update(namespace+".delete",meterial_id);
	}

	@Override
	public int totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".totalCount",cri);
	}
}
