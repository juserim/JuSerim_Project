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

    <title>DogBreedIntro Write</title>

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
	             <h5 class="mb-0">귀여운 댕댕이에 대해 알아봅시다!!</h5>                      
	           </div>
	           <div class="card-body">
	             <form id="writeform" action="dogbreedintrowrite.action" method="post" enctype="multipart/form-data">
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-name">제목</label>
	                 <div class="col-sm-10">
	                   <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" />
	                 </div>
	               </div>
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-company">작성자</label>
	                 <div class="col-sm-10">
	                   <input
	                     type="text"
	                     class="form-control"
	                     name="writer" />
	                 </div>
	               </div>
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-email">첨부파일</label>
	                 <div class="col-sm-10">
	                   <div class="input-group input-group-merge">
<!-- 	                     <form id="imgForm"> -->
	                     <input
	                       type="file"
	                       name="attach"
	                       class="form-control" />
<!-- 	                       <img id="View" src="#" alt="이미지 미리보기" /> -->
<!-- 						</form> -->
	                   </div>
	                 </div>
	               </div>
	               
	               <div class="row mb-3">
	                 <label class="col-sm-2 col-form-label" for="basic-default-message">글 내용</label>
	                 <div class="col-sm-10">
	                   <textarea
	                     id="basic-default-message"
	                     class="form-control"
	                     style="resize: none"
	                     name="content" cols="76" rows="15"
	                      placeholder="내용을 입력해 주세요"                             
	                    ></textarea>
	                  </div>
	                </div> 
	                <div class="row justify-content-end">
	        <div class="col-sm-7">                                  	
	        <a id="write" href="javascript:"><button class="btn btn-primary" >글쓰기</button></a>                
	        <a href="dogbreedintrolist.action"><button type="submit" class="btn btn-secondary" >목록보기</button></a>
	        </div></div>   
	        </form>
	        </div></div></div>
    		</div>
		 </div>                  
	  </div>              
              
 	<!-- Overlay -->
    
    <div class="layout-overlay layout-menu-toggle"></div>
     
    <!-- Page JS -->
    <script type="text/javascript">
	var writeLink = document.querySelector("#write");
	writeLink.addEventListener("click", function(event) {
		event.preventDefault();
		var ok = confirm('사진을 첨부했나요?');
		if (ok) {
		var writeForm = document.querySelector("#writeform");
		writeForm.submit();
		}// submit : form을 서버로 전송 (submit button click과 같은 효과)
	});	
	</script>
	
<!-- 	<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script> -->

<!-- 	<script type="text/javascript"> -->
<!--  	$(function() { -->
<!--  	    $("#myFile").on('change', function(){ -->
<!--  	    readURL(this); -->
<!--  	    }); -->
<!--  	}); -->
<!--  	function readURL(input) { -->
<!--  	    if (input.files && input.files[0]) { -->
<!--  	        var reader = new FileReader(); -->
<!--  	        reader.onload = function (e) { -->
<!--  	        $('#View').attr('src', e.target.result); -->
<!--  	        } -->
<!--  	        reader.readAsDataURL(input.files[0]); -->
<!--  	    } -->
<!--  	} -->
<!-- 	</script> -->
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
