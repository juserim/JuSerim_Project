<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.WalkingDogBoard"%>
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

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />

    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />

 <style type="text/css">
 	.show-card {
			  width: 400px;
			  height: 400px;
			  object-fit: cover;			
			 }
 	</style>
    
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
            
            
            
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
        
            
            <% WalkingDogBoard dogBoard =(WalkingDogBoard)request.getAttribute("dogBoard");  %>
              <div style="text-align:center">
                  	<% if(dogBoard.getFiles() == null || dogBoard.getFiles().size() == 0){ %>
                    <img class="card-img-top show-card" src="/azt-website/mainimage/noneimage.png"  />
                    <% } else { %>
                      <img class="card-img-top show-card" src="/azt-website/upload-files/<%= dogBoard.getFiles().get(0).getSavedFilename() %>" />
                      <%} %>
                  </div>
            
              <h4 class="fw-bold py-3 mb-4"><%=dogBoard.getTitle() %></h4>
                        
 
              <div class="row">
              	                     
				<div class="col-lg">
                  <div class="card">
                    <h5 class="card-header">우리 강아지는요?</h5>
                    <div class="card-body">
                    
                    
                      <small class="text-light fw-semibold">강아지 소개</small>
                      	
                         <ul class="list-inline mt-2">
                        <li class="list-inline-item"><div class="alert alert-primary" role="alert">이름 : <%=dogBoard.getDogName() %> </div></li>
                        <li class="list-inline-item"><div class="alert alert-secondary" role="alert">견종 : <%=dogBoard.getBreed() %></div></li>
                        <li class="list-inline-item"><div class="alert alert-success" role="alert">몸무게 : <%=dogBoard.getWeight() %> </div></li>
                               <div class="col-sm-6 col-lg-4 mb-4" >
                               
             
                  
                </div>
                      </ul>
               
                      <!-- 
                     <br>
                       <div class="alert alert-primary" role="alert">이름 : </div>
                       <div class="alert alert-secondary" role="alert">견종 : </div>

                      <div class="alert alert-success" role="alert">몸무게 : </div>
 									-->
                      <!--  <div class="alert alert-danger" role="alert">This is a danger alert — check it out!</div>-->
                    </div>
                    <hr class="m-0" />
                    <h5 class="card-header">어디서 만날까요?</h5>
                    <div class="card-body">
                      
                      <ul class="list-inline mt-2">
                        <li class="list-inline-item"><%= dogBoard.getLocation() %></li>
                       <!--   <li class="list-inline-item">Phasellus iaculis</li>
                        <li class="list-inline-item">Nulla volutpat</li>-->
                      </ul>
                    </div>
                    <hr class="m-0" />
                    <h5 class="card-header">우리 강아지를 소개해주세요!</h5>
                    <div class="card-body">
                      
                     	<%=dogBoard.getContent() %>
                    </div>
                  </div>
                </div>
              
              </div>            
                         
                          <div style="text-align:center">
                          <% Member member = (Member)session.getAttribute("loginuser"); %>
                      <br>
                    	<% if (member!=null && member.getMemberId().equals(dogBoard.getWriter())) { %>
                      <a href='walkingDogEdit.action?boardno=<%=dogBoard.getBoardNo() %>' id="write" class="btn btn-outline-primary">수정하기</a>
                      <a id='delete-btn' href='javascript:' class="btn btn-outline-primary">삭제하기</a>
               		  
               		  <% }  %>
               		  	<a href="/azt-website/walkingDogBoard/walkingDogList.action" class="btn btn-secondary" >목록</a>
                	 </div>
                         
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

	<script type="text/javascript">
		var deleteBtn = document.querySelector('#delete-btn');
		deleteBtn.addEventListener('click',function(event){
			event.preventDefault();
			var ok = confirm('삭제할까요?');
			if(ok){
				location.href = 'walkingDogDelete.action?boardno=<%=dogBoard.getBoardNo()%>';
			}
		});
	</script>

  </body>
</html>


