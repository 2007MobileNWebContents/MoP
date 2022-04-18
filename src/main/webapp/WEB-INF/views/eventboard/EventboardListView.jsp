<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>이벤트게시판 리스트</title>
</head>
<body style="background-color:black;">
<jsp:include page="../common/sidenav.jsp"></jsp:include>
	<h1 align="center">게시글 목록</h1>
	<div class="container">
		<table class="table table-striped" align="center" border="0"
			cellspacing="0" width="700">
			<tr>
				<th style="color:black;">번호</th>
				<th style="color:black;">제목</th>
				<th style="color:black;">작성자</th>
				<th style="color:black;">날짜</th>
				<th style="color:black;">조회수</th>
			</tr>

			<c:forEach items="${eList }" var="eventBoard">
				<tr style="color:white;">
					<td>${eventBoard.eId }</td>
					<td><c:url var="eDetail" value="eventBoardDetail.do">
							<c:param name="eId" value="${eventBoard.eId }"></c:param>
							<c:param name="page" value="${pi.currentPage }"></c:param>
						</c:url> <a href="${eDetail}">${eventBoard.eTitle }</a> 
					</td>
					<td>${eventBoard.eWriter }</td>
					<td>${eventBoard.eCreateDate }</td>
					<td>${eventBoard.eCount }</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${loginMember.memberId eq 'admin' }">
		<button type="button" class="btn btn-default pull-right"
			onclick="location.href='eventBoardWriteView.do'">글쓰기</button>
		</c:if>
		<div class="text-center" style="position:relative; top:100px;">
		<form action="eventBoardSearch.do" method="get">
			<div class="w100" style="padding-right:10px">
				<select class="form-control-sm" name="searchType" id="searchType" style="height:25px;">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="fWriter">작성자</option>
				</select>
				<input type="text" class="form-control-sm" name="searchValue" id="searchValue">
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
			</form>
		</div>
	</div>

		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					<li><a><</a>&nbsp;</li>
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="eventBoardList.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<li><a href="${before }"><</a>&nbsp;</li>
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<li><a style="background: #eee">${p }</a>&nbsp;</li>
					</c:if>
					<c:url var="pagination" value="eventBoardList.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<li><a href="${pagination }">${p }</a>&nbsp;</li>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					<li><a>></a>&nbsp;</li>
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="eventBoardList.do">
						<c:param name="page" value="${pi.currentPage +1 }"></c:param>
					</c:url>
					<li><a href="${after }">></a>&nbsp;</li>
				</c:if>
			</ul>
		</div>

</body>
</html>