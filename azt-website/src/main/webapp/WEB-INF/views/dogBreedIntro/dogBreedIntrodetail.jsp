<%@page import="com.azt.dto.DogBreedIntroAttach"%>
<%@page import="com.azt.dao.DogBreedIntroDao"%>
<%@page import="com.azt.dto.DogBreedIntro"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>Dog Breed Intro Detail</title>

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
                <h3 class="pb-1 my-5">귀여운 댕댕이에 대해 알아봅시다!</h3>                      
              </div>
              <div class="card-body">                      
                <% DogBreedIntro board = (DogBreedIntro)request.getAttribute("board"); %>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label " for="basic-default-boardno"><h6>제목</h6></label>
                    	<div class="col-sm-10">
                    	<input type="hidden" class="form-control" name="boardno" value="<%= board.getBoardNo() %>" >
                    <h4><%= board.getBoardNo() %>.&nbsp;&nbsp;<%= board.getTitle() %>&nbsp;</h4>
                  </div>
                  </div>                        
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="basic-default-memberid"><h6>작성자</h6></label>
                    <div class="col-sm-10">
                      <%= board.getWriter() %>
                    </div>
                  </div>
      <%--             <h6 class="pb-1 mb-4" style="text-align: right;"><small class="text-light fw-semibold">첨부파일 💾</small>
              <% for (HotplaceBoardAttach file : board.getFiles()) { %>
		                <a class="badge bg-dark"
		                   href="download.action?attachno=<%=file.getAttachNo() %>" 
		                   value="<%=file.getUserFileName() %>">downloads</a><br><% } %></h6> --%>	
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="basic-default-file"><h6>첨부파일</h6></label>
                    
                    <div class="col-sm-10">
                    <% if ( board.getFiles() != null &&  board.getFiles().size() > 0) { %>                                   
                       <% for (DogBreedIntroAttach file : board.getFiles()) { %>
                       		
		                <a class="badge bg-dark" href="download.action?attachno=<%=file.getAttachNo() %>" value="<%=file.getUserFileName() %>">downloads</a><br>                        			               
                        <img style="height: 600px; width: 60%"
		               		src="/azt-website/upload-files/<%= file.getSavedFileName() %>" > 		               
		               <br><br>     
                        <% } %>
                     <% } %>
                      </div>
                    </div>                                                
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="basic-default-content">
                    <h6>글 내용</h6></label>
                    <div class="col-sm-10">                                                       
                      <%= board.getContent().replace("\r\n", "<br>") %>
                    </div>
                  </div> 
                  <div class="row justify-content-end">
                  
             <div class="col-sm-7">                                  	
             <a href='dogbreedintroedit.action?boardno=<%= board.getBoardNo() %>'><button class="btn btn-warning" >수정</button></a>
              	<a href='dogbreedintrodelete.action?boardno=<%= board.getBoardNo() %>'><button class="btn btn-danger" >삭제</button></a>      
            	<a href="dogbreedintrolist.action?pageNo=<%= request.getAttribute("pageNo") %>">
            	<button type="submit" class="btn btn-secondary" >목록보기</button></a>                	
             </div>                       
           </div><br><br>
          </div> 
       </div>
     </div>                  
   </div>              
                
              

     <!-- Overlay -->
     <div class="layout-overlay layout-menu-toggle"></div>
     </div>
    
    <!-- Page JS -->
    <script type="text/javascript">
	var editBtn = document.querySelector("#edit-btn");
	editBtn.addEventListener("click", function(event) {
		event.preventDefault();
		var ok = confirm('수정하시겠습니까?');
		if (ok) {
			location.href = 'dogbreedintroedit.action?boardno=<%= board.getBoardNo() %>';
		}
	});	
	</script>
	
	
	<script type="text/javascript">
	var deleteBtn = document.querySelector('#delete-btn');
	deleteBtn.addEventListener('click',function(event) {
		event.preventDefault();
		var ok = confirm('삭제할까요?');
		if (ok) {
			location.href = 'dogbreedintrodelete.action?boardno=<%= board.getBoardNo() %>';
		}
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
 
