package com.example.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.OrderVO;
import com.example.domain.PurchaseVO;
import com.example.domain.UserVO;

public interface OrderDAO {
	public List<PurchaseVO> orderList(@Param("user_id")String user_id,@Param("cri") Criteria cri) throws Exception;
}
