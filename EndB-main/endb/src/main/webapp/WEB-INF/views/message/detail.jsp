<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Catalog-Z Contact page</title>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">
<style type="text/css">
.my-col-lg-4 {
    flex: 0 0 auto;
    margin: auto;
    width: 33.333333%;}
</style>
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
	
	
	<div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="img/hero.jpg"></div>

	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="my-col-lg-4 col-12 mb-5">
				<h2 class="tm-text-primary mb-5">메시지내용</h2>
				<form id="contact-form" action="detail" method=""
					class="tm-contact-form mx-auto">
					<div class="form-group">
					<h4>번호</h4>
					     <input type="number" name="messageno" readonly value="${ message.messageNo }" 
					      class="form-control rounded-0"/>
					</div>
					<div class="form-group">
					<h4>보낸사람</h4>
						<input type="text" readonly 
							   value="${ message.senderId }" 
							   class="form-control rounded-0">
						<input type="hidden" name="sender" value="${ message.sender }">  
					</div>
					<div class="form-group">
					<h4>제목 </h4>
					     <input type="text" name="title" readonly value="${ message.title }" 
					      class="form-control rounded-0"/>
					</div>
					<div class="form-group">
					<h4> 내용 </h4>
						<input type="text" name="content" readonly value="${ message.content }" 
					     class="form-control rounded-0"/>
					</div>
					<div class="form-group">
					<h6>보낸시간</h6>
					<span class="tm-text-gray-light">${ message.receiveDate }</span>
					</div>
					<div class="form-group tm-text-right">
					<button id="reply-btn" type="button" class="btn btn-primary">답장</button>
						<button id="delete-btn" type="button" class="btn btn-primary">삭제</button>
						<button type="button" class="btn btn-primary" onclick="location.href=('list');">목록</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row tm-mb-74 tm-people-row">
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5">
				<img src="img/people-1.jpg" alt="Image" class="mb-4 img-fluid">
				<h2 class="tm-text-primary mb-4">Ryan White</h2>
				<h3 class="tm-text-secondary h5 mb-4">Chief Executive Officer</h3>
				<p class="mb-4">Mauris ante tellus, feugiat nec metus non,
					bibendum semper velit. Praesent laoreet urna id tristique
					fermentum. Morbi venenatis dui quis diam mollis pellentesque.</p>
				<ul class="tm-social pl-0 mb-0">
					<li><a href="https://facebook.com"><i
							class="fab fa-facebook"></i></a></li>
					<li><a href="https://twitter.com"><i
							class="fab fa-twitter"></i></a></li>
					<li><a href="https://linkedin.com"><i
							class="fab fa-linkedin"></i></a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5">
				<img src="img/people-2.jpg" alt="Image" class="mb-4 img-fluid">
				<h2 class="tm-text-primary mb-4">Catherine Pinky</h2>
				<h3 class="tm-text-secondary h5 mb-4">Chief Marketing Officer</h3>
				<p class="mb-4">Sed faucibus nec velit finibus accumsan. Sed
					varius augue et leo pharetra, in varius lacus eleifend. Quisque ut
					eleifend lacus.</p>
				<ul class="tm-social pl-0 mb-0">
					<li><a href="https://facebook.com"><i
							class="fab fa-facebook"></i></a></li>
					<li><a href="https://twitter.com"><i
							class="fab fa-twitter"></i></a></li>
					<li><a href="https://linkedin.com"><i
							class="fab fa-linkedin"></i></a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5">
				<img src="img/people-3.jpg" alt="Image" class="mb-4 img-fluid">
				<h2 class="tm-text-primary mb-4">Johnny Brief</h2>
				<h3 class="tm-text-secondary h5 mb-4">Accounting Executive</h3>
				<p class="mb-4">Sed faucibus nec velit finibus accumsan. Sed
					varius augue et leo pharetra, in varius lacus eleifend. Quisque ut
					eleifend lacus.</p>
				<ul class="tm-social pl-0 mb-0">
					<li><a href="https://facebook.com"><i
							class="fab fa-facebook"></i></a></li>
					<li><a href="https://twitter.com"><i
							class="fab fa-twitter"></i></a></li>
					<li><a href="https://linkedin.com"><i
							class="fab fa-linkedin"></i></a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5">
				<img src="img/people-4.jpg" alt="Image" class="mb-4 img-fluid">
				<h2 class="tm-text-primary mb-4">George Nelson</h2>
				<h3 class="tm-text-secondary h5 mb-4">Creative Art Director
					#C69</h3>
				<p class="mb-4">Nunc convallis facilisis congue. Curabitur
					gravida rutrum justo sed pulvinar. Pellentesque ac ante in erat
					bibendum dignissim.</p>
				<ul class="tm-social pl-0 mb-0">
					<li><a href="https://facebook.com"><i
							class="fab fa-facebook"></i></a></li>
					<li><a href="https://twitter.com"><i
							class="fab fa-twitter"></i></a></li>
					<li><a href="https://linkedin.com"><i
							class="fab fa-linkedin"></i></a></li>
				</ul>
			</div>
		</div>
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
		
		$(function() { // 수신된 html의 dom객체 구성 완료되었을 때 호출 ( 화면 준비 완료 )
			
			// $('#delete-btn').on('click', function(event)) {
			$('#delete-btn').click(function(event) {
				event.preventDefault();
				var ok = confirm('삭제할까요?');
				if (ok) {
					location.href = 'delete?messageno=${ message.messageNo }';
				}
				
			});
			
			$('#reply-btn').on('click', function(event) {
				location.href = "reply?receiverNo=${ message.sender }&receiverId=${ message.senderId }";
			});
		});
	</script>
</body>
</html>