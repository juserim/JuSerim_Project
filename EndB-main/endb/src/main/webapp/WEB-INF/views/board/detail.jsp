<%@page import="com.endb.dto.BoardAttach" %>
<%@page import="com.endb.dto.User" %>
<%@page import="com.endb.dto.Room" %>
<%@ page language="java"
         contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html>
<head>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>글쓰기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="Stylesheet" href="/demoweb/resources/styles/default.css"/>
    <link rel="Stylesheet" href="/demoweb/resources/styles/input2.css"/>
    <style>
        table {
            width: 100%;
            border: 1px solid #444444;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #444444;
            padding: 10px;
        }

        td {
            width: 80%;
            max-width: 600px;
            word-break: break-word;
        }

        th {
            width: 20%;
        }
    </style>
</head>
<body>

<div id="pageContainer">

    <jsp:include page="/WEB-INF/views/modules/header.jsp"/>

    <div style="padding-top:25px;text-align:center">
        <div id="inputcontent">
            <div id="inputmain">
                <div class="inputsubtitle"></div>
                <h2 class="tm-text-primary mb-5">게시글 내용</h2>
                <c:if test="${board.id eq sessionScope.loginuser.userId}">
                    <div style="display: flex;
                         justify-content: flex-end;
                         margin: 20px;">
                        <a class="btn btn-primary" href="edit?boardno=${ board.room_id }&pageNo=1" style="margin:2px">수정</a>
                        <button id="delete-btn" class="btn btn-danger" style="margin:2px">삭제</button>
                    </div>
                </c:if>
               
				
                <table>
                    <tr>
                        <th>제목</th>
                        <td>${ board.title }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${ board.id }</td>
                    </tr>
                    
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <c:forEach var="file" items="${ board.files }">
                                <a href="download?attachno=${ file.attachNo }">
                                        ${ file.userFileName }
                                </a>
                                &nbsp;|&nbsp;
                                <a href="download2/${ file.attachNo }">
                                        ${ file.userFileName }
                                </a>
                      
                                <br>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        
                        <td style="height:200px;vertical-align:top">
                            <% String enter2 = "\r\n"; %>
                            <c:set var="enter" value="
"/>
                            ${ fn:replace(board.content, enter, '<br>') }
                        </td>
                    </tr>
                </table>
				
                <!-- <div class="buttons">

                    [&nbsp;<a href='/endb/home'>목록보기</a>&nbsp;]
                </div> -->
                <div class="form-group tm-text-right">
					<a href='/endb/home'><button class="btn btn-primary" style="float: left; margin:2px">목록보기</button></a>

					<button type="button" id="add-comment-btn" class="btn btn-primary" style="float: right;margin:2px">리뷰</button>
					<a href="/endb/booking/reservation?roomid=${ board.room_id}&pageNo=${pageNo}">
						<button class="btn btn-primary" style="float: right;margin:2px">예약하기</button>
					</a>

				</div>
            </div>
        </div>
        <br><br>
        <!-- comment 쓰기 영역 -->
        <!-- <div>
            <button id="add-comment-btn" type="button"
                    class="btn btn-outline-primary btn-sm">리뷰
            </button>
        </div -->
        <!-- / comment 쓰기 영역 -->
<!-- 	<div>
         <button id="add-comment-btn" type="button" 
               class="btn btn-outline-primary btn-sm">리뷰</button>
      </div>  -->  
	
        <!-- comment 표시 영역 -->
        <br>
        <hr style="width:800px;margin:0 auto">
        <br>
        <table id="comment-list" style="width:800px;margin:0 auto">
            <c:forEach var="comment" items="${comment}">
                <tr>
                    <th>유저 id : ${comment.id}</th>
                    <td>${comment.content}
                    </td>
                    <c:if test="${comment.id eq sessionScope.loginuser.userId}">
                        <th>
                            <div style="display: flex;
                         justify-content: flex-end;">
                                <button id="editComment" class="btn btn-primary" data-content="${comment.content}"
                                        data-id="${comment.board_no}">수정
                                </button>
                                <a href="deleteComment?commentNo=${comment.board_no}&boardNo=${board.room_id}"
                                   class="btn btn-danger">삭제</a>
                            </div>
                        </th>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        <!-- / comment 표시 영역 -->
    </div>
</div>
<br><br><br><br><br>

