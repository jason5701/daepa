package com.example.service;

import com.example.domain.UserVO;

public interface UserService {
	public void register(UserVO vo) throws Exception;
	public UserVO login(String user_id) throws Exception;
	public int idChk(UserVO vo) throws Exception;	
	public void update_users(UserVO vo) throws Exception;
}
