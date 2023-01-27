<%@page import="com.azt.dto.ShowMyDogBoard"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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

    <title>Show My Dog Edit</title>

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
          
            <!-- Content -->

           	<h3 class="fw-bold py-3 mb-4">글수정</h3>
              
              <div class="row">
                <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h3 class="mb-0">❤️내새끼 뽐내기❤️</h3>                         
                    </div>
                    <div class="card-body">                    
                      <form id="editform" action="showmydogedit.action" method="post" enctype= “multipart/form-data” >                      	
                      	<div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-boardno">글번호</label>
                          	<div class="col-sm-10">
                            <input type="hidden" class="form-control" name="boardno" value="${ board.boardNo }" >
                            ${ board.boardNo }                            
                          </div>
                        </div>                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">제목</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" value="${ board.title }" >                            
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-memberid">작성자</label>
                          <div class="col-sm-10">
                            ${ board.writer }
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-file">첨부파일 확인 수정</label>
                          	<div class="col-sm-10">                          	
                          	<input type="file"
			                       name="attach"
			                       class="form-control" /><br>
                            <img class="card-img-top" 
                            	 style="height: 600px; width: 60%"
                            	 src="showmydogdownload.action?attachno=${ board.boardNo } "							
                             	 alt="Card image cap" />
<%--                               <% for (BoardAttach file : board.getFiles()) { %>  --%>
<%-- 				                <a href="download.action?attachno=<%= file.getAttachNo() %>"> --%>
<%-- 				                <%= file.getUserFileName() %>   --%>				        
<%--                               <% } %> --%>
                            </div>
                          </div>                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">❤️내새끼 자랑하기❤️</label>
                          	<div class="col-sm-10">
                            	<textarea
	                              id="basic-default-message"
	                              class="form-control"
	                              name="content"
	                              style="resize: none"   
	                              name="content" cols="76" rows="15"                                                       
	                            >${ board.content }
	                            </textarea><br><br>
                          	</div>
                       	  </div>    
                        </form>       
                          
                        <div class="row justify-content-end">
			                <div class="col-sm-7">                                  	
				                <a id="edit-btn" href="javascript:"><button class="btn btn-warning" >수정완료</button></a>                
				                <a href="javascript:history.back()"><button type="submit" class="btn btn-danger" >취소</button></a>
			                </div><br><br><br>
		                </div>	                        
                       </div>
                      </div>
                     </div> 
                   	</div>
                   </div>
                                 
                             
                
              <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    <!-- Page JS -->    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">	
	$('#edit-btn').on('click',function(event) {
		event.preventDefault();
		$('#editform').submit();
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
      </div>
    </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
 
    <!-- / Layout wrapper -->

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	
  </body>
</html>