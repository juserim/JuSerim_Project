<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    	 
<% String appName = "azt-website"; %>
        
        <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumHaNaSonGeurSsi.css" rel="stylesheet">
        
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" >
        
            <a href="/azt-website/home.action" class="app-brand-link">
            <img src="/azt-website/mainimage/azt-icon.png" width="250px">
              <!-- <span class="app-brand-text demo menu-text fw-bolder ms-2">아: 지트🐾</span> -->
            </a>


          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1" style="font-family: 'NanumHaNaSonGeurSsi';">
            <!-- Dashboard -->
            <li class="menu-item active" >
              <a href="/azt-website/home.action" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics" style="font-size: 20pt">A:zt Home</div>
              </a>
            </li>

            <!-- Layouts -->
                 
                <li class="menu-item">
                  <a href="/azt-website/account/mypage.action?memberId=${ loginuser.memberId }&owner=${ owner }" class="menu-link">
                    <div data-i18n="Without navbar" style="font-size: 20pt">마이페이지</div>
                  </a>
                </li>
                         <li class="menu-item">
                  <a href="#" class="menu-link">
                    <div data-i18n="Without navbar" style="font-size: 20pt">회원탈퇴하기</div>
                  </a>
                        <li class="menu-item">
                  <a href="/azt-website/message/messageList.action?memberId=${ loginuser.memberId }" class="menu-link">
                    <div data-i18n="Without navbar" style="font-size: 20pt">받은 메세지</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="/azt-website/message/sendMessage.action?memberId=${ loginuser.memberId }" class="menu-link">
                    <div data-i18n="Without navbar" style="font-size: 20pt">메세지 보내기</div>
                  </a>
                </li>
                
          </ul>
           <img src="/azt-website/mainimage/layout.jpg" width="150">
        </aside>
        <!-- / Menu -->