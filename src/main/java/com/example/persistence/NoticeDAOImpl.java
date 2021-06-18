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
	public List<NoticeVO> admin_list(Criteria cri) throws Exception {
		return session.selectList(namespace+".admin_list",cri);
	}

	@Override
	public NoticeVO admin_read(int notice_number) throws Exception {
		return session.selectOne(namespace+".admin_read",notice_number);
	}

	@Override
	public void admin_update(NoticeVO vo) throws Exception {
		session.update(namespace+".admin_update",vo);
	}

	@Override
	public int admin_notice_code() throws Exception {
		return session.selectOne(namespace+".admin_notice_code");
	}

	@Override
	public void admin_insert(NoticeVO vo) throws Exception {
		session.insert(namespace+".admin_insert",vo);
	}

	@Override
	public void admin_delete(int notice_number) throws Exception {
		session.delete(namespace+".admin_delete",notice_number);
	}

	@Override
	public int totCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".totCount",cri);
	}
	
	
}
