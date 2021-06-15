package com.example.persistence;

import com.example.domain.AdminVO;

public interface AdminDAO {
	public AdminVO admin_login(String admin_id) throws Exception;
}
