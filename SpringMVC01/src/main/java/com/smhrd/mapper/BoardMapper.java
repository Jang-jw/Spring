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
	public void delete(Board board);
}
