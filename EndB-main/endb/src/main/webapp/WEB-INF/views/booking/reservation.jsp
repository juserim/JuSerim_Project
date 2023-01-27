<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bootstrap 3 Website Template" />
<meta http-equiv='x-ua-compatible' content='ie=edge'>
<title>Catalog-Z Contact page</title>
<link rel="icon" href="./docs/.vuepress/public/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src='https://unpkg.com/vue/dist/vue.js'></script>
<script src='https://unpkg.com/v-calendar'></script>
<link rel="stylesheet" href="/endb/resources/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/endb/resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/endb/resources/css/templatemo-style.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/date-fns/1.29.0/date_fns.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css"
	href="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.css">


<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean')
	;
</style>
<style>
section {
	margin-top: 26px;
	max-width: 400px;
	margin-left: auto;
	margin-right: auto;
}

.selectors {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
}

.selectors label {
	margin-left: 10px;
}

html, body {
	min-height: 100vh;
	font-size: 14px;
	font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen,
		Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
	line-height: 18px;
	font-weight: 400;
	-webkit-font-smoothing: antialiased;
	padding: 10px;
}

.align-right {
	text-align: right;
}

h1 {
	font-size: 1.8em;
	line-height: 1.5em;
}

.datepicker-container {
	margin-bottom: 30px;
}

#datepicker-button-trigger {
	background: #008489;
	border: 1px solid #008489;
	color: white;
	padding: 6px 10px;
	border-radius: 4px;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	min-width: 200px;
}

input {
	padding: 6px 10px;
	border: 1px solid rgba(0, 0, 0, 0.2);
}

.inline-with-input {
	width: 300px;
}

