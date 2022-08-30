<%@page import="dbcon.PageVO"%>
<%@page import="dbcon.MenuVO"%>
<%@page import="java.util.List"%>
<%@page import="dbcon.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>  
<%
MenuDAO dao = new MenuDAO ();
String pagenum = request.getParameter("pagenum");
if(pagenum == null ){
	
	 pagenum = "1";
}
int num = Integer.parseInt(pagenum);
int amount = 8;
List<MenuVO> menuList = dao.allMenuList(num,amount);
int total=dao.totalMenu();
pageContext.setAttribute("menuList", menuList);
PageVO pageing = new PageVO(num,amount,total);
pageContext.setAttribute("pageing",pageing);
List<MenuVO> breadList = dao.breadList();
pageContext.setAttribute("breadList", breadList);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href = "CSS/menuManageMentCSS.css?ver=7">
<script src="JS/menuManageMentScript.js?ver=11"></script>

</head>
<body>
<h3 style="text-align: center;">등록된 메뉴의 전체 리스트</h3>
  
<hr>
<table id="allMenuList">
<thead>
	<tr>
		<th>*</th><th>메뉴번호</th><th>종류</th><th>이름</th><th>가격</th>
	</tr>
</thead>
<tbody id="menulist">
<c:forEach var="menulist" items="${menuList }">
	<tr>
		<td><input type="radio" class="index" name="index"></td>
		<td name="no">${menulist.menunum }</td>
		<td>${menulist.typebread }</td>
		<td>${menulist.name }</td>
		<td><fmt:formatNumber value="${menulist.price}"  pattern="#,###"/></td>
	</tr>
</c:forEach>
</tbody>
</table>
<br>
<div id="pageul" >
	<c:forEach begin="${pageing.startPage }" end="${pageing.endPage }" var="num">
	
		<ul class="pagination">
			<li class="page-item" name="pageNum">${num }</li>
		</ul>
	
	</c:forEach>
</div>
<hr>
<button id="menuUpdate" class="button">메뉴수정</button>
	<button id="menuPlus" class="button">메뉴추가</button>
	<button id="menuDelect" class="button">메뉴삭제</button>

<div id="modal" class="modal-overlay">
	 <div class="modal-window">
            <div class="title"><h2>메뉴추가</h2></div>
            <div class="close-area">X</div>
            <div class="content">
            <p>메뉴 구분 
            <select id="breadList">
            <option value="">선택</option>
            <c:forEach var="breadList" items="${breadList }">
            
            <option value="${breadList.typebread }">${breadList.typebread }</option>
            
            </c:forEach>
            </select></p>
            <p>메뉴 이름 &nbsp;<input type="text" name="name" id="name"></p>
            <p>메뉴 가격 &nbsp;<input type="text" name="price" id="price"></p>
            <button id="insertmenu">등록</button>   
            </div>
        </div>
</div> 


<div id="modalupdate" class="modal-overlay1">
	 <div class="modal-window1">
            <div class="title1">
            	<h2 style="text-align: center;">메뉴 수정</h2>
            </div>
            <div class="close-area1">X</div>
            <div class="content1">
             
            </div>
        </div>
</div> 


</body>
</html>