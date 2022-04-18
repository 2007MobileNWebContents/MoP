<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시판 상세보기</title>
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

</head>
<body>
	<h1 align="center">게시글 상세보기</h1>
	<br>
	<div align="center">
	<table class="table table-striped" style="width:800px; height:500px;">
	

		<tr align="center" valign="middle">
			<th colspan="2">${eventboard.eId }번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${eventboard.eTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${eventboard.eWriter }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${eventboard.eContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
			<c:if test="${ !empty eventboard.eOriginalfilename }">
					<a href="/resources/euploadFiles/${eventboard.fRenameFileName }"download>
					${eventboard.eOriginalfilename }
					</a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			
			<c:url var="eDelete" value="eventBoardDelete.do">
			<c:param name="eId" value="${eventboard.eId }"></c:param>
			</c:url>
			<c:url var="eList" value="eventBoardList.do">
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="eUpdate" value="EventBoardUpdateView.do">
			<c:param name="eId" value="${eventboard.eId }"></c:param>
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:if test="${loginMember.memberId eq 'admin' }">
		<input type="button" class="btn btn-warning" onclick="location.href='${eUpdate}'" value="수정하기">
				<input type="button" class="btn btn-danger" onclick="location.href='${eDelete}'" value="삭제하기">
				<input type="button" class="btn btn-primary" onclick="location.href='${eList}'" value="목록으로">
				</c:if>
				
		
			<c:if test="${loginMember.memberId ne 'admin' }">
			<input type="button" class="btn btn-primary" onclick="location.href='${eList}'" value="목록으로">
			</c:if>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>