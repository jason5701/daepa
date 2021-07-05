<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>분석</h2>
<div id="chart_div" style="width:1000px; height:500px;"></div>
<div id="chart_div1" style="width:1000px; height:500px;"></div>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	function drawVisualization() { 
		$.ajax({
		type:"get", 
		url:"/chart/product_click.json",
		dataType:"json",
		success:function(result){
			/* 데이터 셋팅 */
			var data = google.visualization.arrayToDataTable(result);
			/* 옵션 셋팅 */
			var options = {title : '상품별 조회수',seriesType: 'bars'};
			/* 차트 그리기 */
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			}
		});
	}	
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization1);
	function drawVisualization1() { 
		$.ajax({
		type:"get", 
		url:"/chart/product_sell.json",
		dataType:"json",
		success:function(result){
			/* 데이터 셋팅 */
			var data = google.visualization.arrayToDataTable(result);
			/* 옵션 셋팅 */
			var options = {title : '상품별 판매수',seriesType: 'bars'};
			/* 차트 그리기 */
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
			chart.draw(data, options);
			}
		});
	}	
</script>