package com.smhrd.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// POJO를 구분할 수 있는 방법 
@Controller // 이 Class 가 POJO 에요~~~ 
public class BoardController {

	// ~~~ 요청을 받았을 때 (URLMapping)
	// ~~~ 기능이 실행되면 좋겠습니다~~~ 
	// => 메소드를 만들어서 처리 
	@RequestMapping("/home") // URLMapping 을 지정하는 어노테이션 
	public String home() {
		System.out.println("요청이 들어옴~");
		
		// 페이지 이동하는 법~ 
		// jsp로 이동하고 싶은 경우, JSP 의 이름만 리턴을 시켜주면 된다. 
		// 리턴타입이 void 인 경우, URLMapping 과 동일한 이름의 jsp 로 이동이된다. 
		return "home";
	}
	
	@RequestMapping("/list")
	public String boardList() {
		return "boardList";
	}
}
