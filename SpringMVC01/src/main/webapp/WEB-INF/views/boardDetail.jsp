<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h1>Spring MVC 01</h1>
			<p>스프링을 활용한 게시판 만들기</p>
		</div>
		<div class="card">
			<div class="card-header">게시판 작성</div>
			<div class="card-body">


				<form action="update" method="post">
				
					<input type="hidden" name="idx" value="${board.idx }">

					<div class="form-group">
						<label for="title">Title:</label> <input type="text"
							class="form-control" placeholder="Enter Title" id="title"
							name="title" value="${board.title }">
					</div>

					<div class="form-group">
						<label for="writer">Writer:</label> <input type="text"
							class="form-control" placeholder="Enter Writer" id="writer"
							name="writer" value="${board.writer }">
					</div>

					<div class="form-group">
						<label for="img">IMG File:</label> 
						<img alt="이미지 없음" src="이미지의 경로">
					</div>

					<div class="form-group">
						<label for="content">Content:</label>
						<textarea rows="10" id="content" name="content"
							class="form-control">${board.content }</textarea>
					</div>

					<a href="list" class="btn btn-warning">목록으로</a>

					<button type="submit" class="btn btn-dark">수정하기</button>

				</form>

			</div>

			<div class="card-footer">DCX 빅데이터 8회차 안현진</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "count",
				type : "post",
				data : {
					// "idx" : ${board.idx}
					"idx" : $("input[name=idx]").val()
				},
				success : function(res){
					console.log("응답 받은 값 : " + res);
				},
				error : function(e){
					console.log("error");
				}
			});
		});
	</script>
</body>
</html>
