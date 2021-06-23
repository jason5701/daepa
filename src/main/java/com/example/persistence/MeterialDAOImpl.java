package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.MeterialAndProductVO;
import com.example.domain.MeterialVO;

@Repository
public class MeterialDAOImpl implements MeterialDAO{
	String namespace="com.example.mapper.MeterialMapper";
	
	@Autowired
	SqlSession session;

	@Override
	public List<MeterialVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public MeterialVO read(String meterial_id) throws Exception {
		return session.selectOne(namespace+".read",meterial_id);
	}

	@Override
	public void insert(MeterialVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(MeterialVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(String meterial_id) throws Exception {
		session.update(namespace+".delete",meterial_id);
	}

	@Override
	public int totalCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".totalCount",cri);
	}

	@Override
	public List<MeterialVO> admin_list(Criteria cri) throws Exception {
		return session.selectList(namespace+".admin_list",cri);
	}

	@Override
	public List<String> getDetail_images(String meterial_id) throws Exception {
		return session.selectList(namespace+".getDetail_images",meterial_id);
	}

	@Override
	public List<String> addDetail_images(String meterial_id, String meterial_detail_images) throws Exception {
		HashMap<String,Object> map=new HashMap<>();
		map.put("meterial_id", meterial_id);
		map.put("meterial_detail_images", meterial_detail_images);
		return session.selectList(namespace+".addDetail_images",map);
	}

	@Override
	public void delAttach(String meterial_id) throws Exception {
		session.delete(namespace+".delAttach",meterial_id);
	}

	@Override
	public void updateMeterial_click(String meterial_id) throws Exception {
		session.update(namespace+".updateMeterial_click", meterial_id);
	}

	@Override
	public List<MeterialAndProductVO> product_list(String meterial_id) throws Exception {
		return session.selectList(namespace+".product_list", meterial_id);
	}
}
