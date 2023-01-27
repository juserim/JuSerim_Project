<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.ShowMyDogBoardAttach"%>
<%@page import="com.azt.dao.ShowMyDogBoardDao"%>
<%@page import="com.azt.dto.ShowMyDogBoard"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String appName = "azt-website"; %>

<!DOCTYPE html>

<!-- beautify ignore:start -->
<html
  lang="ko"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/<%= appName %>/static/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Show My Dog Detail</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />

    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />
    
  </head>

  <body>  
  	
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
    	<div class="layout-container">        
    		<jsp:include page="/WEB-INF/views/modules/layout-menu.jsp" />
        
    <!-- Layout container -->
    	<div class="layout-page">          
    		
    		<jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" />
          
	     <!-- Content wrapper -->
	     	<div class="content-wrapper">
	     
	      	<div class="container-xxl flex-grow-1 container-p-y">
	                  
	       	<div id="pageContainer">            
	        
	      	<div class="row">
	      
          <!-- Basic Layout -->
          <div class="col-xxl">
            <div class="card mb-4">
              <div class="card-header d-flex align-items-center justify-content-center ">
                <h3 class="pb-1 my-5">❤️내새끼 뽐내기❤️</h3>                      
              </div>
              <div class="card-body">
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label " for="basic-default-boardno"><h6>제목</h6></label>
                  	<div class="col-sm-10">
                  	<input type="hidden" class="form-control" name="boardno" value="${board.boardNo}" >
                  <h4>😍${board.boardNo}.&nbsp;&nbsp;${board.title}&nbsp;😍</h4>
                </div>
                </div>                        
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label" for="basic-default-memberid">
                  	<h6>작성자</h6></label>
                  <div class="col-sm-10">
                    ${board.writer}
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label" for="basic-default-file">
                  	<h6>다운로드 👉👉👉👉👉</h6></label>
                  <div class="col-sm-10"> 
                  <c:forEach var="file" items="${ board.files }">                  
                     <a href="showmydogdownload.action?attachno=${ file.attachNo }">
               			${ file.userFileName }	               
          			 </a><br>
               	  </c:forEach>  
       	  	<% ShowMyDogBoard board = (ShowMyDogBoard)request.getAttribute("board"); %>               		            
               	<% if (board.getFiles().size() == 0) { %>	
		 		  	<img src="/<%= appName %>/static/assets/img/showmydog/사진없음.jpg" alt="Card image cap" />
				 <% } else { %>									
					<img style="height: 600px; width: 60%" src="/azt-website/upload-files/<%=board.getFiles().get(0).getSavedFileName() %>"/>	
				 <% } %> 
                   </div>
                </div>                                                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label" for="basic-default-content">
                  	<h6>❤️내새끼 자랑하기❤️</h6></label>
                  <div class="col-sm-10">
