<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>A:zt - Login</title>
	 
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   
    <link rel="stylesheet" href="/azt-website/static/assets/css/account.css" />
 
</head>

                   
<body class="bg-gradient-primary">
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">
        
        		 <a href="/azt-website/home.action" class="app-brand-link">
            <img src="/azt-website/mainimage/azt-icon.png" width="400px"> </a>

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" action="login.action" method="post" id="login-form">
                                        <div class="form-group">
                                            <input type="text" name="memberId" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="아이디" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="passwd" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password" value="">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                            </div>
                                        </div>
                                 
                                        <input type="submit" value="로그인" class="btn btn-primary btn-user btn-block" id="login"/>
		        						<a href="/azt-website/home.action" class="btn btn-primary btn-user btn-block">취소</a> 
                                        <!-- <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"> <a href="javascript:void(0)"></i> Login with kakao
                                        </a>                        
                                    </form> -->
                                    <hr>
                                    <div class="text-center">
                                        <!-- <a class="small" href="#">Forgot Password?</a> -->
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/azt-website/account/register.action">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
    
    
    
    
    <script type="text/javascript">
    
    var login = document.querySelector('#login');
	login.addEventListener("click", function(event) {
		event.preventDefault();		
		
		var id = document.querySelector('#exampleInputEmail');
		var pw = document.querySelector('#exampleInputPassword');
		if(!id.value) {
			alert('아이디를 입력하세요');
			return false;		
		} else if (!pw.value) {
			alert('비밀번호를 입력하세요');
			return false;
			
		} else {
			var loginForm = document.querySelector('#login-form');
			loginForm.submit();
		}
				
		
	});		
    
    </script>

	<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	Kakao.init('a307b7e5ab5c3b75b216504564b520be'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	   	Kakao.Auth.login({
 	     success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
 	     fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
 	     Kakao.API.request({
 	       url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	</script> -->
</body>

</html>