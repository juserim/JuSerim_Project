<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.ShowMyDogBoardAttach"%>
<%@page import="java.util.List"%>
<%@page import="com.azt.dto.ShowMyDogBoard"%>
<%@page import="com.azt.service.ShowMyDogBoardService"%>
<%@page import="com.azt.servlet.BoardListServlet"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String appName = "azt-website"; %>

<!DOCTYPE html>

<!-- beautify ignore:start -->
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
			
    <title>Show My Dog List</title>

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
        
        	<div class="card-body" style="text-align: center;">                  
	        	<img src="/azt-website/mainimage/header-image.png" width="1385px">
	        </div>
          
          <jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" />
          
          <!-- Content wrapper -->
           <div class="content-wrapper">
          
           <div class="container-xxl flex-grow-1 container-p-y">
                       
           <div id="pageContainer">            
             
           <div class="row">
           
		<!-- Card layout -->
		<div class="col-xxl">
	      <div class="card mb-4 shadow-none bg-transparent">
	        <div class="card-header d-flex align-items-center justify-content-center ">
	      		<h3 class="pb-1 my-5">❤️내 새끼 뽐내기❤️</h3>                    
	        </div>
	       
	        <div class="card-body"> 
	          
	          <!-- 정렬버튼 -->
              <div style="text-align:left;"> 
               <div class="btn-group justify-content-center">
               <button
                 type="button"
                 class="btn btn-secondary dropdown-toggle"
                 data-bs-toggle="dropdown"
                 aria-expanded="false"
               >
                 정렬
               </button>
               
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="javascript:void(0);">최근등록순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">조회순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">댓글순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">좋아요순</a></li>                        
               </ul>
             </div>
         
             <!-- /정렬버튼 -->
             
             <!-- 글쓰기 버튼 -->
     		<div style="float:right; display:inline-block;"> 
			<a href="showmydogwrite.action"><button type="write" class="btn btn-primary">지금 자랑하기</button></a>							
		  	</div></div><br><br>
		  	<!-- /글쓰기 버튼 -->	

		<!-- Grid Card -->		
		<div class="row row-cols-1 row-cols-md-4 g-4 mb-5">
		
			<c:forEach var="board" items="${ boardList }">	
		       <div class="col">
				 <div class="card h-100">
				 <c:choose>
		 	 		<c:when test="${ board.deleted }">
		             <img class="card-img-top" 
						 style="height: 300px; width: 100%;" 						 
						 src="/<%= appName %>/static/assets/img/showmydog/사진없음.jpg" alt="Card image cap" 							 				  
						 alt="Card image cap"/>	
						 <div class="card-body">
						 <span style="color:lightgray">[삭제된 글]</span>
					</c:when>
					<c:otherwise>														
					<img class="card-img-top" 
						 style="height: 300px; width: 100%;" 						 
						 src="showmydogdownload.action?attachno=${ board.boardNo } "							 				  
						 alt="Card image cap"/>					
<%-- 	             <img src="/<%= appName %>/static/assets/img/showmydog/시츄1.png" alt="Card image cap" /> --%>
		           	<div class="card-body">		            
		             	<a href='/azt-website/showmydog/showmydogdetail.action?boardno=${ board.boardNo }&pageNo=${ pageNo }'>
	                   		<span class="badge badge-center rounded-pill bg-primary">${ board.boardNo }</span>				   
				     		${ board.title }
			     		</a>
		     		</c:otherwise>
					</c:choose>					     		   
		              	<p class="card-text" style="text-align: right;">${ board.writer }</p>       		                   
	            	</div>         
	          	  </div> 
	        	</div>
				</c:forEach>		            
	        </div> 
	        <!-- /Grid Card -->
			      
			<!-- Basic Pagination -->
            	 ${ pager }
       		<!--/ Basic Pagination -->										
  
		   <!-- Bootstrap Toasts with Placement -->
		   
		   <div class="card mb-4 shadow-none bg-transparent ">             
             <div class="card-body">
                 <div class="col-auto" style="text-align: center;">
                 <form action="search" method="get">
		            <label class="form-label" for="selectTypeOpt">		            
		             <select id="title" class="form-select color-dropdown" name="serchType">
		               <option value="title">제목</option>
		               <option value="content">내용</option>
		               <option value="writer">작성자</option>
		               <option value="titcont">제목+내용</option>		                                    
		             </select>           
		            </label>
	            
	            <label class="form-label" for="selectTypeOpt">	            
	            <input
	            type="text"
	            class="form-control color-dropdown"
	            name="searchName"
	            placeholder="검색어를 입력하세요"
	            aria-label="Search..."/>  
	         	</label>
	         	
	            <button id="search" class="btn btn-primary" >
	            <i class="bx bx-search fs-4 lh-0"></i>검색</button>
	            
	            <input type="hidden" name="pageNo" value="1">
	            <input type="hidden" name="pageSize" value="8">
	            </form>
	           	</div>	           
              </div>
      		</div>
   		 </div> 
	  </div>
		           
		     <!--/ Bootstrap Toasts with Placement -->	
		     
			    </div>
			    
		    <!-- /Card layout -->
						
				</div></div></div></div> 
				
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
	
 
  </body>
</html>
          
     	

      