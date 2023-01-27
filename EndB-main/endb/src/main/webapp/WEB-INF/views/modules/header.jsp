<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="/endb/home"> <i
			class="fas fa-film mr-2"></i> Catalog-Z
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link nav-link-1"
					href="/endb/booking/reservationSelect?pageNo=${ pageNo }">예약 조회</a></li>
				<!-- <li class="nav-item"><a class="nav-link nav-link-2"
					href="/endb/message/list">메시지</a></li> -->
					<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          메시지 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/endb/message/list">받은메시지함</a>
          <a class="dropdown-item" href="/endb/message/sendlist">보낸메시지함</a>
        </div>
      </li>
				<li class="nav-item"><a class="nav-link nav-link-3"
					aria-current="page" href="/endb/board/write">호스트되기</a></li>
				<c:choose>
					<c:when test="${ empty loginuser }">
						<li class="nav-item"><a class="nav-link nav-link-4"
							href="/endb/account/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link nav-link-4"
							href="/endb/account/register">회원가입</a></li>
					</c:when>
					<c:otherwise>
					<li class="nav-item"><a class="nav-link nav-link-4"
							href="/endb/mypage/info?userNo=${ loginuser.userNo }">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link nav-link-4"
							href="/endb/account/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

	</div>
</nav>