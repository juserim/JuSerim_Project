<%@page import="com.azt.dto.HotplaceBoard"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<% String appName = "azt-website"; %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

<!DOCTYPE html>

<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/<%= appName %>/static/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Hot Place Edit</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/<%= appName %>/static/assets/img/favicon/favicon.ico" />

    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

    <jsp:include page="/WEB-INF/views/modules/common-js-head.jsp" />
    
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        
        <jsp:include page="/WEB-INF/views/modules/layout-menu.jsp" />
        
        <!-- Layout container -->
        <div class="layout-page">
          
          <jsp:include page="/WEB-INF/views/modules/layout-navbar.jsp" />
          <br><br><br><br><br><br><br>
          <!-- Content wrapper -->
          <div class="content-wrapper">
           <!-- Content -->
           
            <div class="container-xxl flex-grow-1 container-p-y">
             <h1 class="display-2 mb-0" style="font-family: 'Lobster', cursive;">Edit✒️</h1><br>   
             <div class="row">
                <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">게시글 수정하기</h5>
                    </div>   
                    
                    <div class="card-body">
                      <form
	                     id="editform"
			        	 action="hotplaceEdit.action" 
			        	 method="post">
			        	 <% HotplaceBoard board = (HotplaceBoard)request.getAttribute("board"); %>
                         
                         <div class="mb-3">
                        <label for="exampleFormControlSelect1" class="form-label">지역</label>
                        <select name="loc" class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected><%=board.getLoc() %></option>
                          <option value="서울특별시">서울특별시</option>
                          <option value="청주시">청주시</option>
                          <option value="대전광역시">대전광역시</option>
                          <option value="부산광역시">부산광역시</option>
                          <option value="대구광역시">대구광역시</option>
                          <option value="인천광역시">인천광역시</option>
                          <option value="광주광역시">광주광역시</option>
                          <option value="울산광역시">울산광역시</option>
                          <option value="세종특별자치시">세종특별자치시</option>
                          <option value="제주특별자치시도">제주특별자치시도</option>
                        </select>
                           <div class="mb-3">
                        <label for="exampleFormControlSelect1" class="form-label">매장분류</label>
                        <select name="place" class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected><%=board.getPlace() %></option>
                          <option value="카페">카페</option>
                          <option value="식당">식당</option>
                          <option value="글램핑&캠핑">글램핑&캠핑</option>
                        </select>
                      </div>
                      </div>
                     
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">제 목</label>
                          <div class="col-sm-10">
                            <input type="text" name="title"
                            class="form-control" id="basic-default-name" value="<%=board.getTitle() %>" />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-company">
                          <span class="badge bg-label-dark" ><input type="hidden" name="boardno" value="<%=board.getBoardNo()%>"><%=board.getBoardNo() %></span>번 게시글 &nbsp;
                          작성자&nbsp;&nbsp;<span class="badge bg-label-warning"> <%=board.getWriter() %></span></label>
                         
                          <div class="col-sm-10">
                            <input
                              type="hidden"
                              name="writer"
                              class="form-control"
                              id="basic-default-company"
                              value="a"
                            />
                          </div>
                        </div> 
                                         
                    
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">내용</label>
                          <div class="col-sm-10">
                            <textarea
                              name="content"
                              id="basic-default-message"
                              class="form-control"
                              aria-describedby="basic-icon-default-message2"><%=board.getContent()%></textarea>
                          </div>
                        </div>
                        <div class="row justify-content-end">
                          <div class="col-sm-10">                           
                             <div class="demo-inline-spacing">
                             <a id="edit" href="javascript:" 
					         class="btn btn-outline-primary">Send</a> 
					         <a href='javascript:history.back()' 
					         class="btn btn-outline-primary">Cancle</a>                            
                          </div>
                        </div></div>                        
                      </form>
                    </div></div></div></div></div>
            <!-- / Content -->


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
	
	<script type="text/javascript">
		var edit = document.querySelector("#edit");
		edit.addEventListener("click", function(event) {
		event.preventDefault();
		var editForm = document.querySelector("#editform");
		editForm.submit();			
	});				
	</script>

  </body>
</html>


