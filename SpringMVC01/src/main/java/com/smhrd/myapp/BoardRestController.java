package com.smhrd.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smhrd.entity.Board;
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
	
	@RequestMapping("/search")
	public List<Board> search(String search) {
		
		List<Board> list = mapper.search(search);
		
		// JavaObject => JSON
		// Gson gson = new Gson();
		// String json = gson.toJson(list);
		// return json; 
		
		return list;
	}
	
	// Ajax 사용시 한글 깨짐 방지 
	// value : URLMapping 
	// produces : content type, 응답 형식 지정 
	@RequestMapping(value="/rank", produces = "text/html; charset=utf-8")
	public String rank(){
		
		// 상위 5명의 게시글 수 
		int[] cnt = mapper.rank();
		
		// 상위 5명의 이름
		String[] writer = mapper.writer();
		
		// Gson 라이브러리를 이용해 JSON Object 직접 생성하기 
		// 1. 빈 JSONObject 만들기 + Gson 객체 생성하기 
		JsonObject json = new JsonObject();
		Gson gson = new Gson();
		
		// 2. json 안에 저장하고 싶은 데이터를 추가
		// json.add("key", value);
		json.add("writer", gson.toJsonTree(writer));
		json.add("cnt", gson.toJsonTree(cnt));
		
		return json.toString();
	}
}
