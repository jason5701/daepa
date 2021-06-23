package com.example.persistence;

import java.util.HashMap;
import java.util.List;

public interface ChartDAO {
	public List<HashMap<String,Object>> product_click()throws Exception;
	public List<HashMap<String,Object>> product_selling() throws Exception;
}
