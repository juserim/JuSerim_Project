<%@page import="com.azt.dto.Member"%>
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
				<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">글쓰기</h4>
				<div class="row">
                <!-- Form controls -->
                 <% Member member = (Member)session.getAttribute("loginuser"); %>
                <div class="col-md-12">
                  <div class="card mb-4">
                    <h5 class="card-header">Form Controls</h5>
                    <div class="card-body">
                       <form id="writeform" action="/azt-website/walkingDogBoard/walkingDogWrite.action" 
				        	 method="post"
				        	 enctype="multipart/form-data">
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">제목</label>
                        <input
                          type="text"
                          class="form-control"
                          name="title"
                          placeholder="제목을 입력하세요"
                        />
                      </div>
                      
                       <div class="mb-3">
                        <label for="formFile" class="form-label">사진</label>
                        <input class="form-control" type="file" name="attach" id="formFile" />
                      </div>
                      
                       <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">작성자</label>
                        <input
                          type="text"
                          class="form-control"
                          name="writer"
                          placeholder="name@example.com"
                          value="<%= member.getMemberId() %>"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">강아지 이름</label>
                        <input
                          type="text"
                          class="form-control"
                          name="dogName"
                          placeholder="강아지 이름을 입력하세요"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">견종</label>
                        <input
                          type="text"
                          class="form-control"
                          name="breed"
                          placeholder="견종을 입력하세요"
                         
                        />
                        <br>
                        <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">몸무게</label>
                        <input
                          type="text"
                          class="form-control"
                          name="weight"
                          placeholder="견종을 입력하세요"
                        />
                      
                      </div>
                         <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">위치</label>
                        <input
                          type="text"
                          class="form-control"
                          name="location"
                          placeholder="위치를 입력하세요"
                        />
                      </div>
                      
                      <div>
                        <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
                        <textarea class="form-control" name="content" rows="3"></textarea>
                      </div>
                      <div style="text-align:center">
                      <br>
                      <a href="javascript:" id="write" class="btn btn-primary">글쓰기</a>
               		  <a href="/azt-website/walkingDogBoard/walkingDogList.action" class="btn btn-secondary" >취소</a>
                	 </div>
                      </form>
                         
                    </div>
                  
                  </div>
                </div>
					
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
		var writeLink = document.querySelector("#write");
		writeLink.addEventListener("click", function(event){
			event.preventDefault();
		var writeForm =document.querySelector("#writeform");
		writeForm.submit(); // submit : form을 서버로 전송 ( submit button click과 같은 효과)
		});
	</script>
	
  </body>
</html>


