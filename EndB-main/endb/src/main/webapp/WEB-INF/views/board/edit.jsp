<%@page import="com.endb.dto.Room"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
 
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>글수정</title>
	<link rel="Stylesheet" href="/endb/resources/styles/default.css" />
	<link rel="Stylesheet" href="/endb/resources/styles/input2.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
		  rel="stylesheet">
	<style type="text/css">
	a { text-decoration: none }
	table {
            width: 100%;
            border: 1px solid #444444;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #444444;
            padding: 10px;
        }

        td {
            width: 80%;
            max-width: 600px;
            word-break: break-word;
        }

        th {
            width: 20%;
        }
	</style>	
		
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle"></div>
		        <h2 class="tm-text-primary mb-5">글 수정</h2>
		        <form id="editform" action="edit" method="post">
		        <table>
		        	<tr>
		                <th>글번호</th>
		                <td>
		                	<input type="hidden" 
		                		   name="room_id" value="${ room.room_id }">
		                	${ room.room_id }
		                </td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:560px"
		                    	   value="${ room.title }">
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${ room.user_no }</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                    <textarea name="content" style="resize:none" cols="76" 
		                    	rows="15">${ room.content }</textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">        	
		        	<a id="edit-btn" href="javascript:" class="btn btn-primary" style="float: left; margin:2px">글수정</a>
		        	<a href='javascript:history.back()' class="btn btn-primary" style="float: left; margin:2px">취소</a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
	
	$('#edit-btn').on('click', function(event) {
		event.preventDefault();
		$('#editform').submit();
	});
	</script>

</body>
</html>








