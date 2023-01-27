<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
 

<% String appName = "azt-website"; %>
 <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumHaNaSonGeurSsi.css" rel="stylesheet">
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

    <title>A:zt Home</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />
    
    <!-- Popup 광고 템플릿 복사해서 사용하실때 지워주세요!!!-->
    <jsp:include page="/WEB-INF/views/popup/popup.jsp"/>
	<!-- /Popup 광고 -->
	
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />
    
    <style type="text/css">
    .card-img {
			  width: 450px;
			  height: 450px;
			  object-fit: cover;
			 }
	.card-title { 
				  color: white;
				  font-size: 26pt;
				  text-shadow: 5px 5px 6px black;				
				}
	.card-text {
				color: white;
				font-size: 14pt;
				text-shadow: 5px 5px 6px black;	
			    }	 			
		
    </style>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar" style="font-family: 'NanumHaNaSonGeurSsi';">
      <div class="layout-container">
        
        <jsp:include page="/WEB-INF/views/modules/layout-menu.jsp" />
        
        <!-- Layout container -->
        <div class="layout-page">
        
        			
      			  <div class="card-body" style="text-align: center;">                  
          		  <img src="/azt-website/mainimage/aztweb3.png" width="1385px">
           		  </div>
           
           
           
          <jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" />
          
          <!-- Content wrapper -->
          <div class="content-wrapper">
            
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                  
                             <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            
        
            	<div class="row mb-5">
	  				  <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                  <a href="/azt-website/hotplaceBoard/hotplaceList.action">
	                  <img class="card-img" src="/azt-website/mainimage/hotplace.jpg" alt="Card image" />
	                  <div class="card-img-overlay">
	                    <h5 class="card-title">애견 동반 스팟 추천</h5>	                   
	                     <p class="card-text">click해서 더보기</p></a>                     
	                  </div>
	                  </div>
	                  </div>
	                  
	                   <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                  <a href="/azt-website/walkingDogBoard/walkingDogList.action">
	                  <img class="card-img" src="/azt-website/mainimage/walk.jpg" alt="Card image" />
	                  <div class="card-img-overlay">
	                    <h5 class="card-title">같이 산책할 댕댕이!</h5>
	                     <p class="card-text">click해서 더보기</p></a>
	                  </div>
	                  </div>
	                  </div>
	                  
	                    <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                  <img class="card-img" src="/azt-website/mainimage/aztmain.png" alt="Card image" />
	                  <div class="card-img-overlay">	                   
	                  </div>
	                  </div>
	                  </div>
	                  
	            </div> 
          		
          		
          		<div class="row mb-5">
	  				  <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                     <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
	                  <ol class="carousel-indicators">
                      <li data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></li>
                      <li data-bs-target="#carouselExample" data-bs-slide-to="1"></li>
                      <li data-bs-target="#carouselExample" data-bs-slide-to="2"></li>
                    </ol>
	                 
	                 <div class="carousel-inner">	                  
	                  <div class="carousel-item active">
			                  <img class="card-img" class="d-block w-100" src="/azt-website/mainimage/main7.jpg" alt="First slide" />
			                  <div class="card-img-overlay">
			                  
			                  <div class="carousel-caption d-none d-md-block">
			                  		<a href="https://bestpetgrooming.modoo.at/?link=3363lg3m" target="_blank">				                    
				                    <h5 class="card-title">우리 댕이 미용직접해요!</h5>				                   
				                    <p class="card-text">click<br>애견미용배우러가기!!</p>				                    
				                    </a>				                  		                     
				               </div>
				               </div>
				     </div>			                  
			   		 
	                  <div class="carousel-item">
	                  		
	                  		  <img class="card-img" class="d-block w-100" src="/azt-website/mainimage/show.jpg" alt="Second slide" />
			                  <div class="card-img-overlay">
			                  
			                  <div class="carousel-caption d-none d-md-block">
			                  		<a href="https://smartstore.naver.com/mungblancjery" target="_blank">
				                    
				                    <h5 class="card-title">우리집 애기들 간식을 책임져</h5>
				                   
				                    <p class="card-text">click<br>원데이클래스 신청하기</p>
				                    
				                    </a>			                 			                     
				               </div>
				               </div>
	                  
	                  </div>

	                  <div class="carousel-item">
	                  
	                  		  <img class="card-img" class="d-block w-100" src="/azt-website/mainimage/socute.jpg" alt="Third slide" />
			                  <div class="card-img-overlay">
			                  
			                  <div class="carousel-caption d-none d-md-block">			                  
				                    <a href="https://smartstore.naver.com/poopoomonster" target="_blank">				                    
				                    <h5 class="card-title">울 댕이, 안심 비건샴푸?</h5>				                   
				                    <p class="card-text">click<br>구매하러가기!!</p>				          	                     
				               </div>
				               </div>
	                  </div>
	                  <a class="carousel-control-prev" href="#carouselExample" role="button" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExample" role="button" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </a>
	                  
	                  </div>
	                 </div>
	                  
	               </div>  
	                  
	               </div>                    
	                   <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                  <a href="/azt-website/showmydog/showmydoglist.action">
	                  <img class="card-img" src="/azt-website/mainimage/showshow.jpg" alt="Card image" />
	                 	 <div class="card-img-overlay">
	                    <h5 class="card-title">내 새끼 뽐내기</h5>
	                    <p class="card-text">click해서 더보기</p></a>
	                  </div>
	                  </div>
	                  </div>
	                  
	                    <div class="col-md-6 col-xl-4">
	                  <div class="card bg-dark border-0 ">
	                   <a href="/azt-website/dogbreedintro/dogbreedintrolist.action">

	                  <img class="card-img" src="/azt-website/mainimage/breed.jpg" alt="Card image" />
	                 	 <div class="card-img-overlay">
	                     <h5 class="card-title">강아지 품종 소개</h5>
	                    <p class="card-text">click해서 더보기</p></a>
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

  </body>
</html>


