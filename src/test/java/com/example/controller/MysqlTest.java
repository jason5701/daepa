package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.persistence.GroupSalesDAO;
import com.example.persistence.NoticeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class MysqlTest {
	 @Autowired
	 private NoticeDAO noticeDAO;
	 
	 @Test
	 public void insert() throws Exception{
		 NoticeVO vo=new NoticeVO();
		 vo.setNotice_title("test01 test01");
		 vo.setNotice_contents("공지사항 내용 테스트입니다.");
		 noticeDAO.admin_insert(vo);
	 }
	 
	 @Autowired
	 private GroupSalesDAO group_dao;
	 	
	 @Test
	 public void group_sales_list()throws Exception{
		 Criteria cri=new Criteria();
		 group_dao.list(cri);
	 }
	}
