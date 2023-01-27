<%@page import="com.azt.dto.Member"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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

    <title>Write Page</title>

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
            
                
             <div class="row">
                <!-- Basic Layout -->
                 <h1 class="display-2 mb-0" style="font-family: 'Lobster', cursive;">Write Page</h1>
           		 <small class="text-light fw-semibold">🛸 게시글작성중...</small>	
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">게시글 작성하기</h5>
                    </div>   
                    
                    <div class="card-body">
                      <form
	                     id="writeform"
			        	 action="hotplaceWrite.action" 
			        	 method="post"
			        	 enctype="multipart/form-data">
                         <div class="mb-3">
                        <label for="exampleFormControlSelect1" class="form-label">지역</label>
                        <select name="loc" class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected>지역을 선택해주세요.</option>
                          <option value="서울특별시">서울특별시</option>
                          <option value="청주시">청주시</option>
                          <option value="대전광역시">대전광역시</option>
                          <option value="부산광역시">부산광역시</option>
                          <option value="대구광역시">대구광역시</option>
                          <option value="인천광역시">인천광역시</option>
                          <option value="광주광역시">광주광역시</option>
                          <option value="울산광역시">울산광역시</option>
                          <option value="세종특별자치시">세종특별자치시</option>
                          <option value="제주특별자치시도">제주특별자치시도</option>
                        </select>
                           <div class="mb-3">
                        <label for="exampleFormControlSelect1" class="form-label">매장분류</label>
                        <select name="place" class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected>카페/식당/글램핑&캠핑</option>
                          <option value="카페">카페</option>
                          <option value="식당">식당</option>
                          <option value="글램핑&캠핑">글램핑&캠핑</option>
                        </select>
                      </div>
                      </div>
                      <!-- file 첨부 -->                  
                    <div class="card-body">
                      <div class="mb-3">                        
                        <input 
                        name="attach"
                        class="form-control" 
                        type="file" id="formFile" />
                      </div>                     
                    </div>
                    <!-- / file 첨부 -->  
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">제 목</label>
                          <div class="col-sm-10">
                            <input type="text" name="title"
                            class="form-control" id="basic-default-name" placeholder="제목을 입력하세요" value=""/>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-company">작성자</label>
                          <div class="col-sm-10">
                          <% Member member = (Member)session.getAttribute("loginuser"); %>
                            <input
                              type="hidden"
                              name="writer"
                              class="form-control"
                              id="basic-default-company"
                              value="<%= member.getMemberId() %>"
                            /><%= member.getMemberId() %>
                          </div>
                        </div> 
                                         
                    
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">내용</label>
                          <div class="col-sm-10">
                            <textarea
                              name="content"
                              id="basic-default-message"
                              class="form-control"
                              placeholder="내용을 입력하세요"
                              aria-describedby="basic-icon-default-message2"
                            ></textarea>
                          </div>
                        </div>
                        
                        <div class="row justify-content-end">
                          <div class="col-sm-10">                           
                             <div class="demo-inline-spacing">
                             <a id="write" href="javascript:" 
					         class="btn btn-outline-primary">Send</a> 
					         <a href="/azt-website/hotplaceBoard/hotplaceList.action" 
					         class="btn btn-outline-primary" id="list-btn">List</a>                            
                          </div>
                        </div></div>                        
                      </form>
                    </div></div></div></div></div>
            <!-- / Content -->


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
	
	var write = document.querySelector("#write");
	write.addEventListener("click", function (event) {
	event.preventDefault(); // 하이퍼링크 동작 못하게 제어
	
		var title = document.querySelector('#basic-default-name');
		if (!title.value) {		
			alert('제목은 필수 입력사항입니다.');
			return false;	
		} else {
			var writeForm = document.querySelector("#writeform");
			writeForm.submit(); // submit : form을 서버로 전송 (submit button click 과 같은 효과)			
		}	
		
	});
		
	var listBtn = document.querySelector("#list-btn");
	listBtn.addEventListener("click", function(event) {
		event.preventDefault();
		var ok = confirm("작성 중인 게시글이 있습니다. 목록으로 돌아갈까요?");
		if (ok) {
			location.href = "#";	
		} 
	});	
	
	

	</script>

  </body>
</html>


