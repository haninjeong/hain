
<%@page import="dbcon.MenuVO"%>
<%@page import="dbcon.MenuDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 

Date date = new Date();
String pattrtn = "yy년 MM월 dd일 [E]";

SimpleDateFormat sdf = new SimpleDateFormat(pattrtn);

MenuDAO menuDao =new MenuDAO();
String typebread ="단과자";
List<MenuVO> menuList =menuDao.menuList(typebread);
pageContext.setAttribute("menuList", menuList);

List<MenuVO> breadList =menuDao.breadList();
pageContext.setAttribute("breadList", breadList);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href = "CSS/selcss1.css?ver=15">
<script src="JS/selJavaScript1.js?ver=8"></script>

</head>
<body>
	<div>
		<span> 판매일자 :<%=sdf.format(date)%></span> <span>판매자</span>
		<span>현재시간 :<span id="clock"></span></span>
	</div>
	<hr>
<div  class="container">
		<table id="ordermenu" border="1">
			<thead>
				<tr>
					<th></th>
					<th>*</th>
					<th>메뉴명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody class="orderBoard">
		
			</tbody>

		</table>
	
	<label class="item2" >
		<button id="orderout">전체취소</button>
		<button id="onedeleteorder">선택취소</button>
		<button id="sale">단가변경</button>
		<button id="changeamount">수량변경</button>
		<button id="btn_sub">-</button>
		<button id="btn_add">+</button>
	</label>
	<table id="Paymentinformation"  class="item3" border="1">
		<thead>
			<tr>
				<th>결제정보</th>
				<th>결제금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>총금액</td>
				<td><span class="totalPrice">0</span></td>
			</tr>
		
			<tr>
				<td>받을금액</td>
				<td><span class="totalPrice">0</span></td>
			</tr>
		
		</tbody>

	</table>
	<section id="se">
		<div>
			<input type="number" class="box1" name="box1"  style="width:200px;height:50px;font-size:30px;">
		</div>

		<div id="boxs">
			<div>
				<div class="box" >7</div>
				<div class="box" >8</div>
				<div class="box" >9</div>
			</div>
			<div>
				<div class="box" >4</div>
				<div class="box" >5</div>
				<div class="box" >6</div>
			</div>
			<div>
				<div class="box">1</div>
				<div class="box">2</div>
				<div class="box">3</div>
			</div>
			<div>
				<div class="box">0</div>
				<div class="box">00</div>
				<div class="box4">c</div>
			</div>
			<div class="box2">전체지우기</div>
		</div>
		
	</section>

	<br>
	
	<div id="menuList" class="item4" >
		<c:forEach var="bread" items="${breadList }">
		<input type="button" class="bread" name="typebread"  value="${bread.typebread }" class="button">
		</c:forEach>
		<div id="menuviewList">
		<c:forEach var="menuList" items="${menuList }">
		<button class="button" onclick="pos.addorder('${menuList.name }', ${menuList.price })">${menuList.name }(${menuList.price })</button>
		
		
		</c:forEach>
		</div>
		<br>
	

	</div>
	<div class="item5">
		
			<button id="cash" value="현금" class="button">현금</button>
			<button id="card" value="카드" class="button">카드</button><br><br><br>
			<a href="viewReceiptList.jsp" class="item">영수증관리</a>
			<a href="menuManageMent.jsp"  class="item">메뉴관리</a>
		
	</div>
</div>
</body>
</html>