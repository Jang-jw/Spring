package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int idx;
	private String title;
	private String writer;
	private String content;
	private String img;
	private String indate;
	private String count;
	private int[] cnt;
}
