<%@page import="com.azt.dto.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String appName = "azt-website"; %>
 <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumHaNaSonGeurSsi.css" rel="stylesheet">
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/<%= appName %>/static/assets/"
  data-template="vertical-menu-template-free"
>
<html>
<head>
 <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
<title>받은 메세지함</title>
<meta name="description" content="" />
   
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />
  
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />
</head>
<body>

<div class="layout-wrapper layout-content-navbar" style="font-family: 'NanumHaNaSonGeurSsi';">
      <div class="layout-container">        
        <jsp:include page="/WEB-INF/views/modules/layout-menu-mypage.jsp" />
        <div class="layout-page">
          <jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" /> 
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
          <div class="content-wrapper">
        
        <div class="row justify-content-center">
              <div class="card"  align="center" >
                
                <table class="table table-striped" >
                    <thead>
                       <tr>
                        <th>번 호</th>
                        <th>발신인</th>
                        <th>수신일자</th>
                        <th> 💌 </th>                               
                      </tr>
                    </thead>                    
                    
                    <tbody class="table-border-bottom-0">     
                 	<% List<Message> messageList = (List<Message>)request.getAttribute("messageList"); %>
                      
                      <% if (messageList == null || messageList.size() == 0) { %>
                      <tr><td colspan="4" style="font-size: 16pt; text-align: center;">받은 메세지가 없습니다.</td></tr>
                      <% } else { %>
	                      <tr>
	                      <% for(Message messages : messageList) { %> 
	                       <td><%=messages.getMessageNo() %></td>
	                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
	                         <%=messages.getSender() %></td>
	                        <td><%=messages.getSendDate() %></td>                                            
	                      	<td>
	                      	<% if (messages.isDeleted()) { %>
	                      	<span class="badge bg-label-danger"> 삭제된 메세지</span>
	                      	<% } else { %>
	                      	<a href="readMessage.action?messageno=<%=messages.getMessageNo()%>"><span class="badge bg-label-info">                      
	                      	메세지 열람하기
	                      	</span></a></td>
	                      	<% } %>
	                      </tr>                   
	                                              
	                     <% } %>                      
                      <% } %>
                    </tbody>
                  </table>
                    
              </div></div> 
         
  				  <%=request.getAttribute("pager")%>    
                    
            </div>
            
            
            
                
  			  </div>  
  			  
  			          
            <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	</div>
</body>
</html>