<!-- Modal -->
<div id="comment-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="comment-modal-label"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="comment-modal-label">리뷰 쓰기</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="comment-form">
                    <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control"
                                  name='content' id='modal-content'></textarea>
                    </div>
                    <input type="hidden" name='boardno' value='${ board.room_id }'>
                    <input type="hidden" name='commentno'>
                    <input type="hidden" name='action'><!-- 댓글 or 댓글의 댓글 -->
                </form>
            </div>
            <div class="modal-footer">
                <button id='modalRegisterBtn' type="button" class="btn btn-success btn-sm">댓글쓰기</button>
                <button type="button" class="modalCloseBtn btn btn-success btn-sm">취소</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="comment-modal-label"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModal-label">댓글 수정</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editModal-form">
                    <div class="form-group">
                        <label>댓글</label>
                        <textarea class="form-control"
                                  name='content' id='editModal-conetent'></textarea>
                    </div>
                    <input type="hidden" id="commentNo" name='commentNo'>
                    <input type="hidden" name='action'><!-- 댓글 or 댓글의 댓글 -->
                </form>
            </div>
            <div class="modal-footer">
                <button id='editModalSaveBtn' type="button" class="btn btn-success btn-sm">수정하기</button>
                <button type="button" class="modalCloseBtn btn btn-success btn-sm">취소</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

    $(function () { // 수신된 html의 dom객체 구성 완료되었을 때 호출 ( 화면 준비 완료 )
        // $('#delete-btn').on('click', function(event)) {
        $(document).on('click', '#delete-btn', function () {
            event.preventDefault();
            var ok = confirm('삭제할까요?');
            if (ok) {
                location.href = 'delete?boardno=${ board.room_id }&pageNo=1';
            }

        });


        $(document).on('click', '#editComment', function () {
            $('#editModal-conetent').val(this.dataset.content);
            $('#commentNo').val(this.dataset.id);
            $('#editModal').modal('show'); // show modal
        });


        $('#editModalSaveBtn').on('click', function (event) {
            event.preventDefault();

            var content = $('#editModal-conetent').val(); // val() == value 속성
            if (content.length == 0) {
                alert('내용을 작성하세요');
                return;
            }
            var formData = $('#editModal-form').serialize();
            // var formData = $('#comment-form').serializeArray();
            // alert(formData);
            // return;

            $.ajax({
                "url": "comment-edit",
                "method": "post",
                "async": true,
                "data": formData, // boardno=1&writer=imauser1&content=test
                "success": function (data, status, xhr) {
                    if (data === "success") {
                        $('#editModal').modal('hide');

                        // 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
                        location.reload();
                    } else {
                        alert('댓글 수정 실패');
                    }
                },
                "error": function (xhr, status, err) {
                    alert('댓글 쓰는 중 오류 발생');
                }
            });
        });


        ///////////////////////////////////////////////////

        // comment 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)


        $('#add-comment-btn').on('click', function (event) {
        	
        	event.preventDefault();
        	
            $('#modal-content').val("");
            $('#comment-modal').modal('show'); // show modal
        });

        $('.modalCloseBtn').on('click', function (event) {
            $('.modal').modal('hide'); // hide modal
        });

        $('#modalRegisterBtn').on('click', function (event) {
            event.preventDefault();

            var content = $('#modal-content').val(); // val() == value 속성
            if (content.length == 0) {
                alert('내용을 작성하세요');
                return;
            }
            var formData = $('#comment-form').serialize();
            // var formData = $('#comment-form').serializeArray();
            // alert(formData);
            // return;

            $.ajax({
                "url": "comment-write",
                "method": "post",
                "async": true,
                "data": formData, // boardno=1&writer=imauser1&content=test
                "success": function (data, status, xhr) {
                    if (data === "success") {
                        $('#comment-modal').modal('hide');

                        // 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
                        location.reload();
                    } else {
                        alert('댓글 쓰기 실패');
                    }
                },
                "error": function (xhr, status, err) {
                    alert('댓글 쓰는 중 오류 발생');
                }
            });
        });

        // $('.deletecomment').on('click', function(event) { // 현재 존재하는 .deletecomment
        $('#comment-list').on('click', '.deletecomment', function (event) { // 현재 + 미래에 존재하는 .deletecomment
            // 어느 댓글을 삭제할까요? --> 삭제할 댓글 번호는 무엇?
            var commentNo = $(this).attr("data-commentno"); // this : 이벤트 발생 객체 (여기서는 <a>)
            var ok = confirm(commentNo + "번 댓글을 삭제할까요?");
            if (!ok) {
                return;
            }

            $.ajax({
                "url": "comment-delete",
                "method": "get",
                "async": true,
                "data": "commentno=" + commentNo,
                "dataType": "text",
                "success": function (data, status, xhr) {
                    // 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)

                },
                "error": function (xhr, status, err) {
                    alert('삭제 실패');
                }
            });
        });

        function toggleEditDisplay(commentNo, isEdit) {
            $('#commentview' + commentNo).css('display', isEdit ? 'none' : 'block');
            $('#commentedit' + commentNo).css('display', isEdit ? 'block' : 'none');
        }

        var currentEditCommentNo = null;
        $('#comment-list').on('click', '.editcomment', function (event) { // 현재 + 미래에 존재하는 .deletecomment
            var commentNo = $(this).attr("data-commentno");
            if (currentEditCommentNo) {
                toggleEditDisplay(currentEditCommentNo, false);
            }
            currentEditCommentNo = commentNo;
            toggleEditDisplay(commentNo, true);
        });

        $('#comment-list').on('click', '.cancel', function (event) { // 현재 + 미래에 존재하는 .deletecomment
            var commentNo = $(this).attr("data-commentno");
            toggleEditDisplay(commentNo, false);
            currentEditCommentNo = null;
        });

        $('#comment-list').on('click', '.updatecomment', function (event) { // 현재 + 미래에 존재하는 .deletecomment
            var commentNo = $(this).attr("data-commentno");
            var formData = $('#updateform' + commentNo).serialize();
            $.ajax({
                "url": "comment-update",
                "method": "post",
                "async": true,
                "data": formData,
                "dataType": "text",
                "success": function (data, status, xhr) {
                    // 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)

                },
                "error": function (xhr, status, err) {
                    alert('수정 실패');
                }

            });


        });

    });

</script>

</body>
</html>















