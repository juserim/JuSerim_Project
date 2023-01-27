<%@page import="com.azt.dto.Member"%>
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

    <title>Show My Dog Write</title>

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
         
	<!-- Content -->

     <h3 class="fw-bold py-3 mb-4">글쓰기</h3>
     
     <div class="row">
       
       <!-- Basic Layout -->
       
	       	<div class="col-xxl">
	         <div class="card mb-4">
	           <div class="card-header d-flex align-items-center justify-content-between">
	             <h3 class="mb-0">❤️내새끼 뽐내기❤️</h3>                      
	           </div>
	           <div class="card-body">
	             <form id="writeform" action="showmydogwrite.action" method="post" enctype="multipart/form-data">
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-name">제목</label>
	                 <div class="col-sm-10">
	                   <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" />
	                 </div>
	               </div>
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-company">작성자</label>	                  
	                 <div class="col-sm-10">
	                 <% Member member = (Member)session.getAttribute("loginuser"); %>	
	                 <%= member.getMemberId() %>						
					 <input type="hidden"
					 		name="writer"
					 		value="<%= member.getMemberId() %>"/>	                   
	                 </div>
	               </div>
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-file">첨부파일</label>
	                 <div class="col-sm-10">
	                   <div class="input-group input-group-merge">
<!-- 	                     <form id="imgForm"> -->
	                     <input
	                       id="file-attach"
	                       type="file"
	                       name="attach"
	                       class="form-control" />
<!-- 	                       <img id="View" src="#" alt="이미지 미리보기" /> -->
<!-- 						</form> -->
	                   </div>
	                 </div>
	               </div>
	               
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-message">❤️내새끼 자랑하기❤️</label>
	                 <div class="col-sm-10">
	                   <textarea
	                     id="basic-default-message"
	                     class="form-control"
	                     style="resize: none"
	                     name="content" cols="76" rows="15"
	                      placeholder="내 새끼를 자랑합니다"                             
	                    ></textarea>
	                  </div>
	                </div> 
                <div class="row justify-content-end">
			        <div class="col-sm-7">                                  	
			        	<a id="write" href="javascript:"><button class="btn btn-primary" >글쓰기</button></a>                
			        	<a href="showmydoglist.action"><button type="submit" class="btn btn-secondary" >목록보기</button></a>
			        </div>
		        </div>   
	        </form>
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
    
	var writeLink = document.querySelector("#write");
	writeLink.addEventListener("click", function(event) {
		event.preventDefault();
		var file = $('#file-attach').val();
		if (file == 0) {
			alert('사진을 첨부하세요');
			return;
		} else {
		var writeForm = document.querySelector("#writeform");
		writeForm.submit();
		}// submit : form을 서버로 전송 (submit button click과 같은 효과)
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
