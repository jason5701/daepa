package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;

@Repository
public class BoardQADAOImpl implements BoardQADAO{
   String namespace="com.example.mapper.BoardQAMapper";
   
   @Autowired
   SqlSession session;

   @Override
   public List<BoardQAVO> product_boardQA_list(Criteria cri) throws Exception {
      return session.selectList(namespace + ".product_boardQA_list", cri);
   }

   @Override
   public BoardQAVO product_boardQA_read(int boardQA_number) throws Exception {
      return session.selectOne(namespace + ".product_boardQA_read", boardQA_number);
   }

   @Override
   public int totalCount(Criteria cri) throws Exception {
      return session.selectOne(namespace + ".totalCount",cri);
   }

   @Override
   public void product_boardQA_update(BoardQAVO vo) throws Exception {
      session.update(namespace + ".product_boardQA_update", vo);
      
   }

   @Override
   public List<BoardQAVO> user_boardQA_list(Criteria cri) throws Exception {
      return session.selectList(namespace + ".user_boardQA_list", cri);
   }

   @Override
   public BoardQAVO user_boardQA_read(int boardQA_number) throws Exception {
      return session.selectOne(namespace + ".user_boardQA_read", boardQA_number);
   }

   @Override
   public void user_boardQA_update(BoardQAVO vo) throws Exception {
      session.update(namespace+ ".user_boardQA_update", vo);
   }

   @Override
   public void product_boardQA_insert(BoardQAVO vo) throws Exception {
      session.insert(namespace+ ".product_boardQA_insert", vo);
      
   }

   @Override
   public String lastNumber() throws Exception {
      return session.selectOne(namespace + ".lastNumber");
   }

   @Override
   public void product_boardQA_delete(int boardQA_number) throws Exception {
      session.delete(namespace+ ".product_boardQA_delete", boardQA_number);
      
   }

   @Override
   public int user_totalCount(Criteria cri) throws Exception {
      return session.selectOne(namespace+ ".user_totalCount", cri);
   }

	@Override
	public List<BoardQAVO> admin_boardQA_list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".admin_boardQA_list", cri);
	}

	@Override
	public int admin_totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".admin_totalCount",cri);
	}

	@Override
	public BoardQAVO admin_boardQA_read(int boardQA_number) throws Exception {
		return session.selectOne(namespace + ".admin_boardQA_read", boardQA_number);
	}
}