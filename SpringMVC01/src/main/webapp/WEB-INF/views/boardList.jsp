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
			<div class="card-header">게시판</div>
			<div class="card-body">


				<!-- 풀이 -->
				<!-- JSTL / EL 을 이용해서 게시글(idx, 제복, 작성자) 목록 출력 -->
				<!-- 프로토타입 먼저 결정 : <thead> 와 <tbody> 필수 -->
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>idx
							</td>
							<th>제목
							</td>
							<th>작성자
							</td>
							<th>작성일
							</td>
							<th>조회수
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${list }">
							<tr>
								<td>${board.idx }</td>
								<td><a href="detail?idx=${board.idx }">${board.title }</a></td>
								<td>${board.writer }</td>
								<td>${board.indate }</td>
								<td>${board.count }</td>
								<%-- delete from BOARD where idx = #{idx} --%>
								<td><a href="delete?idx=${board.idx }" class="btn btn-secondary">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<a href="goWrite" class="btn btn-success">게시글 작성하기</a>

			</div>

			<div class="card-footer">DCX 빅데이터 8회차 안현진</div>
		</div>
	</div>

</body>
</html>
