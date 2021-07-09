package com.example.service;

import com.example.domain.ReviewVO;

public interface BoardService {
	public ReviewVO product_review_read(int review_number) throws Exception;
	public ReviewVO meterial_review_read(int review_number) throws Exception;
	public ReviewVO user_review_read(int review_number) throws Exception;
	public ReviewVO admin_review_read(int review_number) throws Exception;
}
