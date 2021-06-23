package com.example.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.MeterialAndProductVO;
import com.example.domain.MeterialVO;

public interface MeterialDAO {
	public List<MeterialVO> admin_list(Criteria cri)throws Exception;
	public List<MeterialVO> list(Criteria cri)throws Exception;
	public MeterialVO read(String meterial_id) throws Exception;
	public void admin_insert(MeterialVO vo) throws Exception;
	public void update(MeterialVO vo) throws Exception;
	public void delete(String meterial_id) throws Exception;
	public int totalCount(Criteria cri)throws Exception;
	public List<String> getDetail_images(String meterial_id)throws Exception;
	public List<String> addDetail_images(@Param("meterial_id") String meterial_id,@Param("meterial_detail_images") String meterial_detail_images)throws Exception;
	public void delAttach(String meterial_id)throws Exception;
	public String getMetrial_id()throws Exception;
	public void updateMeterial_click(String meterial_id) throws Exception;
	public List<MeterialAndProductVO> product_list(String meterial_id) throws Exception;
}
