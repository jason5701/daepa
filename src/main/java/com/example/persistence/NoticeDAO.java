package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> admin_list(Criteria cri)throws Exception;
	public NoticeVO admin_read(int notice_number)throws Exception;
	public void admin_update(NoticeVO vo) throws Exception;
	public int admin_notice_code()throws Exception;
	public void admin_insert(NoticeVO vo) throws Exception;
	public void admin_delete(int notice_number)throws Exception;
	public int totCount(Criteria cri)throws Exception;
}
