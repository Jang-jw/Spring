-- 게시글을 저장할 수 있는 Table 생성 
-- 글번호, 제목, 작성자, 내용, 이미지, 작성일, 조회수
create table BOARD
(
	idx int auto_increment,
	title varchar(100) not null,
	writer varchar(100) not null,
	content varchar(1000) not null,
	img varchar(100),
	indate datetime default now(),
	count int default 0,
	
	primary key (idx) 
);
-- 실행 : 블록 지정 후 alt + x 

-- 임시데이터 집어넣기 
insert into BOARD (title, writer, content)
values ('스프링 게시판 만들기','안현진','스프링을 활용한 게시판 만들기');
insert into BOARD (title, writer, content)
values ('스프링 게시판 만들기2','관리자','스프링을 활용한 게시판 만들기2');

select * from BOARD ;

select writer, count(*) as cnt
  		  from BOARD
 		 group by writer
 		 order by cnt DESC limit 5 ;