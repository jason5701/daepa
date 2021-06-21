package com.example.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.persistence.ProductDAO;

@Controller
@RequestMapping("/product/")
public class ProductController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	ProductDAO product_dao;
	
	@RequestMapping("admin_product.json")
	@ResponseBody
	public Map<String, Object> admin_product_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(10);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(product_dao.totalCount(cri));
		map.put("list", product_dao.admin_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}

	@RequestMapping("product.json")
	@ResponseBody
	public Map<String, Object> product_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(product_dao.totalCount(cri));
		map.put("list", product_dao.list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String admin_update(ProductVO vo, MultipartHttpServletRequest multi)throws Exception{
		System.out.println("어드민 상품수정!!!!!!!!"+vo.toString());
		ProductVO oldVO=product_dao.read(vo.getProduct_id());
		
		//대표 이미지 파일업로드
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setProduct_image(image);
			
			//예전이미지가 존재한다면 삭제
			if(oldVO.getProduct_image()!=null){
				new File(path + "/" + oldVO.getProduct_image()).delete();
			}
		}else{
			vo.setProduct_image(oldVO.getProduct_image());
		}
		product_dao.update(vo);
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value="getAttach",method=RequestMethod.POST)
	@ResponseBody
	public List<String> getAttach(String product_id)throws Exception{
		return product_dao.getDetail_images(product_id);
	}
}
