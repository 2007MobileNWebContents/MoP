<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html {
   margin: 0px;
}
.collapse navbar-collapse {
   position : relative !important;
   top : -200px !important;
}
body {
   margin: 0px;
   font-family: 'Hanna';
   /*font-family: '맑은 고딕', 'Helvetica', 'Arial', 'lucida grande','tahoma','verdana','arial','sans-serif';*/
   color: white;
   /* 100% 배경  */
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
   /*-webkit-text-stroke: 1px;*/
   -webkit-text-stroke: 1px rgba(142, 128, 113, 0.5);
   -moz-text-stroke: 1px rgba(142, 128, 113, 0.5);
   -ms-text-shadow: 1px 1px 1px rgba(142, 128, 113, 0.3);
   -moz-text-shadow: 1px 1px 1px rgba(142, 128, 113, 0.3);
   -webkit-font-smoothing: antialiased;
   font-smoothing: antialiased;
}

input {
   color: #bdbab4;
}

/* 레이아웃 */
/******************************************************/
.containerMypage {
   width: 900px;
   margin-right: auto;
   margin-left: auto;
   margin-bottom: 30px;
   text-align: center;
   position: relative;
    top: 200px;
}

#table_board.read tbody tr td:nth-child(2) {
   color: black;
}

/* Reply */
#table_board.reply {
   background-color: white;
   width: 100%;
   /* border : 1px solid #EFE8E2; */
   margin-bottom: 20px;
}

#table_header {
   width: 100%;
   height: 25px;
   background-color: /* #B1A599; */ #EFE8E2;
   color: black;
   text-align: center;
   font-size: 18px;
   -webkit-text-stroke: 1px rgba(255, 255, 255, 0.1);
   font-weight: 400;
   padding: 10px;
   padding-left: 15px;
}

#table_contents {
   padding: 25px;
}

#table_board.reply th {
   background-color: #efe8e2;
   border-top: 4px solid #ebc85e;
   color: #8e8071;
   padding: 30px;
   border-bottom: 1px solid gray;
}

#table_board.reply textarea {
   float: none;
   margin-top: 10px;
   margin-bottom: 10px;
   font-size: 20px;
   border: 1px solid gray;
}

#table_board.reply input[type=button] {
   background-color: #b1a599;
   margin-bottom: 15px;
   font-size: 20px;
}

#table_board.reply tbody div:first-child {
   float: left;
   width: 90%;
}

#table_board.reply tbody div:nth-child(2) {
   width: 10%;
   font-size: 12px;
   float: left;
}

#table_board.reply tbody span {
   font-size: 14px;
}
button {
   background-color: black;
   color: white;
   padding: 14px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 50%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="/public/css/style_board.css"
   type="text/css" />
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
   <jsp:include page="../common/sidenav.jsp"></jsp:include>
   <div class="containerMypage">
      <p>
         <b style="font-size: x-large;">My Page</b>
      </p>
      <hr style="width: 200px; position: relative; left: 5px;">
      <div>
         ${loginMember.memberName }님 사용 가능 포인트 :<span style="color: red">
            ${loginMember.won } </span>
      </div>
      <hr>
      <div id="board">
         <table id="table_board" class="list">
            <colgroup>
               <col width="330">
               <col width="250">
               <col width="200">
               <col width="250">
            </colgroup>
            <thead>
               <tr>
                  <th style="position: relative; left: 120px;">예약 장소</th>
                  <th></th>
                  <th>예약 상세</th>
                  <th></th>

               </tr>
            </thead>
            <c:forEach items="${rList }" var="reservation" varStatus="status">
               <c:if test="${ loginMember.memberId eq reservation.rMemberId}">
                  <tbody>
                     <tr>
                        <td>${reservation.rPlace }</td>
                        <td style="position: relative; left: -40px;"><img
                           src="/resources/image${pList[status.index].pImg }"
                           style="width: 150px; height: 100px; padding-top: 10px;"></td>
                        <td>${reservation.rPeople }명
                           <p>${reservation.rDate }</p>
                        </td>
                        <td>
             
                           <button style="width: 200px; margin-bottom: 10px;"
                           onclick="location.href='reviewList.do?vNo=${pList[status.index].pId}'">리뷰 작성하기</button>
                           <button style="width: 200px;" onclick="location.href='deleteReservation.do?rId=${reservation.rId}';">예약 취소하기</button>
                        </td>
                     </tr>
                  </tbody>
               </c:if>
            
            </c:forEach>
         </table>
         <hr>
         <button style="width:160px;" onclick="javascript:location.href='/myInfo.do';">회원 정보 수정하기</button>
      </div>
   </div>
</body>
</html>