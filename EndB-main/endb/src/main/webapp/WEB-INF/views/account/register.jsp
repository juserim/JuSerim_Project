<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">
<style type="text/css">
.my-col-lg-4 {
	flex: 0 0 auto;
	margin: auto;
	width: 33.333333%;
}
</style>
<!--
    
TemplateMo 556 Catalog-Z

https://templatemo.com/tm-556-catalog-z

-->
</head>
<body>
	<!-- Page Loader -->
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="my-col-lg-4 col-12 mb-5">
				<h2 class="tm-text-primary mb-5">REGISTER</h2>
				<form onsubmit="return Check()" id="contact-form" action="register"
					method="POST" class="tm-contact-form mx-auto">
					<div class="form-group">
						<input type="text" id="userId" name="userId"
							class="form-control rounded-0" placeholder="아이디 (영문포함 4~12자 이상)"
							required />
						<p id="msgId"></p>
						<input type="button" id="checkId" value="중복검사">
					</div>
					<div id="ms"></div>
					<div class="form-group">
						<input type="password" id="passwd" name="passwd"
							class="form-control rounded-0"
							placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)" required />
						<p id="msgPw"></p>
					</div>
					<div class="form-group">
						<input type="password" id="confirm" name="confirm"
							class="form-control rounded-0" placeholder="비밀번호를 확인해주세요."
							required />
					</div>
					<div class="form-group">
						<input type="text" id="name" name="name"
							class="form-control rounded-0" placeholder="이름을 입력하세요." required />
						<p id="msgName"></p>
					</div>
					<div class="form-group">
						<input type="date" id="birth" name="birth"
							class="form-control rounded-0" placeholder="Birth" required />
					</div>
					<div class="form-group">
						<input type="email" id="email" name="email"
							class="form-control rounded-0" placeholder="이메일" required />
					</div>
					<div class="form-group tm-text-right">
						<button type="submit" class="btn btn-primary">REGISTER</button>
					</div>
				</form>
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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		var userIdCheck = RegExp(/^[A-Za-z0-9]{4,12}$/);
		var passwdCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*\d).{8,16}$/);
		var nameCheck = RegExp(/^[가-힣]+$/);
		function Check() {
			if (!userIdCheck.test($("#userId").val())) {
				$("#msgId").html("아이디 형식에 맞게 입력해주세요");
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
			if ($("#userId").attr("readonly") != 'readonly') {
				$('#msgId').html("중복 검사를 해야합니다.");
				return false
			}
			if ($('#passwd').val() != $('#confirm').val()) {
				$("#msgPw").html("비밀번호를 확인해주세요");
				$("#passwd").val("");
				$('#confirm').val("");
				$("#passwd").focus();
				return false;
			}

			if (!passwdCheck.test($('#passwd').val())) {
				$("#msgPw").html("비밀번호 형식에 맞게 입력해주세요");
				$("#passwd").val("");
				$('#confirm').val("");
				$("#passwd").focus();
				return false;
			}

			if (!nameCheck.test($('#name').val())) {
				$('#msgName').html("한글 이름을 작성해주세요");
				$("#name").val("");
				$("#name").focus();
				return false;
			}

		}

		$('#checkId').on('click', function() {
			checkId = $('#userId').val()
			if (!userIdCheck.test($("#userId").val())) {
				$("#msgId").html("아이디 형식에 맞게 입력해주세요.");
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
			$.ajax({
				"url" : "checkId",
				"method" : "post",
				"async" : true,
				"data" : "checkId=" + checkId, // boardno=1&writer=imauser1&content=test
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					if (data === "success") {
						$("#userId").attr("readonly", true);
						$("#msgId").html("사용가능한 아이디 입니다.");
					} else {
						$("#msgId").html("중복된 아이디입니다.");
						$('#userId').val("")
					}
				},
				"error" : function(xhr, status, err) {
				}
			});
		});
	</script>
</body>

</html>