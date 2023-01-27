<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Catalog-Z Bootstrap 5.0 HTML Template</title>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">
<!--
    
TemplateMo 556 Catalog-Z

https://templatemo.com/tm-556-catalog-z

-->
</head>
<body>
	<!-- Page Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
	

	<!-- <div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="img/hero.jpg">
			<input class="" type="text" value="메세지 보내기 " aria-label="메시지보내기 ">
			<button class="btn btn-outline-success tm-search-btn" onclick="location.href=('write');">
				<i class="fa fa-comments"></i>
			</button>
	</div> -->

	<div class="container-fluid tm-container-content tm-mt-60">
	
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary">보낸메시지함 </h2>
			<!-- <div class="col-6 d-flex justify-content-end align-items-center">
				<form action="" class="tm-text-primary">
					Page <input type="text" value="1" size="1"
						class="tm-input-paging tm-text-primary"> of 200
				</form>
			</div> -->
		</div>
		
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach items="${ requestScope.messageSendList }" var="message">
				
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">	
				<figure class="effect-ming tm-video-item">
				   <img src="/endb/resources/img/10.png" alt="Image" class="img-fluid">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2> ${ message.title } </h2>
						<a href="detail2?messageno=${ message.messageNo }&pageNo=${ pageNo }"></a>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
				<h6>보낸시간</h6>
					<span class="tm-text-gray-light">${ message.sendDate }</span> 
				</div>
			</div>
		
			</c:forEach>
			
		</div>
		
		${ messagepager }
		
		<!-- row -->
	<!-- 	 <div class="row tm-mb-90">
			<div
				class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
				<a href="javascript:void(0);"
					class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
				<div class="tm-paging d-flex">
					<a href="javascript:void(0);" class="active tm-paging-link">1</a> <a
						href="javascript:void(0);" class="tm-paging-link">2</a> <a
						href="javascript:void(0);" class="tm-paging-link">3</a> <a
						href="javascript:void(0);" class="tm-paging-link">4</a>
				</div>
				<a href="javascript:void(0);" class="btn btn-primary tm-btn-next">Next
					Page</a>
			</div>
		</div>
 -->	</div>
	<!-- container-fluid, tm-container-content -->

	<footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
		<div class="container-fluid tm-container-small">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
					<h3 class="tm-text-primary mb-4 tm-footer-title">About
						Catalog-Z</h3>
					<p>
						Catalog-Z is free <a rel="sponsored"
							href="https://v5.getbootstrap.com/">Bootstrap 5</a> Alpha 2 HTML
						Template for video and photo websites. You can freely use this
						TemplateMo layout for a front-end integration with any kind of CMS
						website.
					</p>
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
		
		///////////////////////////////
		
	</script>
	
	
</body>
</html>