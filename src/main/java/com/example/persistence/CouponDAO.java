package com.example.persistence;

import java.util.List;

import com.example.domain.CouponVO;

public interface CouponDAO {
	public List<CouponVO> admin_list()throws Exception;
	public CouponVO admin_read(String coupon_id)throws Exception;
	public void admin_update(CouponVO vo)throws Exception;
	public void admin_insert(CouponVO vo)throws Exception;
	public int coupon_id()throws Exception;
}
