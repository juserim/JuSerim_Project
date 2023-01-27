<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<div class="card d-flex align-items-center justify-content-center">
			<c:forEach var="comment" items="${ comments }">
			
				<tr id="tr${ comment.commentNo }">
					<hr><br>
			
	        		<div id='commentview${ comment.commentNo }'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				${ comment.writer } &nbsp;(${ comment.writeDate })
	                    		<br /><br />
		                    	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    		${ comment.content }
		                   		 </span>
		                   		 <br /><br />	
               		   <div style="text-align: right">                    	                    
			                <div style='display:${ loginuser.memberId eq comment.writer ? "block" : "none" }'>
		                    	<a class="editcomment" data-commentno='${ comment.commentNo }' href="javascript:">편집</a>
		                    	&nbsp;
		                    	<a class="deletecomment"
		                    	   href="javascript:"
		                    	   data-commentno="${ comment.commentNo }"
		                    	   >삭제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		                    </div>
	                    </div>	                   
	                </div>
	                <div id='commentedit${ comment.commentNo }' style="display: none">
	                	${ comment.writer } &nbsp;(${ comment.writeDate })						
						<form id="updateform${ comment.commentNo }">
						<input type="hidden" name="commentno" value="${ comment.commentNo }" />
						<textarea name="content" style="width: 800px" rows="3" 
							maxlength="200">${ comment.content }</textarea>
						</form>
						<div style="text-align: right">   
							<a class="updatecomment" href="javascript:" data-commentno="${ comment.commentNo }">수정</a> 
							&nbsp; 
							<a class="cancel" data-commentno="${ comment.commentNo }" href="javascript:">
							취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</div>
					</div>      
	        	</tr>	        	
   		</c:forEach>
    </div>
 
  
    
   
    
            
