<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> re:turn 회원가입 페이지</title>
</head>
<body>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<jsp:include page="insert.do"></jsp:include>
		<jsp:include page="../member/insert.do"></jsp:include>
		<h1 align="center"> re:turn 회원가입 </h1>
		<div class="centerText">
			<form action="insert.do" method="post">
			<table width="650" cellspacing="5">
				<tr>
					<td> 아이디 </td>
					<td> <input type="text" name="memberId" id="memberId"></td>
				</tr>
				<tr>
					<td> 비밀번호 </td>
					<td><input type="password" name="memberPwd">
				</tr>
<!-- 				<tr> -->
<!-- 					<td> 비밀번호 확인 </td> -->
<!-- 					<td><input type="password2" name="memberPwd2"> -->
<!-- 				</tr> -->
				<tr>
					<td> 이름	</td>
					<td><input type="text" name="memberName" id="memberName">
				</tr>
				<tr>
					<td> 전화번호	</td>
					<td><input type="text" name="phone" id="phone">
				</tr>
				<tr>
					<td> 이메일</td>
					<td><input type="text" name="email" id="email">
				</tr>
				<tr>
					<td> 계좌 번호</td>
					<td><input type="text" name="accountNumber" id="accountNumber">
				</tr>
				<tr>
					<td> 우편 번호</td>
					<td><input type="text" name="zipCode"
					class = "postcodify_postcode5" size="6">
					<button type="button" id="postcodify_search_button">검색</button>
				</tr
				><tr>
					<td> 주소</td>
					<td><input type="text" name="addr"
					class="postcodify_address"></td>
				</tr>		
			</div>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
			</script>
			<script>
         		$(function(){
           			 $("#postcodify_search_button").postcodifyPopUp();
         		});
        	</script>
			
			<tr>
					<td colspan="2" align="center">
<!-- 					<button onclick="location.href='home.do'">가입하기</button> -->
					<input type="submit" value="가입하기">
				<button type="button" onclick="location.href='home.do';">홈으로</button>
			</tr>
			
</table>	
</form>
</body>
</html>