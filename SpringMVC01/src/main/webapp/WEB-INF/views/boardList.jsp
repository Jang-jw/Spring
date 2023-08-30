<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>

	<h1>게시판 메인 페이지</h1>
	
	<!-- JSTL / EL 을 이용해서 게시글 목록 출력 -->
	<table>
		<c:foreach var="i" begin="0" end="2">
			<tr>
				<td>${idx }</td>
				<td>${title }</td>
				<td>${writer }</td>
				<td>${content }</td>
				<td>${img }</td>
				<td>${indate }</td>
				<td>${count }</td>
			</tr>
		</c:foreach>
	</table>
</body>
</html>