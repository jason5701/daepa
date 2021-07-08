package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;

@Repository
public class CommonQADAOImpl implements CommonQADAO{
   String namespace="com.example.mapper.CommonQAMapper";
   
   @Autowired
   SqlSession session;

   @Override
   public List<CommonQAVO> admin_list(Criteria cri) throws Exception {
      return session.selectList(namespace+".admin_list",cri);
   }

   @Override
   public CommonQAVO admin_read(int commonQA_number) throws Exception {
      return session.selectOne(namespace+".admin_read",commonQA_number);
   }

   @Override
   public void admin_insert(CommonQAVO vo) throws Exception {
      session.insert(namespace+".admin_insert",vo);
   }

   @Override
   public int admin_commonQA_code() throws Exception {
      return session.selectOne(namespace+".admin_commonQA_code");
   }

   @Override
   public List<CommonQAVO> commonQA_list(Criteria cri) throws Exception {
      return session.selectList(namespace + ".commonQA_list", cri);
   }

   @Override
   public int totalCount(Criteria cri) throws Exception {
      return session.selectOne(namespace + ".totalCount", cri);
   }

   @Override
   public CommonQAVO commonQA_read(int commonQA_number) throws Exception {
      return session.selectOne(namespace + ".commonQA_read", commonQA_number);
      
   }

   @Override
   public int admin_totalCount(Criteria cri) throws Exception {
      return session.selectOne(namespace + ".admin_totalCount", cri);
   }
   
   
}