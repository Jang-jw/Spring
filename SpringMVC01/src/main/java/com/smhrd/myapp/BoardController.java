package com.smhrd.myapp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Board;
import com.smhrd.mapper.BoardMapper;

// POJO를 구분할 수 있는 방법 
@Controller // 이 Class 가 POJO 에요~~~ 
public class BoardController {
	
	// DI : 의존성 주입 
	// 의존성 => 해당하는 객체가 없으면 실행할 수 없다. 
	// 생성자를 사용하는 방법 : 생산성 저하, 유지보수 힘듦 (결합도가 높다) 
	// @Autowired : 메모리상에 존재하는 Bean (객체) 중에서 집어넣을 수 있는것을 찾아서 
	//	- 자동으로 주입 
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private SqlSessionFactoryBean factory;

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
	public String boardList(Model model) {
		
		// 1. 수집 
		
		
		// 2. 기능실행
		// DB 에서 게시글 조회 
		List<Board> list = mapper.list();
		System.out.println(list.size());
		
		// request 의 scope 에 게시글 정보 저장 
		// request, session 등 서버의 객체중에서 필요한 객체 발생시, 매개변수에 써주면된다. 
		// request.setAttribute("list", list); => 구형임 
		model.addAttribute("list", list);
		
		// 3. View 선택 
		return "boardList";
	}
}
