package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> list(Criteria cri)throws Exception;
	public NoticeVO read(int notice_number)throws Exception;
	public void update(NoticeVO vo) throws Exception;
	public int notice_code()throws Exception;
}