.inline-with-input input {
	width: 100%;
}
</style>
<script type="text/javascript">

		
</script>
</head>
<body>
	<!-- Page Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="comment-modal" tabindex="-1" role="dialog"
		aria-labelledby="comment-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="comment-modal-label">날짜</h5>
				</div>
				<div class="modal-body">
					<div id="app">
						<v-row justify="center"> <v-date-picker
							:disabled-dates='[
						<c:forEach var="reservation" items="${ dto }">
						{ start: new Date(${reservation.checkIn}),
						  end: new Date(${reservation.checkOut})
						  },
						  </c:forEach>
						]'
							:min-date='new Date()' :trigger="trigger"
							:date-one="buttonDateOne" :date-two="buttonDateTwo"
							:trigger-element-id="'datepicker-button-trigger'"
							v-on:date-one-selected="function(val) { buttonDateOne = val }"
							v-on:date-two-selected="function(val) { buttonDateTwo = val }"
							v-on:closed="onClosed" v-model="range" mode="date" :masks="masks"
							is-range>
						<template v-slot="{ inputValue, inputEvents, isDragging }">
							<form id="comment-form">
								<div
									class="flex flex-col sm:flex-row justify-start items-center">
									<div class="relative flex-grow">
										<input type="hidden" name="userNo"
											value="${ loginuser.userNo }"> <input type="hidden"
											id="roomId" name="roomId" value="${room.room_id}"> <input
											type="hidden" id="adult2" name="adult" value="1"> <input
											type="hidden" id="kid2" name="kid" value="0">
											<input
											type="hidden" id="dif" name="diff" value="0">
											<input type="hidden" id="finalPrice" name=price>
										<!-- <input class="btn btn-dark" type="submit" value="예약하기" > -->
										<input id="dateOne" name="checkIn"
											class="flex-grow pl-8 pr-2 py-1 bg-gray-100 border rounded w-full"
											:class="isDragging ? 'text-gray-600' : 'text-gray-900'"
											:value="inputValue.start" v-on="inputEvents.start" />
									</div>
									<span class="flex-shrink-0 m-2"> </span>
									<div class="relative flex-grow">
										<input name="checkOut" id="dateTwo"
											class="flex-grow pl-8 pr-2 py-1 bg-gray-100 border rounded w-full"
											:class="isDragging ? 'text-gray-600' : 'text-gray-900'"
											:value="inputValue.end" v-on="inputEvents.end" />
									</div>
								</div>
							</form>
						</template>
						</v-date-picker> </v-row>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalRegisterBtn' type="button"
						class="btn btn-success btn-sm">저장 하기</button>
					<button id='modalCloseBtn' type="button"
						class="btn btn-success btn-sm">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- Modal -->
	<div class="modal fade" id="comment-modal1" tabindex="-1" role="dialog"
		aria-labelledby="comment-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="comment-modal-label">게스트</h5>
				</div>
				<div class="modal-body">
					<div class="_1y5b6gl">
						<div role="group" class="_hdazz0">
							<span id="GUEST_PICKER-adults-title"> <span
								class="_1lmb2fq;" style="font-size: x-large">성인(만18세 이상)</span>
							</span>
							<form>
								<span class="_jro6t0; float-right"> <span class="_3zlfom"
									id="GUEST_PICKER-adults-stepper"> <input type=text
										value="1" id="adult1"> <span
										style="visibility: hidden" class="_25sktq"
										data-testid="GUEST_PICKER-adults-stepper-a11y-value-label">성인
											2명</span>
								</span>
								</span>
							</form>
						</div>
						<br> <br> <br> <br>
						<div role="group" class="_hdazz0">
							<span id="GUEST_PICKER-adults-title"> <span
								class="_1lmb2fq;" style="font-size: x-large">아이(만18세 미만)</span>
							</span>
							<form>
								<span class="_jro6t0; float-right"> <span class="_3zlfom"
									id="GUEST_PICKER-adults-stepper"> <input type=text
										value="0" id="kid1"> <span style="visibility: hidden"
										class="_25sktq"
										data-testid="GUEST_PICKER-adults-stepper-a11y-value-label">아이
											2명</span>
								</span>
								</span>
							</form>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalRegisterBtn1' type="button"
						class="btn btn-success btn-sm">저장 하기</button>
					<button id='modalCloseBtn1' type="button"
						class="btn btn-success btn-sm">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="img/hero.jpg"></div>


	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-4 col-12 mb-5">
				<h2 class="tm-text-primary mb-5">예약 하기</h2>
				<form id="contact-form" action="" method="POST"
					class="tm-contact-form mx-auto">
					<h2 class="form-group">날짜</h2>
					<div class="form-group" id="date1">2022-07-20~2022-07-21</div>
					<button id="add-comment-btn" type="button"
						style="width: 100px; height: 30px"
						class="btn btn-outline-primary btn-sm">수정</button>
					<hr>
					<h2 class="form-group">게스트</h2>
					<div class="form-group" id="guest2">성인 1명</div>
					<div class="form-group" id="guest3">아이 0명</div>
					<h3 class="form-group" id="guest">총 1명</h3>
					<button id="add-comment-btn1" type="button"
						style="width: 100px; height: 30px"
						class="btn btn-outline-primary btn-sm">수정</button>

				</form>

			</div>
			<div class="col-lg-4 col-12 mb-5">
				<div class="tm-address-col">
					<h2 class="tm-text-primary mb-5"></h2>
					<a href="#" onclick="goBack()">
					<img src="/endb/resources/upload-files/${room.savedfilename}"
						alt="Image" class="img-fluid"
						style="margin: auto; width: 50%; height: auto;">
					</a>
					<h4 class="tm-text-gray" style="">${room.title }</h4>
					<br>
					<h3>요금 세부 정보</h3>
					<div class="tm-text-gray"
						style="width: 100%; display: flex; font-size: large;">
						<div>숙박 요금:</div>
						<div id="cal" style="">${room.price}원 x 1박</div>
						=
						<div id="total" style="float: right">${room.price}</div>
						원
					</div>
					<div class="tm-text-gray"
						style="font-size: large; width: 100%; display: flex">
						<div>서비스 수수료:</div>
						<div id="bill"></div>
						원
					</div>
					<hr>
					<div class="tm-text-gray"
						style="font-size: large; width: 100%; display: flex">
						<div>총 요금</div>
						<div id="final">${room.price}</div>
						원
					</div>
					<div class="form-group tm-text-right">
						<button style="width: 100%" id='bookBtn' type="button"
							class="btn btn-primary">예약하기</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-12 mb-5">
				<%-- <div class="tm-address-col">
					<h2 class="tm-text-primary mb-5">Our Address</h2>
					<img src="/endb/resources/upload-files/${room.savedfilename}" alt="Image" class="img-fluid" style="margin:auto; width: 50%; height: auto;">
					</address>
					<ul class="tm-contacts">
						<li><a href="#" class="tm-text-gray"> <i
								class="fas fa-envelope"></i> ${room.title }
						</a></li>
						<li><a href="#" class="tm-text-gray"> <i
								class="fas fa-phone"></i>&#8361;${room.price}x1박
								<p style="float:right;">${room.price}</p>
						</a></li>
						<li><a href="#" class="tm-text-gray"> <i
								class="fas fa-globe"></i> URL: www.company.com
						</a></li>
					</ul>
				</div> --%>
			</div>
		</div>
		<!-- 로우 끝 -->


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

	<script src='https://unpkg.com/vue/dist/vue.js'></script>
	<script src='https://unpkg.com/v-calendar'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="calendar.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script
		src="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.js"></script>
	<script src="/endb/resources/js/plugins.js"></script>
	<script>
		$(window).on("load", function() {
			$('body').addClass('loaded');
			
		});
	</script>

	<script>
	function goBack() {
		  window.history.back();
		}
	
		 var datepickerOptions = {}
		Vue.use(window.AirbnbStyleDatepicker, datepickerOptions) 
		
		var app = new Vue({
		      el: '#app',
		      data: {
			        dateFormat: 'YYYY년 MM월 D일',
			        inputDateOne: '',
			        inputDateTwo: '',
			        buttonDateOne: '',
			        buttonDateTwo: '',
			        inlineDateOne: '',
			        sundayDateOne: '',
			        sundayFirst: false,
			        alignRight: false,
			        trigger: false,
			      },
		      data() {
		    	  return {
		    	      range: {
		    	        start: new Date(2022, 6, 20),
		    	        end: new Date(2022, 6, 21),
		    	      },
		    	      masks: {
		    	        input: 'YYYY-MM-DD',
		    	      },
		    	    };
		      },
		      methods : {
					formatDates : function(dateOne, dateTwo) {
						var formattedDates = ''
						if (dateOne) {
							formattedDates = dateFns.format(dateOne,
									this.dateFormat)
						}
						if (dateTwo) {
							formattedDates += ' - '
									+ dateFns.format(dateTwo, this.dateFormat)
						}
						return formattedDates
					},
					onClosed: function() {
				          var datesStr = this.formatDates(this.inputDateOne, this.inputDateTwo)
				          console.log('Dates Selected: ' + datesStr)
				          this.trigger = false
				          $('#dateOne').val(this.buttonDateOne);
				          $('#dateTwo').val(this.buttonDateTwo);
				          if(this.buttonDateOne=="" || this.buttonDateTwo ==""){
				            	alert("날짜를 선택해 주세요.");
				          }else{
				          alert("선택하신 날짜는 "+this.buttonDateOne+"~"+this.buttonDateTwo+"입니다.");
				          }
				        },
				        triggerDatepicker: function() {
					          this.trigger = !this.trigger
					        },
					        onMonthChange: function(dates) {
					          console.log('months changed', dates)
					        },
					        login: function(dateOne, dateTwo){
					      	  console.log(this.dateOne, this.dateTwo)
					        },
		      },
		
		    })
			
		 
		function printTime() {

			var clock = document.getElementById("clock");// 출력할 장소 선택
			var now = new Date();// 현재시간
			var nowTime = "'" + now.getFullYear() + "-" + (now.getMonth() + 1)
					+ "-" + now.getDate() + "'";
			clock.innerHTML = nowTime;// 현재시간을 출력
		}
		window.onload = function() {// 페이지가 로딩되면 실행
			printTime();
		}
		
	</script>
	<script type="text/javascript">
	
	$("#adult1").change(function(){ 
	var str = parseInt($('#adult1').val())
		guest2.innerText = "성인 " + str + "명";
		$('#adult2').val(str)
	});
	$("#kid1").change(function(){ 
	var st = parseInt($('#kid1').val())
		guest3.innerText = "아이 " + st + "명";
		$('#kid2').val(st)
	});
		
	const getDateDiff = (d1, d2) => {
		  const date1 = new Date(d1);
		  const date2 = new Date(d2);
		  
		  const diffDate = date1.getTime() - date2.getTime();
		  
		  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		};
		
	
	$(function () {
		
		$('#add-comment-btn').on('click', function(event) {
			$('#modal-content').val("");
			$('#comment-modal').modal('show');
		});
		$('#add-comment-btn1').on('click', function(event) {
			$('#modal-content').val("");
			$('#comment-modal1').modal('show');
		});
		$('#modalCloseBtn1').on('click', function(event) {
			$('#comment-modal1').modal('hide');
		});
		$('#modalCloseBtn').on('click', function(event) {
			$('#comment-modal').modal('hide');
		});
		$('#modalRegisterBtn1').on('click', function(event) {    
			 guest.innerText = "총 "+ (parseInt($('#adult1').val()) + parseInt($('#kid1').val())) + "명"; 
			$('#comment-modal1').modal('hide');
		});
		$('#modalRegisterBtn').on('click', function(event) {    
			var diff = getDateDiff($('#dateTwo').val(), $('#dateOne').val())
			 $('#date1').text($('#dateOne').val() + "~" + $('#dateTwo').val()) 
			 $('#total').text((diff * ${room.price})); 
			 $('#cal').text(${room.price} + "원 x " + diff + "박");
		$('#bill').text(Math.floor(parseInt($('#total').text()) / 10))
		$('#final').text(parseInt($('#bill').text()) + parseInt($('#total').text()))
			$('#comment-modal').modal('hide');
		$('#finalPrice').val($('#final').text())
			$('#dif').val(diff)
		});
		$('#bookBtn').on('click', function(event) {
			event.preventDefault();
			var ok = confirm('예약하시겠습니까?')
			if (ok) {
				
			var formData = $('#comment-form').serialize();
			
			 var one = $('#dateOne').val();
			var two = $('#dateTwo').val();
			if (one.length == 0) {
				alert('체크인 날짜를 선택하세요');
				return;
			} else if (two.length == 0) {
				alert('체크아웃 날짜를 선택하세요');
				return;
			} 
			$.ajax({
				"url" : "reservation",
				"method" : "post",
				"async" : true,
				"data" : formData,
				"dataType" : "text",
				"success" : function(data, status, xhr) {					
						alert('예약 성공 예약을 조회해보세요')
				},
				"error" : function(xhr, status, err) {
					alert('예약 실패 ');
				}
			})
			}
		})
	})
	</script>
</body>
</html>