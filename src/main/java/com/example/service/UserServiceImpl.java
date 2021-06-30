package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.UserVO;
import com.example.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	String namespace="com.example.mapper.UserMapper";
	@Autowired
	UserDAO user_dao;
	
	@Override
	public int idChk(UserVO vo) throws Exception {
		int result=user_dao.idChk(vo);
		return result;
	}

	@Override
	public void register(UserVO vo) throws Exception {
	}


	@Override
	public UserVO login(String user_id) throws Exception {
		UserVO vo= new UserVO();
		return vo;
	}

	@Override
	public void update_users(UserVO vo) throws Exception {
		user_dao.update(vo);
		
	}

}
