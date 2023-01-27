 
<%@page import="java.util.List"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
<!-- <head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link rel="Stylesheet" href="/demoweb/resources/styles/default.css" />
	<style type="text/css">
	a { text-decoration: none; }
	</style>	
</head> -->
<body>

	
		
	<div id="pageContainer">		
		<div style="padding-top:25px;text-align:center">
			
			
			[&nbsp;<a href="write">글쓰기</a>&nbsp;]
				
			<br /><br />
			
			<table border="1" align="center">
				<tr style="background-color:beige;height:25px">
					<th style="width:50px">번호</th>
					<th style="width:300px">제목</th>
					<th style="width:150px">가격</th>
					<th style="width:120px">작성자</th>
					
				</tr>
				 
			</table>
			
			<br><br>
			
			${ pager }
			
		</div>
	</div>

</body>
</html>













