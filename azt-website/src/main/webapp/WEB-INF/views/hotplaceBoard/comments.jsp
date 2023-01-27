<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


			
              <div class="card-header"> <h5 class="card-title text-white">Comment</h5></div>
              			                    
              <div class="card-body">
                            
               <c:forEach var="comment" items="${ comments }">
               
              	<div class="divider text-start" id="div${ comment.commentNo }">
                	<div class="divider-text" id="commentview${ comment.commentNo }" > 
                		🗨️&nbsp;&nbsp;${ comment.writer }님의 댓글입니다.
                		  &nbsp;&nbsp;&nbsp; ${ comment.writeDate }
                	</div>                	
                </div>
                
                 	<p class="card-text">" ${ comment.content } "</p>
                 	
                 	 <div style='display:${ loginuser.memberId eq comment.writer ? "block" : "none" }'>
                 	<a style="font-size: 8pt;"
                 	   class="editcomment badge bg-label-info me-1"
                 	   href="javascript:"
                 	   data-commentno='${ comment.commentNo }'>
                 		수정</a>&nbsp;
                 		
                    <a style="font-size: 8pt;"
                   	   class="deletecomment badge bg-label-info me-1" 
	                   href="javascript:"
	              	   data-commentno="${ comment.commentNo }">
                   	    삭제</a>
                   	 <hr>   
               		</div>
               		
               		
               		<%-- 댓글 편집하기 --%>
               		<form  id="updateform${ comment.commentNo }">
                       <div id='commentedit${ comment.commentNo }' style="display: none">	                        
	                       <textarea style="width: 1340px; resize: none; border-color: white;"  
	                          name="content" id="comment-content"	                         
	                          aria-describedby="button-addon2">${ comment.content }</textarea>	                        
	                        <input type="hidden" name="writer" value="${ comment.writer }" >	                       
	                        <input type="hidden" name="commentno" value="${ comment.commentNo }">
	                        <br>
	                        <a class="badge bg-label-info me-1 updatecomment" 
                        		type="button" data-commentno="${ comment.commentNo }"
                        		href="javascript:">수정</a>
	                        <a class="badge bg-label-info me-1 cancel" 
	                        	type="button" data-commentno="${ comment.commentNo }"
	                        	href="javascript:">취소</a>		
	                         
                     </div>
                   </form>
               		
               		
               </c:forEach>	                     	      
             </div>
         
           	
        