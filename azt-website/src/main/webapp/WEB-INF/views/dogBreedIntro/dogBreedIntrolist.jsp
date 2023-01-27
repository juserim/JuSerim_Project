<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.DogBreedIntroAttach"%>
<%@page import="java.util.List"%>
<%@page import="com.azt.dto.DogBreedIntro"%>
<%@page import="com.azt.service.DogBreedIntroService"%>
<%@page import="com.azt.servlet.BoardListServlet"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String appName = "azt-website";
	String contextPath = request.getServletContext().getContextPath();
	
%>

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
			
    <title>DogBreedIntro List</title>

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
	      		<h3 class="pb-1 my-5">귀여운 댕댕이에 대해 알아봅시다!!</h3>                    
	        </div>
	       
	        <div class="card-body"> 
	          
	          <!-- 정렬버튼 -->
              <div style="text-align:left;"> 
               <div class="btn-group justify-content-center">
               
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="javascript:void(0);">최근등록순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">조회순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">댓글순</a></li>
                 <li><a class="dropdown-item" href="javascript:void(0);">좋아요순</a></li>                        
               </ul>
             </div>
          
             
             <!-- 글쓰기 버튼 -->
     		<div style="float:right; display:inline-block;"> 
			<a href="dogbreedintrowrite.action"><button type="write" class="btn btn-primary">글쓰기</button></a>							
		  	</div></div><br><br>
		  	<!-- /글쓰기 버튼 -->	

		<!-- Grid Card -->
		<div class="row row-cols-1 row-cols-md-4 g-4 mb-5">
		
		<% List<DogBreedIntro> boardList = (List<DogBreedIntro>)request.getAttribute("boardList"); %>
		      <% for(DogBreedIntro board : boardList) { %>	
		       <div class="col">
				<div class="card h-100">
				<% if (board.getAttachFile() != null) { %>
				
				<img class="card-img-top" 
					 style="height: 300px; width: 100%;" 
					 src="/azt-website/upload-files/<%= board.getAttachFile() %>"
					 <%--src="dogbreedintrodownload.action?attachno=<%=board.getBoardNo() %>"--%>					  
					 alt="Card image cap" >
				 <% } else { %>
				 
				 <img src="/<%= appName %>/static/assets/img/dogbreedintro/small01.PNG" alt="Card image cap" >
             	
				<% } %>
		           <div class="card-body">
		             <% if (board.isDeleted()) { %>
							<span style="color:lightgray"><%= board.getTitle() %>[삭제된 글]</span>
						<% } else { %>
		             <a href='/azt-website/dogbreedintro/dogbreedintrodetail.action?boardno=<%=board.getBoardNo() %>&pageNo=<%= request.getAttribute("pageNo") %>'>
	                   <span class="badge badge-center rounded-pill bg-primary"><%= board.getBoardNo() %></span>				   
					     <%= board.getTitle() %></a>      <% } %>      
			              <p class="card-text" style="text-align: right;">
			              	<span class="like_count"><%=board.getLikely() %></span>
			              	<input type="button" class="like" value="❤️" onclick="likely(this, <%= board.getBoardNo() %>)" />
			              	<%=board.getWriter() %>
			              </p>
			            </div>         
			          	</div>
				        </div>  <% } %>
				        </div> 
	        <!-- /Grid Card -->
<script>
function likely(obj, boardNo){
	$.ajax({
		url:"<%=contextPath%>/dogbreedintro/dogbreedlikely.action",
		type:"post",
		dataType:"json",
		data:{boardNo : boardNo, memberId : "${sessionScope.loginuser.memberId}"},
		success:function(data) {
			$(obj).prev(".like_count").text(data.count);
		},
		error:function(xhr, status, res) {
			console.log("error : ", xhr, status, res);
		}
	});
}
</script>
			<!-- Basic Pagination -->
               <%= request.getAttribute("pager") %>
       		<!--/ Basic Pagination -->										
  
		   <!-- Bootstrap Toasts with Placement -->
		   
		   
	            
	          
	           	</div>	           
              </div>
      		</div>
	   		</div> 
	   		  
	   		
	<%-- <script type="text/javascript">
	var mypage = document.querySelector("#mypage");
	mypage.addEventListener("click", function(event) {
		event.preventDefault();
		var ok = confirm('마이페이지를 보시겠습니까??');
		if (ok) {
			<% Member member = (Member)session.getAttribute("loginuser"); %>
			location.href = '/azt-website/account/mypage.action?memberid=<%=member.getMemberId() %>';
		}
	});	
	</script> 	 --%>
		      
		           
		     <!--/ Bootstrap Toasts with Placement -->	
		     
			    </div></div>
			    
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
	</div>
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	</div>
	
 
  </body>
</html>
          
     	

      