<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Catalog-Z About page</title>
 <%-- <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>" type="text/css" />  --%>
<link href="http://fonts.googleapis.com/css?family=PT+Sans:300,400,500,600,700" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"> 
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"type="text/css" />
<link rel="stylesheet"  href="<c:url value='/resources/css/dark.css'/>" type="text/css" />
<link rel="stylesheet" href="<c:url value='/resources/css/font-icons.css'/>" type="text/css" />
<link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>" type="text/css" />
<link rel="stylesheet"  href="<c:url value='/resources/css/magnific-popup.css'/>"  type="text/css" />
<link rel="stylesheet"href="<c:url value='/resources/css/responsive.css'/>"  type="text/css" />
</head>
<body>
	<!-- Page Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />

	<div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="img/hero.jpg"></div>

	<div class="container clearfix">

                <!-- Contact Form Overlay
                ============================================= -->
                <div id="contact-form-overlay" class="clearfix bgcolor-grey">

                    <div class="fancy-title title-dotted-border">
                        <h3>예약 조회 및 취소</h3>
                    </div>

                    <div id="contact-form-result" data-notify-type="success" data-notify-msg="<i class=icon-ok-sign></i> Message Sent Successfully!">
                    </div>
                    <c:choose>
                    <c:when test="${dto ne null}">
                   <c:forEach var="reservation" items="${ dto }">
                   
                    <form>
					<%-- <input type="hidden" name="reservation_number" id="reservation_number" value="${dto.reservation_number}"> --%>
					<div class="row">
						 	<div class="col_full">
							<label for="template-contactform-name">예약번호</label><br>
							<div class="well well-sm"><c:out value="${reservation.reservationNumber}" /></div>
					</div>
					<div class="col-md-6">
							<label for="template-contactform-name">방 번호</label><br>
							<a href="/endb/board/detail?boardno=8&pageNo=1">
					${reservation.roomId }
					</a>
							<%-- <div class="well well-sm"><c:out value="${reservation.roomId}"/></div> --%>
						</div>
					
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<label for="template-contactform-name">체크인</label><br>
							<div class="well well-sm"><fmt:formatDate
							value="${ reservation.checkIn }" dateStyle="short" /></div>
						</div> 
						
						
                      	 <div class="col-md-6">
							<label for="template-contactform-name">체크아웃</label><br>
							<div class="well well-sm"><fmt:formatDate
							value="${ reservation.checkOut }" dateStyle="short" /></div>
						</div> 
						
					</div>
					<div class="row">
						<div class="col-md-6">
							<label for="template-contactform-name">성인</label><br>
							<div class="well well-sm"><c:out value="${reservation.adult}" /></div>
						</div>

						<div class="col-md-6">
							<label for="template-contactform-name">어린이</label><br>
							<div class="well well-sm"><c:out value="${reservation.kid}" /></div>
						</div>
					</div>
					
					<div class="col_full">
							<label for="template-contactform-name">가격</label><br>
							<div class="well well-sm"><fmt:formatNumber value="${reservation.price}" pattern="#,###" /></div>
					</div>
					
                        <div class="clearfix" style=" text-align:center;" >
		                        <c:if test="${confirmation_payment eq '0'}">
		                           <button type="button" id="pay"  class="button button-medium button-reveal button-3d button-rounded tright nomargin" style="color:black; ">
		                                <span >결제하기</span> 
		                                <i class="icon-angle-right"></i>
		                               </button>
                             </c:if>
	                       
	                                <button type="button" id="cancel" class="button button-medium button-reveal button-3d button-rounded tright nomargin" style="color:black;">
	                                <span>예약취소</span> <i class="icon-angle-right"></i></button>
	                                         <div id ="PWconfirm">   </div>
	                                   <div class="col_full">
								<!-- <label for="template-contactform-name">결제 확인</label> --><br>
								  <!-- <div class="well well-sm" id ="passwordCheck">
									<input type="password" id="passwordCheck2" class="well well-sm"  size="90" placeholder="회원님의 비밀번호를 입력해주세요"> 
									<button type="button" id="cancelOk" onclick="ReservationCancel()" class="button button-medium button-reveal button-3d button-rounded tright nomargin" style="color:black;">
									     확인<i class="icon-angle-right"  ></i></button>
									</div> -->
						       </div> 
                                
                                </div>
                                
                        </form>
                        <br><hr>
	                        </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                    <span style="color: red"> 현재 조회된 결과가 없습니다</span> 
	                    </c:otherwise>
                    </c:choose>
                       <script>
                       
                       $("#pay").click(function(){
                    	   location.href = "${pageContext.request.contextPath}/reservation/ReservationPay?number=${reservation.reservationNumber}"
                       });
                       
                       $("#passwordCheck").hide();
                       $("#cancel").click(function(){ //예약취소 버튼을 클릭 시 
                    	   $("#passwordCheck").show();
                       });

               	  /*  function ReservationCancel(){ //확인버튼 클릭 시 
               	    $.ajax({
       			    type:'POST',
       			    url:'${pageContext.request.contextPath}/reservation/ReservationPasswordCheck',
       			    data:{
       			    	"m_id" : "${reservation.userNo}",
       			    	"m_password" : $("#passwordCheck2").val()
       			    },
       			    success: function(result) {
       		                if(result)  {
       		                	//alert('예약 취소 성공');
       		                  $("#passwordCheck").hide();
       		                  $("#cancel").hide();
       		                  $("#pay").hide();
       		                  $("#PWconfirm").html('<span style="color: blue">예약 취소가 완료되었습니다 감사합니다.</span>');
       		                }
       		                else  alert('비밀번호를 확인해주세요');
       		                }
       		          });//ajax
               	   } */
	             		</script>

                    <script type="text/javascript">
                        $("#template-contactform").validate({
                            submitHandler: function(form) {
                                $('.form-process').fadeIn();
                                $(form).ajaxSubmit({
                                    target: '#contact-form-result',
                                    success: function() {
                                        $('.form-process').fadeOut();
                                        $('#template-contactform').find('.sm-form-control').val('');
                                        $('#contact-form-result').attr('data-notify-msg', $('#contact-form-result').html()).html('');
                                        IGNITE.widget.notifications($('#contact-form-result'));
                                    }
                                });
                            }
                        });
                    </script>
                    
             
                    <div class="line"></div>

                    <!-- Contact Info
                    ============================================= -->
                 
                    </div><!-- Twitter End -->

                </div>
	<!-- container-fluid, tm-container-content -->

	<footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
		<div class="container-fluid tm-container-small">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
					<h3 class="tm-text-primary mb-4 tm-footer-title">About
						Catalog-Z</h3>
					<p>Catalog-Z is free Bootstrap 5 Alpha 2 HTML Template for
						video and photo websites. You can freely use this TemplateMo
						layout for a front-end integration with any kind of CMS website.</p>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
					<h3 class="tm-text-primary mb-4 tm-footer-title">Our Links</h3>
					<ul class="tm-footer-links pl-0">
						<li><a href="#">Advertise</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">Our Company</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
					<ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
						<li class="mb-2"><a href="https://facebook.com"><i
								class="fab fa-facebook"></i></a></li>
						<li class="mb-2"><a href="https://twitter.com"><i
								class="fab fa-twitter"></i></a></li>
						<li class="mb-2"><a href="https://instagram.com"><i
								class="fab fa-instagram"></i></a></li>
						<li class="mb-2"><a href="https://pinterest.com"><i
								class="fab fa-pinterest"></i></a></li>
					</ul>
					<a href="#" class="tm-text-gray text-right d-block mb-2">Terms
						of Use</a> <a href="#" class="tm-text-gray text-right d-block">Privacy
						Policy</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-7 col-12 px-5 mb-3">Copyright 2020
					Catalog-Z Company. All rights reserved.</div>
				<div class="col-lg-4 col-md-5 col-12 px-5 text-right">
					Designed by <a href="https://templatemo.com" class="tm-text-gray"
						rel="sponsored" target="_parent">TemplateMo</a>
				</div>
			</div>
		</div>
	</footer>

	<script src="/endb/resources/js/plugins.js"></script>
	<script>
		$(window).on("load", function() {
			$('body').addClass('loaded');
		});
	</script>
</body>
</html>