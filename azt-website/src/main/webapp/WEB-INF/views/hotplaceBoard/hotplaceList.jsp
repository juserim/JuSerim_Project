<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.HotplaceBoard"%>
<%@page import="java.util.List"%>
<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<% String appName = "azt-website"; %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
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

    <title>Hot Place List</title>

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
          <div class="content-wrapper" >
            
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y" >
                     
			<!-- Striped Rows -->
			<br><br>
			&nbsp;&nbsp;&nbsp; <h1 class="display-3 mb-0" style="font-family: 'Lobster', cursive;" >Hot Place Borad List 📜</h1>
			<br>
			<div class="row justify-content-center">
              <div class="card"  align="center" >
                
                <table class="table table-striped" >
                    <thead>
                    
                   <tr>
                   	<td colspan="7">
                   	 <div class="demo-inline-spacing" style="text-align: right;">
                   	<% Member member = (Member)session.getAttribute("loginuser"); %>
                   	<% if ( member == null) { %>
                   	<a href="/azt-website/account/login.action" 
			         class="btn btn-outline-primary">글쓰기</a>
			         <% } else { %>
			         <a href="/azt-website/hotplaceBoard/hotplaceWrite.action" 
			         class="btn btn-outline-primary">글쓰기</a>
					 <% } %>
                   	</td>
                   </tr>
                   
                       <tr>
                        <th>번 호</th>
                        <th>제 목</th>
                        <th>위치</th>
                        <th>장소</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>                       
                      </tr>
                    </thead>                    
                    
                    <tbody class="table-border-bottom-0">     
                   
                    <% List<HotplaceBoard> boardList = (List<HotplaceBoard>)request.getAttribute("boardList"); %>
					<% for(HotplaceBoard board : boardList) { %>	               
                      <tr>
                    	<td><%=board.getBoardNo()%></td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
                        <strong></strong>
                        <% if (board.isDeleted()) { %>
							<span class="badge bg-label-danger">이 게시글은 삭제되었습니다😭</span>
						<% } else { %>
						<span class="badge bg-label-dark">
                         <a href="hotplaceDetail.action?boardno=<%= board.getBoardNo() %>"><%=board.getTitle()%></a>
                         </span></td>

                        <% } %>
                        <td><%= board.getLoc()%></td>
                        <td><%= board.getPlace()%></td>
                        <td><span class="badge rounded-pill bg-info"><%= board.getWriter()%></span></td>
                        <td><%= board.getWriteDate()%></td>
                        <td><%= board.getReadCount()%></td>                        
                      </tr>
                      <% } %>
                     
                    </tbody>
                  </table>  
              </div></div>    
                     
              <!--/ Striped Rows -->	             
               <%=request.getAttribute("pager")%>    
                
                    
            </div>
            <!-- / Content -->

            

            <div class="content-backdrop fade"></div>
          </div>
          
          <jsp:include page="/WEB-INF/views/modules/footer.jsp" />
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	
 
  </body>
</html>


