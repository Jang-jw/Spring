package com.smhrd.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.mapper.BoardMapper;

@RestController // 이 컨트롤러가 처리하는 요청은 모두 데이터만 응답함 
public class BoardRestController {
	
	// REST api 
	// 요청을 받았을 때, 요청에 맞는 데이터를 응답 
	
	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/count")
	public String count(int idx) {
		// @ResponseBody => 메소드의 리턴 값이 곧 응답하는 값이다. 
		//	- 응답 내용은 String 으로 작성해야 함. 
		// 생략 가능 => POJO 의 어노테이션이 @RestController 일 때만 생략 가능 

		mapper.count(idx);
		
		return "Ajax 요청 성공";
	}
}
