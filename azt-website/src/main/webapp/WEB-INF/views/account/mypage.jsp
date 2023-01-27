<%@page import="com.azt.dto.DogMember"%>
<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.ShowMyDogBoardAttach"%>
<%@page import="com.azt.dao.ShowMyDogBoardDao"%>
<%@page import="com.azt.dto.ShowMyDogBoard"%>
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

    <title>My Page</title>

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
    <jsp:include page="/WEB-INF/views/modules/layout-menu-mypage.jsp" />
        
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
            <div class="card mb-4 shadow-none bg-transparent">
                      
          <div class="row row-cols-1 row-cols-md-2"> 
          <div class="card-body justify-content-center col-sm-2" style="text-align: center;">            
          	<div class="card-header d-inline-flex align-items-center justify-content-center">
                <h2 class="pb-1 my-2"><u>회원정보</u></h2>                      
              </div> 
          	<div style="width: 100%; float:none; margin:0 auto" >                  
        	   <div class="card h-100 shadow-none border border-primary mb-3" style="width: 100%">
          	   <br><br>
       	 	 
       	 <!-- 회원정보 -->	          	   
			 <div class="row d-flex justify-content-center align-items-center h-100">
			  <h3>회원 정보</h3>         
               <div class="row row-cols-1 row-cols-md-2">
               	 <label class="col-sm-2 col-form-label" for="memberid">
                 	<h6 style="text-align: center;">회원아이디</h6></label>
       			 <div class="col-sm-10">      	         	
           			<h5 style="text-align: center;">${ member.memberId }</h5>
       			 </div>
               </div>                        
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="email">
                 	<h6 style="text-align: center;">이메일</h6></label>
                 <div class="col-sm-10">
                 	<h5 style="text-align: center;">${ member.email }</h5>
                 </div>
               </div>   
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="regdate">
                 	<h6 style="text-align: center;">유저타입</h6></label>
                 <div class="col-sm-10">                                                       
                   	<h5 style="text-align: center;">${ member.userType }</h5>                      
                 </div>
               </div>                                                  
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="regdate">
                 	<h6 style="text-align: center;">가입날짜</h6></label>
                 <div class="col-sm-10">                                                       
                   	<h5 style="text-align: center;">${ member.regDate }</h5>                      
                 </div>
               </div>
             </div>
         <!-- /회원정보 -->	          	   
               
              
         <!-- 강아지 정보 -->     
       	 	<hr><br>   
   	 	    <div class="row d-flex justify-content-center align-items-center h-100">   	 	
      	 	   <h3>강아지 정보</h3>     	 	  
           	 <c:choose> 
           	 <c:when test="${ dogMember != null}">           	
               <div class="row row-cols-1 row-cols-md-2">
               	 <label class="col-sm-2 col-form-label" for="dogname">
                 	<h6 style="text-align: center;">강아지 이름</h6></label>
       			 <div class="col-sm-10">      	         	
           			<h5 style="text-align: center;">${ dogMember.dogname }</h5>
       			 </div>
               </div>                        
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="breed">
                 	<h6 style="text-align: center;">강아지 종</h6></label>
                 <div class="col-sm-10">
                 	<h5 style="text-align: center;">${ dogMember.breed }</h5>
                 </div>
               </div>                                                     
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="surgery">
                 	<h6 style="text-align: center;">수술여부</h6></label>
                 <div class="col-sm-10"> 
                 <c:choose>
                 <c:when test="${ dogMember.surgery != null}">                                                                      
                   	<h5 style="text-align: center;">수술O</h5>    
                   	</c:when>
                   	<c:otherwise>
                   	<h5 style="text-align: center;">수술X</h5>
                   	</c:otherwise>  
                   	</c:choose>
                 </div>
               </div>
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="loc">
                 	<h6 style="text-align: center;">지역</h6></label>
                 <div class="col-sm-10">                                                       
                   	<h5 style="text-align: center;">${ dogMember.loc }</h5>                      
                 </div>
               </div>
               <div class="row row-cols-1 row-cols-md-2">
                 <label class="col-sm-2 col-form-label" for="weight">
                 	<h6 style="text-align: center;">몸무게</h6></label>
                 <div class="col-sm-10">                                                       
                   	<h5 style="text-align: center;">${ dogMember.weight }&nbsp;kg</h5>                      
                 </div>
               </div>
               </c:when>
				<c:otherwise>
               <h5 style="text-align: center;">강아지 정보가 없습니다.</h5>
               </c:otherwise>
               </c:choose>
              </div>
           <!-- /강아지 정보 -->
           
           <!-- 버튼 -->              
			 <br>
             <div class="row justify-content-center">                  
             <div class="col-sm-7"> 
                <a id="edit-btn" href="#"><button class="btn btn-warning" >수정</button></a>                                 	             
              	<a id="delete-btn" href="javascript:history.back()"><button class="btn btn-primary" >확인</button></a>                  	            	
             </div><br><br><br>                       
           </div>
           <!-- /버튼 -->
            
           </div> 
          </div>
       </div>
       
       
    <!-- 내 글 목록 -->
    <div class="card-body justify-content-center col-sm-10" style="text-align: center;">          
   		<div class="card-header d-inline-flex align-items-center justify-content-center">
         	<h2 class="pb-1 my-2"><u>내 글 목록</u></h2>                      
        </div>
	       <div class="nav-align-top mb-4">
	         <ul class="nav nav-pills mb-2 nav-fill" role="tablist">
	           <li class="nav-item">
	             <button
	               type="button"
	               class="nav-link active"
	               role="tab"
	               data-bs-toggle="tab"
	               data-bs-target="#navs-pills-justified-home"
	               aria-controls="navs-pills-justified-home"
	               aria-selected="true"
	             >
	               <i class="tf-icons bx bx-home"></i> 내 작성글수 
	               <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">${ count + count2 + count3 + conut4 }</span>
	             </button>
	           </li>
	           <li class="nav-item">
	             <button
	               type="button"
	               class="nav-link"
	               role="tab"
	               data-bs-toggle="tab"
	               data-bs-target="#navs-pills-justified-profile"
	               aria-controls="navs-pills-justified-profile"
	               aria-selected="false"
	             >
	               <i class="tf-icons bx bx-user"></i> 내 댓글수
	             </button>
	           </li>                      
	         </ul>
	         <div class="tab-content">
	           <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
	               
	             
	             <p>
	             <h4 style="text-align:center;"> 애견동반 스팟추천 (${ count2 })</h4>
	             <c:forEach var="board" items="${ boardList2 }">		             
	              <c:choose>
		 	 		<c:when test="${ board.deleted }">
		              <h6 style="color:lightgray">[삭제된 글]${board.boardNo}.&nbsp;${board.title}(${ board.writeDate }) </h6>
					</c:when>
					<c:otherwise>  
		              <a href='/azt-website/hotplaceBoard/hotplaceDetail.action?boardno=${ board.boardNo }'>        	
			  			<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				  ${board.boardNo}.&nbsp;${board.title} 
		  				</span>
			  			<span style="color:lightgray">(${ board.writeDate })
			  			</span>
			  		  </a>
	             </p>
	             	</c:otherwise>
             	  </c:choose>
	             </c:forEach>
	 			 <hr>    
	             	             
	             <p>
	             <h4 style="text-align:center;"> 같이 산책할 댕댕이 (${ count3 })</h4>
	             <c:forEach var="board" items="${ boardList3 }">		             
	              <c:choose>
		 	 		<c:when test="${ board.deleted }">
		              <h6 style="color:lightgray">[삭제된 글]${board.boardNo}.&nbsp;${board.title}(${ board.writeDate }) </h6>
					</c:when>
					<c:otherwise>  
		              <a href='/azt-website/walkingDogBoard/walkingDogdetail.action?boardno=${ board.boardNo }&pageNo=${ Math.round(Math.floor(((board.boardNo)/8)+1)) }'>        	
			  			<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				  ${board.boardNo}.&nbsp;${board.title} 
		  				</span>
			  			<span style="color:lightgray">(${ board.writeDate })
			  			</span>
			  		  </a>
	             </p>
	             	</c:otherwise>
             	  </c:choose>
	             </c:forEach>
	 			 <hr>
	 			 
	             <p>
	             <h4 style="text-align:center;"> 내새끼 뽐내기 (${ count })</h4>
	             <c:forEach var="board" items="${ boardList }">		             
	              <c:choose>
		 	 		<c:when test="${ board.deleted }">
		              <h6 style="color:lightgray">[삭제된 글]${board.boardNo}.&nbsp;${board.title}(${ board.writeDate }) </h6>
					</c:when>
					<c:otherwise>	 
	                                
		              <a href='/azt-website/showmydog/showmydogdetail.action?boardno=${ board.boardNo }&pageNo=${ Math.round(Math.floor(((board.boardNo)/8)+1)) }'>        	
			  			<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				  ${board.boardNo}.&nbsp;${board.title} 
		  				</span>
			  			<span style="color:lightgray">(${ board.writeDate })
			  			</span>
			  		  </a>
	             </p>
	             	</c:otherwise>
             	  </c:choose>
	             </c:forEach>
	 			 <hr>
	             
	 			 <p>
	             <h4 style="text-align:center;"> 강아지 품종 소개 (${ count4 })</h4>
	             <c:forEach var="board" items="${ boardList4 }">		             
	              <c:choose>
		 	 		<c:when test="${ board.deleted }">
		              <h6 style="color:lightgray">[삭제된 글]${board.boardNo}.&nbsp;${board.title}(${ board.writeDate }) </h6>
					</c:when>
					<c:otherwise>  
		              <a href='/azt-website/dogbreedintro/dogbreedintrodetail.action?boardno=${ board.boardNo }&pageNo=${ Math.round(Math.floor(((board.boardNo)/8)+1)) }'>        	
			  			<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				  ${board.boardNo}.&nbsp;${board.title} 
		  				</span>
			  			<span style="color:lightgray">(${ board.writeDate })
			  			</span>
			  		  </a>
	             </p>
	             	</c:otherwise>
             	  </c:choose>
	             </c:forEach>
	 			 <hr>
	                                       
