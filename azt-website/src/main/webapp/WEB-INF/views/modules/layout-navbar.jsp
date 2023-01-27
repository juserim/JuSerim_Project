<%@page import="com.azt.dto.DogMember"%>
<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<%@ page import="com.azt.dao.MemberDao" %>
<%@ page import="com.azt.dto.Member" %>    	 
<% String appName = "azt-website"; %>

			<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumHaNaSonGeurSsi.css" rel="stylesheet">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar" style="font-family: 'NanumHaNaSonGeurSsi'; font-size: 20pt;"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>
 			<% Member member = (Member)session.getAttribute("loginuser"); %>
            
	          	
	          		<% if (member == null) { %>
	          		<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
	          		Welcome. 반려견과 함께 소통하는 '아지트' 커뮤니티 방문을 환영합니다. 
	              	<ul class="navbar-nav flex-row align-items-center ms-auto">           
	                <!-- User -->                
	                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
	                    
	                      <img src="/<%= appName %>/static/assets/img/avatars/login-icon.jpg" alt class="w-px-40 h-auto rounded-circle" />
	                
	                  </a>
	                  <% } else { %>
	                  <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
	                  💗 Welcome.&nbsp;&nbsp; <%=member.getMemberId() %>님 '아지트' 커뮤니티 접속을 환영합니다. 💗
	              	<ul class="navbar-nav flex-row align-items-center ms-auto">           
	                <!-- User -->                
	                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
	                    <div class="avatar avatar-online">
	                      <img src="/<%= appName %>/static/assets/img/avatars/register-icon.jpg" alt class="w-px-40 h-auto rounded-circle" />
	                    </div>
	                  </a>
	                  <% } %>
	                
                  
                  
                  
                  <ul class="dropdown-menu dropdown-menu-end">                  
                  
                    <% if (member != null) { %>
                    <li>
                      <a class="dropdown-item" href="javascript:">                        
                        <span class="fw-semibold d-block"><%= member.getMemberId() %></span>
                        <small class="text-muted"><%= member.getUserType() %></small>                        
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>


                  	<% DogMember dogMember = (DogMember)request.getAttribute("dogmember"); %>                  	               		      
               		  <li>        
               		  <input type="hidden" class="form-control" name="owner" value="<%=request.getAttribute("owner")%>" />  
                       	<a class="dropdown-item" href="/azt-website/account/mypage.action?memberId=<%= member.getMemberId()%>&owner=<%= member.getMemberId()%>">                         
                      		<i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>                    
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
					<% } %>
					
					
                    <% if(member == null) { // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다 %>
                    <li>
                      <a class="dropdown-item" href="/azt-website/account/login.action">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log In</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="/azt-website/account/register.action">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Register</span>
                      </a>
                    </li>
                    <% } else { // 로그인이 되어있는 사람만 볼수 있는 화면 %>
                    <li>
                      <a class="dropdown-item" href="/azt-website/account/logout.action">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                    <% } %>
                  </ul>
               
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->