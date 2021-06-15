package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.mapper.MysqlMapper;
import com.example.mapper_oracle.OracleMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class OracleTest {
	 @Autowired
	 private OracleMapper mapper;
	 
	 @Test
	 public void getTime() { mapper.getTime(); }
	}
