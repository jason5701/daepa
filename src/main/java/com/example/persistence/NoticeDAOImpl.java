package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	String namespace="com.example.mapper.NoticeMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<NoticeVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public NoticeVO read(int notice_number) throws Exception {
		return session.selectOne(namespace+".read",notice_number);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public int notice_code() throws Exception {
		return session.selectOne(namespace+".notice_code");
	}
	
	
}
