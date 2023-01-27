<%@page import="com.azt.dto.Member"%>
<%@page import="com.azt.dto.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>Send Message</title>
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
                      <h3 class="mb-0">메세지 보내기</h3>
                      <small class="text-muted float-end">Send Message</small>
                    </div>
                    <div class="card-body" style="font-size: 14pt;">
                      <form
                       	 id="sendform"
			        	 action="sendMessage.action" 
			        	 method="post"
                      >
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">발신인</label>
                          <input 
                          type="hidden" class="form-control" id="sender" name="sender" 
                          value="${ loginuser.memberId }"  />
                          ${ loginuser.memberId }
                        </div>
                        
                        <label for="exampleDataList" class="form-label">수신인을 입력하세요</label>
                        <input
                          class="form-control"
                          list="datalistOptions"
                          id="receiver"
                          name="receiver"
                          placeholder="Type to search..."
                        />
                        <datalist id="datalistOptions">
                        <%List<Member> members = (List<Member>)request.getAttribute("members"); %>
                          <%for (Member memberid : members) { %>
                          <option value="<%=memberid.getMemberId()%>"></option>
                        	<% } %>
                        </datalist>
                     
                      
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">Message</label>
                          <textarea
                            id="message"
                            name="message"
                            class="form-control"
                            placeholder="메시지를 입력하세요"
                            style="height: 380px; font-size: 16pt;"
                          ></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" id="send-btn">Send Message</button>
                      </form>  
                    </div>
                    
                  </div>
                </div>   
                
                 <div class="col-xl">
                  <div class="card mb-4" style="height: 680px">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">보낸 메세지</h5>
                      <small class="text-muted float-end">Sended Message</small>                      
                      
                    </div>                 
               		 <table class="table table-striped" >
                    <thead>
                       <tr>
                        <th>번 호</th>
                        <th>메시지 수신인</th>
                        <th>메시지 제목</th>                              
                      </tr>
                    </thead>                    
                    
                    <tbody class="table-border-bottom-0">     
                 	<% List<Message> messageList = (List<Message>)request.getAttribute("messageList"); %>
                      <% if (messageList == null || messageList.size() == 0) { %>
                      		 <tr><td colspan="3" style="font-size: 16pt; text-align: center;">보낸 메세지가 없습니다.</td></tr>
                      <% } else { %>                      
		                      <tr>
		                      <% for (Message messages : messageList) { %>
		                    	<td><%= messages.getMessageNo() %></td>
		                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
		                         <%= messages.getReceiver() %></td>
		                        <td>
								<% if (messages.isDeleted()) { %>
		                      	<span class="badge bg-label-danger"> 삭제된 메세지</span>
		                      	<% } else { %>
		                      	<a href="readMessage2.action?messageno=<%=messages.getMessageNo()%>"><span class="badge bg-label-info">                      
		                      	메세지 열람하기
		                      	</span></a>
								</td>
								<% } %>                        
		                      </tr>
		                      
		                      <% } %>
                       <% } %>
                    </tbody>
                  </table>  
             		 <%=request.getAttribute("pager")%>    
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
	
		var sendBtn = document.querySelector('#send-btn');
		sendBtn.addEventListener('click', function (event) {
		event.preventDefault();
		
			var receiver = document.querySelector('#receiver');
			if(!receiver.value) {
				alert('메시지 수신자 아이디를 입력하세요');
				return false;
			} else {
				confirm('메세지를 전송할까요?');
				var sendForm = document.querySelector('#sendform');
				sendForm.submit();
			}
			
		});
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>