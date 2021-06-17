package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO{
	String namespace="com.example.mapper.CouponMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<CouponVO> admin_list() throws Exception {
		return session.selectList(namespace+".admin_list");
	}

	@Override
	public CouponVO admin_read(String coupon_id) throws Exception {
		return session.selectOne(namespace+".admin_read",coupon_id);
	}

	@Override
	public void admin_update(CouponVO vo) throws Exception {
		session.update(namespace+".admin_update",vo);
	}

	@Override
	public void admin_insert(CouponVO vo) throws Exception {
		session.insert(namespace+".admin_insert",vo);
	}

	@Override
	public int coupon_id() throws Exception {
		return session.selectOne(namespace+".coupon_id");
	}
}
