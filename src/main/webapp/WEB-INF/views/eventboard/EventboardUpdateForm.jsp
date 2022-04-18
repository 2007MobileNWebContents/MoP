<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시판 수정</title>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
   <h1 align="center">${eventBoard.eId }번게시글수정</h1>
   <br>
   <form action="eventBoardUpdate.do" method="post"
      enctype="multipart/form-data">
      <input type="hidden" name="page" value="${currentPage }"> 
      <input type="hidden" name="eId" value="${eventBoard.eId }"> 
      <input type="hidden" name="eOriginalfilename" value="${eventBoard.eOriginalfilename }">
        
         <input type="hidden" readonly name="eWriter" value="${eventBoard.eWriter }">
      <table align="center" id="tb">
         <tr>
            <tr>
            <td>제목</td>
            <td><input class="form-control" value="${eventBoard.eTitle }" type="text" name="eTitle" style="width:560px;"></td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea cols="50" rows="7" name="eContent" id="editor">${eventBoard.eContent }</textarea></td>
            <script>CKEDITOR.replace(editor,{height : 300});</script>
         </tr>
         <tr>
            <td>첨부파일</td>
            <td><input class="form-control" type="file" name="reloadFile"> <c:if
                  test="${ !empty eventBoard.eOriginalfilename }">
                  <br>현재 업로드한 파일: <a href="/resources/fuploadFiles/${eventBoard.eOriginalfilename }" download>
                     ${eventBoard.eOriginalfilename }"</a>
               </c:if></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input class="btn btn-warning" type="submit" value="수정">&nbsp;
               <c:url var="eList" value="eventBoardList.do">
                  <c:param name="page" value="${currentPage }"></c:param>
               </c:url> <a class="btn btn-primary" href="${eList }">목록으로</a> <a class="btn btn-danger" href="javascript:history.go(-1);">이전페이지로</a>
            </td>
         </tr>
      </table>
   </form>
</body>