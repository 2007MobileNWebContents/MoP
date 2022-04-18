<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성</title>
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
	<jsp:include page="../common/sidenav.jsp"></jsp:include>
	<h1 align="center" style="position: relative; top: 100px;">게시글 작성하기</h1>
	<br>
	<form action="insertFreeBoard.do" method="post"
		enctype="multipart/form-data" style="position: relative; top: 100px;">
		<input type="hidden" name="fWriter" value="${loginMember.memberId }">
		<table align="center" id="tb">
			<tr>
				<td><b>제목</b></td>
				<td><input class="form-control" type="text" name="fTitle" style="width:560px;"></td>
			</tr>
<!-- 			<tr> -->
				<td><b>내용</b></td>
				<td><textarea  name="fContent" id="editor"></textarea></td>
				<script>CKEDITOR.replace(editor,{height : 300});</script>
			</tr>
			<tr>
				<td style="padding-right:10px;"><b>첨부파일 </b></td>
				<td><input class="form-control" type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input class="btn btn-primary" type="submit"value="등록하기"> &nbsp; 
				<input class="btn btn-warning" type="button" value="돌아가기" onclick="location.href='freeBoardList.do'">
			</tr>
		</table>
	</form>
</body>

</html>