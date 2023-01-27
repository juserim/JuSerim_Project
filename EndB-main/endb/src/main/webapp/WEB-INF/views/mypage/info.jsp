<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Catalog-Z Contact page</title>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">


</head>
<body>


	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
	<div
		style="flex: 0 0 auto; margin: 150px auto; width: 700px; padding: 30px; border-style: solid; border-color: #9ec2e6;">
		<form action="info" method="POST" enctype="multipart/form-data">
			<div class="row tm-mb-74 tm-people-row">
				<div class="col-lg-4">
					<c:choose>
						<c:when test="${ empty user.savedFileName }">
							<img src="/endb/resources/img/user.jpg" alt="Image"
								class="mb-4 img-fluid"
								style="float: left; width: 175px; height: 175px;">
						</c:when>
						<c:otherwise>
							<img src="/endb/resources/upload-files/${ user.savedFileName }"
								alt="Image" class="mb-4 img-fluid"
								style="float: left; width: 175px; height: 175px;">
						</c:otherwise>
					</c:choose>
					<input type="file" name="attach" enctype="multipart/form-data">
					<input type="hidden" name="savedFileName"
						value="${ user.savedFileName }"> <input type="hidden"
						name="userFileName" value="${ user.userFileName }">
				</div>
				<div class="col-lg-8">
					<input type="hidden" name="userNo" value="${ user.userNo }">
					<h3 class="form-control rounded-0">${ user.userId }</h3>
					<hr>
					<input type="text" name="name" class="form-control rounded-0"
						value="${ user.name }">
					<hr>
					<input type="email" name="email" class="form-control rounded-0"
						value="${ user.email }">
					<hr>
				</div>
				<input type="date" name="birth" class="form-control rounded-0"
					value="${ user.birth }">
				<hr>
				<div class="form-group tm-text-right">
					<button type="submit" class="btn btn-primary" style="float: right;">회원 수정</button>
					<button type="button" id="delete-btn" class="btn btn-primary"
						style="float: left;">계정 삭제</button>
				</div>
			</div>
		</form>
		<h3>예약 목록</h3>
		<table border="1" class="form-control rounded-0" style="width: 100%">
			<tr>
				<th style="width: 100px">예약 번호</th>
				<th style="width: 150px">방 이름</th>
				<th style="width: 200px">시작 날짜</th>
				<th style="width: 200px">끝 날짜</th>
				<th style="width: 50px">어른</th>
				<th style="width: 50px">아이</th>
			</tr>
			<c:forEach var="reservation" items="${ reservationList }">
				<tr>
					<td style="width: 100px">${ reservation.reservationNumber }</td>
					<td style="width: 150px">${ reservation.roomId }</td>
					<td style="width: 200px"><fmt:formatDate
							value="${ reservation.checkIn }" dateStyle="short" /></td>
					<td style="width: 200px"><fmt:formatDate
							value="${ reservation.checkOut }" dateStyle="short" /></td>
					<td style="width: 50px">${ reservation.adult }</td>
					<td style="width: 50px">${ reservation.kid }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<h3>작성한 글</h3>
		<table border="1" class="form-control rounded-0" style="width: 100%">
			<tr>
				<th style="width: 100px">글 제목</th>
				<th style="width: 150px">내용</th>
			</tr>
			<c:forEach var="board" items="${ boardList }">
				<tr>
					<td style="width: 100px">${ board.title }</td>
					<td style="width: 150px">${ board.content }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container-fluid tm-container-small">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
				<h3 class="tm-text-primary mb-4 tm-footer-title">About
					Catalog-Z</h3>
				<p>Catalog-Z is free Bootstrap 5 Alpha 2 HTML Template for video
					and photo websites. You can freely use this TemplateMo layout for a
					front-end integration with any kind of CMS website.</p>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$('#delete-btn').on('click', function(event) {
			var ok = confirm("계정을 삭제하시곘습니까?");
			if (ok) {
				location.href = 'userDelete?userNo=${ user.userNo }';
			}
		});
	</script>

</body>
</html>