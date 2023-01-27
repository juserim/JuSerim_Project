<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.HotplaceBoardAttach"%>
<%@page import="com.azt.dto.HotplaceBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	    
    
<% String appName = "azt-website"; %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html
  lang="en"
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

    <title>Hot Place Recommendation✨</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />

    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />
	  
	   <style type="text/css">
	    .show-img {
			  width: 650px;
			  height: auto;
			  object-fit: cover;
			}
	    </style>
	  
  
  </head>
  
<body>


 <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
      
        
        <jsp:include page="/WEB-INF/views/modules/layout-menu.jsp" />        
        <!-- Layout container -->
        
        <div class="layout-page">
          <jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" />
          <div class="container-xxl flex-grow-1 container-p-y">
 		
          <!-- Content wrapper -->
          <div class="content-wrapper">
          
          
           <!-- Content -->
            <h1 class="display-2 mb-0" style="font-family: 'Lobster', cursive;">Hot Place Recommendation✨</h1>
            <small class="text-light fw-semibold">우리 댕댕이들과 함께 즐기는 핫플 추천해요!!</small>			
                
             <div class="row">
              <!-- Basic Layout -->
              <%HotplaceBoard board =(HotplaceBoard)request.getAttribute("hotplaceBoard"); %>  
              <h6 class="pb-1 mb-4" style="text-align: right;"><small class="text-light fw-semibold">첨부파일 💾</small>
              
              
              <% for (HotplaceBoardAttach file : board.getFiles()) { %>
		                <a class="badge bg-dark"
		                   href="hotplaceDownload.action?attachno=<%=file.getAttachNo() %>" 
		                   value="<%=file.getUserFileName() %>">downloads</a><br><% } %></h6>
		                   
		                   
		                   	
              <div class="col-xxl">
              <div class="card mb-4">              
              	                   
                 <h5 class="mt-4">&nbsp;&nbsp;&nbsp;&nbsp;<small>Title</small>&nbsp;&nbsp;<%= board.getTitle()%></h5>
	              <div class="row">
	              <div class="col-md mb-4 mb-md-0">              
	              <div class="accordion-item card">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconTwo">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionIcon-2"
                          aria-controls="accordionIcon-2"
                        >View Details </button></h2>
                        
                      <div id="accordionIcon-2" class="accordion-collapse collapse show" data-bs-parent="#accordionIcon">
                        <div class="accordion-body">
                          작성자  <span class="badge bg-label-primary me-1"><%= board.getWriter()%></span>&nbsp;&nbsp;
                          작성일자  <%= board.getWriteDate()%>&nbsp;&nbsp;
                          조회수  <%= board.getReadCount()%>                        
                        </div>
                      </div></div>
               		<div class="accordion-item card">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconTwo">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionIcon-2"
                          aria-controls="accordionIcon-2"
                        >
                          View Location and Place
                        </button>
                      </h2>
                      <div id="accordionIcon-2" class="accordion-collapse collapse show" data-bs-parent="#accordionIcon">
                        <div class="accordion-body">
                          <span class="badge bg-label-warning me-1"><%= board.getLoc()%></span>&nbsp;&nbsp;
                          <span class="badge bg-label-info me-1"><%= board.getPlace()%></span>                         
                        </div>
                      </div></div>       

                    <div class="accordion-item card active">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconThree">
                        <button
                          type="button"
                          class="accordion-button"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionIcon-3"
                          aria-expanded="true"
                          aria-controls="accordionIcon-3"
                        >
                          Content
                        </button>
                      </h2>
                      <div
                        id="accordionIcon-3"
                        class="accordion-collapse collapse show"
                        data-bs-parent="#accordionIcon"
                      >
                        <div class="accordion-body">
                       	<br>
                         <!-- file 첨부 -->
                         <% if (board.getFiles().size() == 0) { %>
                         <img class="show-img" src="/azt-website/mainimage/noneimage.png">
                         <% } else { %>
                         <img class="show-img" src="/azt-website/upload-files/<%= board.getFiles().get(0).getSavedFileName() %>">
                         <% } %>
                      	 <!-- / file 첨부 -->
                      	 <br><br>
                      	  <%= board.getContent().replace("\r\n", "<br>")%>
                        </div>
                        </div></div></div></div></div>
                      
                  	</div></div>
                  
                  		<!-- 댓글 보여주기 -->
                  		
                  		<div class="card bg-info text-white mb-3" id="comment-list">
                  		
                  		</div>
                  		
			                 <!--  <div class="card bg-info text-white mb-3">
			                    <div class="card-header"> <h5 class="card-title text-white">Comment</h5></div>			                    
			                    <div class="card-body">
			                    	<div class="divider text-start">
                                     <div class="divider-text" id="comment-list"> 바보님의 댓글입니다</div></div>
                                     <p class="card-text">Some quick example text to build on the card title and make up.</p>
                                     <a style="font-size: 8pt;">수정</a>&nbsp;
                                     <a style="font-size: 8pt;">삭제</a>
				                     	                     	      
                     	      </div>
			                  </div> -->
			                  
			                 
                		
                 			<!-- /댓글 보여주기 -->
                   		    <!--    댓글작성 -->
	                        
	                        <form  id="comment-form">
	                        <div class="input-group">	                        
	                        <textarea
	                          name="content" id="comment-content-w"
	                          class="form-control"
	                          aria-label="Recipient's username"
	                          aria-describedby="button-addon2"></textarea>	                        
	                        <input type="hidden" name="writer" value="${ loginuser.memberId }" >
	                        <input type="hidden" name="boardno" value="${ hotplaceBoard.boardNo }" >
	                        <input type="hidden" name="commentno">
	                        <button class="btn btn-outline-primary" 
	                        		type="button" id="comment-btn">댓글 등록하기</button>
	                         
	                      </div></form>
                       <!--  /댓글작성  -->                       
                       
                  		
                          <div class="col-sm-10" class="row justify-content-center">                           
                             <div class="demo-inline-spacing" >  
                                                   
                             <% Member member = (Member)session.getAttribute("loginuser"); %>
                             <% if (member != null && member.getMemberId().equals(board.getWriter())) { %>                             
                             <a id='delete-btn' href="javascript:"
                             class="btn btn-outline-primary">Delete</a>                             
                             <a id="Edit" href="/azt-website/hotplaceBoard/hotplaceEdit.action?boardno=<%=board.getBoardNo()%>" 
					         class="btn btn-outline-primary">Edit</a> 
					         <a href="/azt-website/hotplaceBoard/hotplaceList.action" 
					         class="btn btn-outline-primary">List</a> 	
					         <% } else { %>	
					         <a href="/azt-website/hotplaceBoard/hotplaceList.action" 
					         class="btn btn-outline-primary">List</a> 
					         <% } %>			         
					                       
                          </div>  
                        </div></div>
                        </div></div></div>

            <!-- / Content -->

            <div class="content-backdrop fade"></div>            
          </div>
        
        
          <!-- Content wrapper -->  
        <!-- / Layout page -->
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    
    <!-- / Layout wrapper -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>	
	<script type="text/javascript">		
		
	$(function() {
				
		<%-- var deleteBtn = document.querySelector("#delete-btn");
		deleteBtn.addEventListener("click", function(event) {
			event.preventDefault();
			var ok = confirm("삭제할까요?");
			if (ok) {
				location.href = "hotplaceDelete.action?boardno=<%=board.getBoardNo()%>";	
			} 
		});	 --%>
		
			$('#delete-btn').click(function (event) {
				event.preventDefault();
				var ok = confirm("삭제할까요?");
				if (ok) {
					location.href = "hotplaceDelete.action?boardno=${ board.boardNo }";	
				} 
			});
			
		
				$('#comment-list').load('comment-list.action?boardno=' + ${ hotplaceBoard.boardNo});
		
				$('#comment-btn').on('click', function(event) {
					event.preventDefault();
					
					var content = $('#comment-content-w').val();
					if (content.lenght == 0 ) {
						alert('댓글 내용을 작성하세요.');
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
								if ( data === "success" ) {
									//confirm('댓글을 등록 하시겠습니까?');
									$('#comment-content-w').val("");
									
									$('#comment-list').load('comment-list.action?boardno=' + ${ hotplaceBoard.boardNo });
								} else {
									alert('댓글 등록 실패');
								}
							},
							"error" : function(xhr, status, err) {
								alert('댓글 등록 중 오류 발생');
							}
					});
					
					 
					
				});
				
			$('#comment-list').on('click','.deletecomment', function(event) {
				var commentNo = $(this).attr("data-commentno");
				var ok = confirm('삭제 된 댓글은 영구삭제됩니다. 삭제할까요?');
				if (!ok) {
					return;
				}
				
				$.ajax({
					"url" : "comment-delete.action",
					"method" : "get",
					"async" : true,
					"data" : "commentno=" + commentNo,
					"dataType" : "text",
					"success" : function(data, status, xhr) {
						alert('삭제 성공');
						$('#comment-list').load('comment-list.action?boardno=' + ${ hotplaceBoard.boardNo});
						
					},
					"error" : function (xhr, status, err) {
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
						//alert('수정 성공')	;
						$('#comment-list').load('comment-list.action?boardno=' + ${ hotplaceBoard.boardNo });
					}, 
					"error" : function(xhr, status, err) {
						alert('수정 실패')	;
					}
				
			    });
								
			});
				
				
				
				
				
		});	
	</script>
	
	
	
	
</body>
</html>