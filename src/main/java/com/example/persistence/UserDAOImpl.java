package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	String namespace="com.example.mapper.UserMapper";
	@Autowired
	SqlSession session;

	@Override
	public List<UserVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public UserVO read(String user_id) throws Exception {
		return session.selectOne(namespace+".read",user_id);
	}

	@Override
	public int totalCount() throws Exception {
		return session.selectOne(namespace+".totalCount");
	}

	@Override
	public void register(UserVO vo) throws Exception {
		session.insert(namespace+".register",vo);
	}


	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public UserVO login(String user_id) throws Exception {
		return session.selectOne(namespace+".login",user_id);
	}
	//아이디 중복체크
	@Override
	public int idChk(UserVO vo) throws Exception {
		int result=session.selectOne(namespace+".idChk",vo);
		return result;
	}
}