<% String enter2 = "\r\n"; %>
<c:set var="enter" value="
" />
		                ${ fn:replace(board.content, enter, '<br>') }
                  </div>
                </div> 
             <div class="row justify-content-end">
                  
             <div class="col-sm-7">      
            <c:if test="${ loginuser.memberId eq board.writer }">                            	
             <a id="edit-btn" href="javascript:"><button class="btn btn-warning" >수정</button></a>
              	<a id="delete-btn" href="javascript:"><button class="btn btn-danger" >삭제</button></a> 
            </c:if>      
            	<a href="showmydoglist.action?pageNo=${ pageNo }">
            	<button type="submit" class="btn btn-secondary" >목록보기</button></a>   
            	           	
             </div>                       
           </div><br><br>
          </div> 
       </div>
     </div>                  
   </div>    
  
   <!-- 댓글 표시 영역--> 

  
  	<div class="col-xxl">
  	<div class="card body"><br><br> 
	   <div style="text-align: left;">
		   <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글</h4></div>
  		 
        		<table id="comment-list"style="width:800px;margin:0 auto"></table> 
        		<c:if test="${ comments eq null}">
        		<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		🔔댓글을 지금 입력해주세요.</a><br></c:if>
        </div>
     </div>
  	      
   <!-- /댓글 표시 영역 -->    
   
   <!-- 댓글 쓰기 영역--> 
		      <div id="comment-write" class="card-body">      
				<div class="card mb-4 shadow-none bg-transparent ">             
		        	
		        	<h5 class="card-header">댓글 작성하기</h5>
		        	<form id="comment-form">
		        		
		        		  <div class="form-floating"/>
				            <input
				              type="text"
				              class="form-control"	
				              id="comment"			             
				              name="content"
				              placeholder="댓글"
				              aria-describedby="floatingInputHelp"
				            />
				            <input type="hidden" name='writer' value='${ loginuser.memberId }'>
							<input type="hidden" name='boardno' value='${ board.boardNo }'>
							<input type="hidden" name='commentno'>
				            <input type="hidden" name='action'>
				            <label for="floatingInput">로그인 후 댓글 작성 가능</label>
				            </form>
				           
				       		<br>
				       		
				            <button id="comment-btn" style="float:right" class="btn btn-primary" >작성하기</button>
				            
				       	  </div>				         
				        </div>
					 </div>
			      </div> 		    	
		      
		    
		    
   <!-- /댓글 쓰기 영역 --> 
   
        

     <!-- Overlay -->
     <div class="layout-overlay layout-menu-toggle"></div>
     </div>
    
    <!-- Page JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
   
    $(function() {
    	
    $('#edit-btn').click(function(event) {
    	event.preventDefault();
    	var ok = confirm('수정할까요?');
    	if (ok) {
    		location.href = 'showmydogedit.action?boardno=${ board.boardNo }';
		}
	});	
    
    $('#delete-btn').click(function(event) {
    	event.preventDefault();
    	var ok = confirm('삭제할까요?');
    	if (ok) {
			location.href = 'showmydogdelete.action?boardno=${ board.boardNo }';
		}
    });	
    
    /////////////////////////////////////////////////////////////////////////////
    
	 // comment 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
		$('#comment-list').load('comment-list.action?boardno=' + ${ board.boardNo });
				
		$('#comment-btn').on('click', function(event) {
			event.preventDefault();
			
			var content = $('#comment').val(); // val() == value 속성
			if (content.length == 0) {
				alert('내용을 작성하세요');
				return;
			}
			
			var formData = $('#comment-form').serialize();
			
			$.ajax({
				"url" : "comment-write.action",
				"method" : "post",
				"async" : true,
				"data" : formData, 
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					if (data === "success") {			
						alert('댓글 등록 완료');
						// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
						$('#comment-list').load('comment-list.action?boardno=' + ${ board.boardNo });
						
					} else {
						alert('로그인 해주세요');						
					}
				},
				"error" : function(xhr, status, err) {
					alert('댓글 쓰는 중 오류 발생');
				}
			});
			
		});
		
		
		$('#comment-list').on('click', '.deletecomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment
			// 어느 댓글을 삭제할까요? --> 삭제할 댓글 번호는 무엇?
			var commentNo = $(this).attr("data-commentno"); // this : 이벤트 발생 객체 (여기서는 <a>)			
			var ok = confirm(commentNo + "번 댓글을 삭제할까요?");
			if (!ok) {
				return;
			}
			
			$.ajax({
				"url": "comment-delete.action",
				"method" : "get",
				"async" : true,
				"data" : "commentno=" + commentNo,
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					alert('삭제 성공');
					// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
					$('#comment-list').load('comment-list.action?boardno=' + ${ board.boardNo });
				},
				"error" : function(xhr, status, err) {
					alert('삭제 실패');
				}
			});
		});
		
		function toggleEditDisplay(commentNo, isEdit) {
			$('#commentview' + commentNo).css('display', isEdit ? 'none' : 'block');
			$('#commentedit' + commentNo).css('display', isEdit ? 'block' : 'none');
		}
		
		var currentEditCommentNo = null;
		$('#comment-list').on('click', '.editcomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment			
			var commentNo = $(this).attr("data-commentno");
			if (currentEditCommentNo) {
				toggleEditDisplay(currentEditCommentNo, false);
			}
			currentEditCommentNo = commentNo;			
			toggleEditDisplay(commentNo, true);
		});
		
		$('#comment-list').on('click', '.cancel', function(event) { // 현재 + 미래에 존재하는 .deletecomment
			var commentNo = $(this).attr("data-commentno");
			toggleEditDisplay(commentNo, false);
			currentEditCommentNo = null;
		});
		
		$('#comment-list').on('click', '.updatecomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment
			var commentNo = $(this).attr("data-commentno");
			var formData = $('#updateform' + commentNo).serialize();
			$.ajax({
				"url" : "comment-update.action",
				"method" : "post",
				"async" : true,
				"data" : formData,
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					alert('success')	;
					// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
					$('#comment-list').load('comment-list.action?boardno=' + ${ board.boardNo });
				}, 
				"error" : function(xhr, status, err) {
					alert('수정 실패')	;
				}			
			});
		});
	});	
	</script>
	
	
    
     <!-- / Layout wrapper -->

	 <jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

	 <!-- Footer -->
      <jsp:include page="/WEB-INF/views/modules/footer.jsp" />
     <!-- /Footer -->
     
     		<!-- / Content -->
   			<div class="content-backdrop fade"></div>
   	 	</div>          
   		<!-- Content wrapper -->
   		</div>
     <!-- / Layout page -->
     	</div>

     <!-- Overlay -->
     	<div class="layout-overlay layout-menu-toggle"></div>
 
     <!-- / Layout wrapper -->
	 <jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	</div>
   </div>
	 
  </body>
</html>
 
	