package com.example.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.OrderVO;
import com.example.domain.PurchaseVO;

public interface PurchaseDAO {
	public List<PurchaseVO> orderList(@Param("order_number") int order_number,@Param("user_id") String user_id)throws Exception;
	public List<PurchaseVO> orders(@Param("user_id") String user_id,@Param("cri") Criteria cri)throws Exception;
	public List<PurchaseVO> admin_order_list(Criteria cri)throws Exception;
	public void order_insert(OrderVO vo) throws Exception;
	public int total_Orders(@Param("user_id") String user_id,@Param("cri") Criteria cri) throws Exception;
	public List<PurchaseVO> admin_purchase_List(int order_number)throws Exception;	

}
