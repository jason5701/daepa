package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo) throws Exception;
	public List<UserVO> list(Criteria cri) throws Exception;
	public int totalCount() throws Exception;
	public void register(UserVO vo) throws Exception;
	public void update(UserVO vo) throws Exception;
	public int idChk(UserVO vo) throws Exception;
	public void point_update(UserVO vo) throws Exception;
}
