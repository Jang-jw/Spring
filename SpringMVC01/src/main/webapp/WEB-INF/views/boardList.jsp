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
							<td colspan="5"><input type="text" name="search"
								class="form-control"></td>
							<td>
								<button id="searchBtn" class="btn btn-secondary">검색</button>
							</td>
						</tr>
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
								<td><a href="delete?idx=${board.idx }"
									class="btn btn-secondary">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<a href="goWrite" class="btn btn-success">게시글 작성하기</a>

			</div>

			<div class="card-footer">DCX 빅데이터 8회차 안현진</div>
		</div>
	</div>

	<div class="card">
		<canvas id="myChart"></canvas>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		$(document).ready(function(){
			$('#searchBtn').on('click',function(){
				const input = $('input[name=search]')
				$.ajax({
					url : 'search',
					type : 'get',
					data : {
						'search' : input.val()
					},
					success : function(res){
						console.log(res);
						
						const tbd = $('tbody');
						tbd.html('');
						for(let i = 0; i < res.length; i++){
							
							// 한 행을 만들고
							var tr = `
								<tr>
									<td>\${res[i].idx}</td>
									<td><a href="detail?idx=\${res[i].idx}">\${res[i].title}</a></td>
									<td>\${res[i].writer}</td>
									<td>\${res[i].indate}</td>
									<td>\${res[i].count}</td>
									<td>\${res[i].count}</td>
									<td><a href="delete?idx=\${res[i].idx}" class="btn btn-secondary">삭제</a></td>
								</tr>
								`;
							
							// tbd 에 집어넣기 
							tbd.append(tr);
						}
					},
					error : function(){
						console.log("error");
					}
				});
			}); // 버튼 클릭이벤트 끝 
			rank();
		});
		
		function rank(){
			
			// 비동기 통신을 이용해서,  
			// 가장 많은 게시글을 작성한 5명의 사용자의 이름과 작성한 게시글 수를 가져오는 함수
			// 응답받은 내용을 console 창에 출력 
			$.ajax({
				url : 'rank',
				dataType : 'json',
				success : function(res){
					console.log(res);
					drawChart(res);
				},
				error : function(){
					console.log("error");
				}
			});
		}
		
		function drawChart(json){
			  const ctx = document.getElementById('myChart');

			  new Chart(ctx, {
			    type: 'bar',
			    data: {
			      labels: json.writer,
			      datasets: [{
			        label: '#', // # : numbers 
			        backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                  ],
			        data: json.cnt,
			        borderWidth: 1
			      }]
			    },
			    options: {
			      scales: {
			        y: {
			          beginAtZero: true
			        }
			      }
			    }
			  });
		}
	</script>

</body>
</html>
