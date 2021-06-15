package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(String user_id) throws Exception;
	public List<UserVO> list(Criteria cri) throws Exception;
	public UserVO read(String user_id) throws Exception;
	public int totalCount() throws Exception;
	public void register(UserVO vo) throws Exception;
	public void update(UserVO vo) throws Exception;
}
