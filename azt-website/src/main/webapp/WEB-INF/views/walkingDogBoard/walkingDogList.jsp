<%@page import="com.azt.dto.WalkingDogBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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

    <title>walkingDog Board</title>

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
          
            
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Striped Rows -->
              <div class="card">
                <h5 class="card-header">같이 산책 할 댕댕이!!</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>번 호</th>
                        <th>제 목</th>
                        <th>작성자</th>
                        <th>강아지이름</th>
                        <th>견종</th>
              			<th>위치</th>
                        <th>작성일</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <% List<WalkingDogBoard> boardList = (List<WalkingDogBoard>)request.getAttribute("boardList");  %>
                      <% for(WalkingDogBoard board : boardList ) { %>
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%=board.getBoardNo() %></strong></td>
      
                        <td>
                        <% if (board.isDeleted()){ //삭제 한 경우 %>
                        <span class="badge bg-secondary">삭제된 글</span>
                        <% }else{ %>
                        <a href='walkingDogdetail.action?boardno=<%=board.getBoardNo()%>&pageNo=<%= request.getAttribute("pageNo")%>'>
                        <%= board.getTitle() %>
                        <%} %>
                        	
						</a>
                        </td>
                        
                        
                        <td>
                        	<%= board.getWriter() %>
                        </td>
                        <td><span class="badge bg-label-primary me-1"><%=board.getDogName() %></span></td>
                   
                            <td><span class="badge bg-label-primary me-1"><%=board.getBreed() %></span></td>
                        
                        <td>
                          <%=board.getLocation() %>
                        </td>
                        <td>
                          <%=board.getWriteDate() %>
                        </td>
                          <td>
                          <%=board.getReadCount() %>
                        </td>
                      </tr>
                      <% } %>
                             
                    </tbody>
                   
                  </table>
                   
                </div>
                
                
              </div>
              <div style="text-align:center">
              <br>
              <a href="/azt-website/walkingDogBoard/walkingDogWrite.action" class="btn btn-success">글쓰기</a>
              </div>
              <!--/ Striped Rows -->
                         
                          <%= request.getAttribute("pager") %> 
            </div>
            <!-- / Content -->

            <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

            <div class="content-backdrop fade"></div>
          </div>
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


