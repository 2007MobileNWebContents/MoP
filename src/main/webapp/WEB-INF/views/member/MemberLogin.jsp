<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<title> Re:turn 홈페이지</title>
</head>
<body>
   <h1 align="center"> Welcome re:turn!</h1>
   <br>
   <div class="login-area">
      <c:if test="${ empty sessionScope.loginMember }">
      <form action="login1.do" method="post">
         <table align="right">
            <tr>
               <td>아이디 :</td>
               <td><input type="text" name="memberId"></td>
               <td rowspan="2">
                  <button id="login-btn" class="btn btn-login">로그인</button>
               </td>
            </tr>
            <tr>
               <td>비밀번호 :</td>
               <td><input type="password" name="memberPwd"></td>
            </tr>
            <tr>
               <td colspan="3">
               <a href="enrollView.do">회원가입</a>&nbsp; 
               <a href="#">아이디/비밀번호 찾기</a></td>
            </tr>
         </table>
      </form>
   </c:if>
   <c:if test="${ !empty sessionScope.loginMember }">
      <table align="right">
         <tr>
            <td colspan="2"><h3> ${loginMember.memberName } 님 환영합니다.</h3></td>
         </tr>
         <tr>
         	<td><button onclick="location.href='myInfo.kh';">정보수정</button>
            <td><button onclick="location.href='logout.kh';">로그아웃</button></td>
         </tr>
      </table>
   </c:if>
   </div>
   </body>
   </html>
   
   