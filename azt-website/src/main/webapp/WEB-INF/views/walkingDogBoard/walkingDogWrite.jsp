<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% String appName = "azt-website"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

<style type="text/css">

	

</style>

</head>
<body>


    <jsp:include page="/WEB-INF/views/modules/layout-menu.jsp" />

  
<div class="writeContainer">
   <form id="writeform" action="write.action" 
		        	method="post"
		        	enctype="multipart/form-data">
		   

         <div class="col-md-6">
                  <div class="card mb-4">
                    <h5 class="card-header">�Խñ� �ۼ�</h5>
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">���ۼ���</label>
                        <input
                          type="email"
                          class="form-control"
                          id="exampleFormControlInput1"
                          placeholder="name@example.com"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlReadOnlyInput1" class="form-label">������ �̸�</label>
                        <input
                          class="form-control"
                          type="text"
                          id="exampleFormControlReadOnlyInput1"
                          placeholder="������ �̸��� �Է��ϼ���"
                         
                        />
                      </div>
                      
                       <div class="mb-3">
                        <label for="exampleFormControlReadOnlyInput1" class="form-label">������</label>
                        <input
                          class="form-control"
                          type="text"
                          id="exampleFormControlReadOnlyInput1"
                          placeholder="Readonly input here..."
                         
                        />
                      </div>
  
  						<div class="mb-3">
                        <label for="exampleFormControlReadOnlyInput1" class="form-label">����</label>
                        <input
                          class="form-control"
                          type="text"
                          id="exampleFormControlReadOnlyInput1"
                          placeholder="Readonly input here..."
                         
                        />
                      </div>                  
                  
                      <div class="mb-3">
                        <label for="exampleDataList" class="form-label">��ġ</label>
                        <input
                          class="form-control"
                          list="datalistOptions"
                          id="exampleDataList"
                          placeholder="Type to search..."
                        />
                        <datalist id="datalistOptions">
                          <option value="����"></option>
                          <option value="��⵵"></option>
                          <option value="Seattle"></option>
                          <option value="Los Angeles"></option>
                          <option value="Chicago"></option>
                        </datalist>
                      </div>
                    
                      <div>
                        <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
                <button type="button" class="btn btn-primary">�۾���</button>
                 <button type="button" class="btn btn-secondary" >���</button>
                
                  </form>
             </div>
       
               
</body>
</html>