package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Board;

@Mapper // 이 파일이 xml 이랑 연결될 파일임을 명시 
public interface BoardMapper { // Data Access "Object" 가 아님 

	// 추상메소드 
	// 메소드 명 == id 
	public List<Board> list();
	public int write(Board board);
	
	// @Delete("delete from BOARD where idx = #{idx}") // 어노테이션으로 SQL 문 실행이 가능하다. (주의) 
	public void delete(Board board);
	public Board detail(int idx);
	public int update(Board board);
	public void count(Board board);
	public int count(int idx);
	public List<Board> search(String search);
	public int[] rank();
	public String[] writer();
	
}
