<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>A:zt - Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="/azt-website/static/assets/css/account.css" />

</head>
    <div class="container">    	 
    		<div class="row justify-content-center">
    		<a href="/azt-website/home.action" class="app-brand-link">
            <img src="/azt-website/mainimage/azt-icon.png" width="400px"> </a></div>
	
        <div class="card o-hidden border-0 shadow-lg my-5">
        
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>

                            <form class="user" action="register.action" method="post" id="register-form">
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" name="memberId" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="회원아이디">
                                    </div>

                                </div>
                                 <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" name="passwd" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="패스워드">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" name="confirm" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="패스워드 확인">
                                    </div>
                                  </div>
                                    
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
	                                    <input type="email" name="email" class="form-control form-control-user" id="exampleInputEmail"
	                                        placeholder="이메일">
	                                </div>
	                            </div>
	                            
	                            
	                            <label><input type="checkbox" id="isPetOwner" value="애완견 있음" name="check"> 애완견 있음</label>
      							 <div id="pet-info" style="display:none">
                                 <div class="form-group row"> <!--강아지 정보-->
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                       <!--  <input type="text" name="owner" class="form-control form-control-user"
                                            id="dogowner" placeholder="주인"> -->
                                    </div>
                                    <div class="col-sm-12">
                                        <input type="text" name="dogname" class="form-control form-control-user"
                                            id="dogname" placeholder="강아지 이름">
                                    </div>
                                  </div>     
                                  
                                  <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="breed" class="form-control form-control-user"
                                            id="dogbreed" placeholder="종">
                                    </div>
                                    <div class="col-sm-6">
                                        <select name="surgery" id="dogsurgery" class="form-control" placeholder="수술여부" title="수술여부">
                                            <option value="0">중성화 x</option>
                                            <option value="1">중성화 o</option>
                                        </select>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="loc" class="form-control form-control-user"
                                            id="location" placeholder="지역">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" name="weight" class="form-control form-control-user"
                                            id="dogweight" placeholder="몸무게">
                                    </div>
                                  </div>  
                                      </div>        
                                 <div class="buttons">
		        			<input id="register" type="submit" value="Register Account" class="btn btn-primary btn-user btn-block" />
		        			<input id="cancel" type="button" value="Register cancel" class="btn btn-primary btn-user btn-block" />
		       				 </div>
		       				 <!-- 
                                <hr>
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with kakao
                                </a> -->
                                
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="#">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="/azt-website/account/login.action">Already have an account? Login!</a>
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
    var petOwnerChk = document.querySelector("#isPetOwner");
    petOwnerChk.addEventListener("click", function(event) {
   		var petInfoDiv = document.querySelector("#pet-info");
   		petInfoDiv.style.display = event.target.checked ? "block" : "none"; 

    });
    
    var register = document.querySelector('#register');
    register.addEventListener('click', function(event) {
    	event.preventDefault();
    	
    	var id = document.querySelector('#exampleFirstName');
    	var pw = document.querySelector('#exampleInputPassword');
    	var pw2 = document.querySelector('#exampleRepeatPassword');
    	
    	if (!id.value) {
    		alert('아이디를 입력하세요.');
    		return false;
    	} else if (!pw.value || !pw2.value) {
    		alert('비밀번호를 입력하세요.');
    		return false;
    	} else if (pw.value != pw2.value) {
    		alert('비밀번호가 일치하지 않습니다.')
    		return false;
    	} else {
    		var registerForm = document.querySelector('#register-form');
    		registerForm.submit();
    	}
		
	});
    
    

    </script>

</body>

</html>