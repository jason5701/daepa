package com.example.service;

import com.example.domain.ReviewVO;

public interface BoardService {
	public ReviewVO review_read(int review_number) throws Exception;
}
