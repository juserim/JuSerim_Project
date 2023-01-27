<%@page import="com.mysql.cj.Messages"%>
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
<title>Read Message</title>
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
        
        <div class="row">
        	
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <% Message message =(Message)request.getAttribute("messages"); %>
                      <h3 class="mb-0"><%=message.getSender() %>님의 메세지입니다.</h3>
                      <small class="text-muted float-end">Read Message</small>
                    </div>
                    <div class="card-body">
                      
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">메세지 수신일</label>
                          <%=message.getSendDate() %>                    
                        </div>                     
                      
                        <div class="mb-3" style="font-size: 18pt;">
                          <label class="form-label" for="basic-default-message">Message</label>
                          <br><%=message.getMessage().replace("\r\n","<br>") %>
                          
                       
                        </div>
                        <a href="messageList.action" class="btn btn-primary">Message List</a>
                        <a href="javascript:" class="btn btn-primary" 
                           id="deleted-btn" name="deleted">Deleted Message</a>
                    
                    </div>
                    
                  </div>
                </div>   
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
	
	
	
	
	
	<script type="text/javascript">
	var deletedBtn = document.querySelector('#deleted-btn');
	deletedBtn.addEventListener('click', function(event) {
		event.preventDefault();
		var ok = confirm('삭제된 메세지는 복구 할 수 없습니다. 삭제하겠습니까?')
		if (ok) {
			location.href = "messageDelete.action?messageno=<%=message.getMessageNo()%>";
		}
		
	});
	
	</script>
</body>
</html>