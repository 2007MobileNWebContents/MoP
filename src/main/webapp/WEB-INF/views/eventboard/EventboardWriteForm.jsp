<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<title>이벤트게시판 글 작성</title>
</head>
<body style="background-color:black;">
	<h1 align="center">게시글 작성하기</h1>
	<br>
	<form action="insertEventBoard.do" method="post"
		enctype="multipart/form-data">
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="eTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="eWriter" value="${loginUser.memberId }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="eContent"></textarea>
				<script>CKEDITOR.replace(eContent,{height : 300});</script>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input class="btn btn-primary" type="submit"value="등록하기"> &nbsp; 
				<input class="btn btn-warning" type="button" value="돌아가기" onclick="location.href='eventBoardList.do'">
			</tr>
		</table>
	</form>
</body>
</html>