<%-- <%@ page import="com.endb.dto.room"%> --%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">
<html>
<head>
	<!-- <meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" href="/demoweb/resources/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/resources/styles/input2.css" />
	<style type="text/css">
	a { text-decoration: none }
	</style> -->

	<style type="text/css">
	.my-col-lg-4 {
	flex: 0 0 auto;
	margin: auto;
	width: 33.333333%;
}
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
	
		
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle"></div>
		        <h2 class="tm-text-primary mb-5">호스트 되기</h2>
		        <form id="writeform" 
		        	  action="write" 
		        	  method="post"
		        	  enctype="multipart/form-data">
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:550px" />
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
							
							${ loginuser.userNo }
							<input type="hidden" 
								   name="user_no" value="${ loginuser.userNo }">
							
							
		                </td>
		            </tr>
		            <tr>
		                <th>첨부파일</th>
		                <td>		                    
		                    <input type="file" name="attach">
		                </td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                    <textarea style="resize: none"
		                    		  name="content" cols="76" rows="15"></textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        	
		        	<a id="write" href="javascript:" class="btn btn-primary" style="float: left; margin:2px">글쓰기</a>
		        	&nbsp;&nbsp;
		        	<a href="/endb/home" class="btn btn-primary" style="float: left; margin:2px">목록보기</a>
		        	
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>
	
	<!-- <script src="/demoweb/js/jquery-3.6.0.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
	/* 
	var writeLink = document.querySelector("#write");
	writeLink.addEventListener("click", function(event) {
		event.preventDefault();
		var writeForm = document.querySelector("#writeform");
		writeForm.submit(); // submit : form을 서버로 전송 (submit button click과 같은 효과)
	}); 
	*/
	$(function() {
		
		$('#write').on('click', function(event) { // on : jquery의 이벤트 연결 함수 (addEventListener)
			event.preventDefault();
			$('#writeform').submit();
		});
		
	});
	</script>

</body>
</html>
