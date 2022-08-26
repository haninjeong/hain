<%@page import="dbcon.OrderMenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="dbcon.OrderMenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


</head>
<style>
.chart{

top: 500px;

}
</style>
<body>
<h1>매출조회</h1>

<hr>
<canvas id="myChart">
</canvas>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
	
	$(document).ready(function(){
		
			getGraph();
		
	})
	
	
	function getGraph(){
		
		let total = [];
		let day = [];
		 
		 $.ajax({
				url :"SalPriceList.do",
				type :"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					var sjsonInfo = JSON.stringify(data);
					var jsonInfo = JSON.parse(sjsonInfo);
					for(var i in data.totalList ){
						
						 total.push(jsonInfo.totalList[i].totalprice);
						 day.push(jsonInfo.totalList[i].pay_date);
					
					
					
					}	
					
					console.log(total);
					console.log(day);
				
					
					
				}
		 
		 
		 
		 });
		 
		 var context = document
	        .getElementById('myChart').getContext('2d');
	    var myChart = new Chart(context, {
	        type: 'bar', // 차트의 형태
	        data: { // 차트에 들어갈 데이터
	            labels: day
	                //x 축
	                 ,
	            datasets: [ 
	                { //데이터
	                    label: '매출', //차트 제목
	                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                    data:  total,
	                    	 //x축 label에 대응되는 데이터 값
	                    
	                    backgroundColor: [
	                        //색상
	                        'rgba(255, 99, 132, 0.2)',
	                       'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)'
	                    ],
	                    borderColor: [
	                        //경계선 색상
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)'
	                    ],
	                    borderWidth: 1 //경계선 굵기
	                } ,
	              
	            ]
	        },
	        options: {
	        	  maintainAspectRatio: false,

	            scales: {
	                yAxes: [
	                    {
	                        ticks: {
	                            beginAtZero: true
	                        }
	                    }
	                ]
	            }
	        }
	    });
		
		
		
		
		
		
		
		
		
	}
	


})








        </script>
</body>
</html>