<!-- 	           </div> -->
<!-- 	           <div class="tab-pane fade" id="navs-pills-justified-profile" role="tabpanel"> -->
<!-- 	             <p>	              -->
<!--             	   <h4 style="text-align:center;"> 내새끼 뽐내기 ()</h4> -->
<%-- 		             <c:forEach var="comment" items="${ comments }">		              --%>
<%-- 		              <c:choose> --%>
<%-- 			 	 		<c:when test="${ comment.deleted }"> --%>
<%-- 			              <h6 style="color:lightgray">[삭제된 댓글]${comment.boardNo}.&nbsp;${comment.content}(${ comment.writeDate }) </h6> --%>
<%-- 						</c:when> --%>
<%-- 				  			<c:otherwise>	  --%>
		                                
<%-- 					              <a href='/azt-website/showmydog/showmydogdetail.action?boardno=${ comment.boardNo }&pageNo=${ Math.round(Math.floor(((comment.boardNo)/8)+1)) }'>        	 --%>
<!-- 						  			<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 						  				  ${comment.boardNo}.&nbsp;${comment.content}  --%>
<!-- 					  				</span> -->
<%-- 						  			<span style="color:lightgray">(${ comment.writeDate }) --%>
<!-- 						  			</span> -->
<!-- 						  		  </a> -->
<!-- 				               </p> -->
<%-- 		             		</c:otherwise> --%>
<%-- 	             	  </c:choose> --%>
<%-- 		             </c:forEach> --%>
<!-- 		 			 <hr> -->



	                                  
	           </div>
	         </div>
	       </div>
          </div>       	   
         </div>                  
	    </div> 
 	   <!-- /내 글 목록 --> 
 	    
     </div>             
                
              

     <!-- Overlay -->
     <div class="layout-overlay layout-menu-toggle"></div>
     </div>
    
    <!-- Page JS -->
    <script type="text/javascript">
 	var editBtn = document.querySelector("#edit-btn"); 
 	editBtn.addEventListener("click", function(event) {
 		event.preventDefault(); -->
		var ok = confirm('수정하시겠습니까?'); 
 		if (ok) {
			location.href = 'showmydogedit.action?memberid=${member.memberId}'; --%>
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
 
