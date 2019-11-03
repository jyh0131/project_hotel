(function(win, $){
	$(function(){
		
		$.ajax({
			url: "salesMonth.do",
			type:"get",
			data:{"state":$("select[name='sales-state']")},
			dataType: "json",
			success: function(res){
				console.log(res);
			}
			
		});
		
		
		
		//차트 그리기
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawVisualization);

	    function drawVisualization() {
	    	var data = google.visualization.arrayToDataTable([
	          ['월', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average', 'add', 'add2', 'add3', '평균'],
	          ['2019/09',  165,      938,         522,             998,           450,      614.6, 614.6, 614.6, 614.6],
	          ['2019/10',  135,      1120,        599,             1268,          288,      682, 682,68,682],
	          ['2019/11',  157,      1167,        587,             807,           397,      623,682,682,682],
	          ['2019/12',  139,      1110,        615,             968,           215,      609.4,682,682,682],
	        ]);
	        
	        
	        var options = {
	          title : '4분기 객실별 예약량',
	          vAxis: {title: '예약량'},
	          hAxis: {title: '월'},
	          seriesType: 'bars',
	          series: {9: {type: 'line'}}        };

	        var chart = new google.visualization.ComboChart(document.getElementById('sales-chart'));
	        chart.draw(data, options);
	      }
		
		
	})
})(window, jQuery);