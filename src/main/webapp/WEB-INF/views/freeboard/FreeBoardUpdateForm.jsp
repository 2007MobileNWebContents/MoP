<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<h1 align="center">${freeBoard.fId }번게시글수정</h1>
	<br>
	<form action="freeBoardUpdate.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }"> 
		<input type="hidden" name="fId" value="${freeBoard.fId }"> 
		<input type="hidden" name="fOriginalFileName" value="${freeBoard.fOriginalFileName }">
     	 <input type="hidden" name="fRenameFileName" value="${freeBoard.fRenameFileName}">
     	 <input type="hidden" readonly name="fWriter" value="${freeBoard.fWriter }">
		<table align="center" id="tb">
			<tr>
				<tr>
				<td>제목</td>
				<td><input class="form-control" value="${freeBoard.fTitle }" type="text" name="fTitle" style="width:560px;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="fContent" id="editor">${freeBoard.fContent }</textarea></td>
				<script>CKEDITOR.replace(editor,{height : 300});</script>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input class="form-control" type="file" name="reloadFile"> <c:if
						test="${ !empty freeBoard.fOriginalFileName }">
						<br>현재 업로드한 파일: <a href="/resources/fuploadFiles/${freeBoard.fOriginalFileName }" download>
							${freeBoard.fOriginalFileName }"</a>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input class="btn btn-warning" type="submit" value="수정">&nbsp;
					<c:url var="fList" value="freeBoardList.do">
						<c:param name="page" value="${currentPage }"></c:param>
					</c:url> <a class="btn btn-primary" href="${fList }">목록으로</a> <a class="btn btn-danger" href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>