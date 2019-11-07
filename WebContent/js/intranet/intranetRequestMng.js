(function(win, $){
	$(function(){	
		
		$.ajax({
			url: "reqCountCate.do",
			type: "post",
			dataType: "json",
			success: function(res){
				console.log(res);

				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				function drawChart() {
				
					var data = google.visualization.arrayToDataTable([
							['문의유형', '건 수'],
							['결제 문의', res.list[0]],
							['예약 문의', res.list[1]],
							['객실 문의', res.list[2]],
							['시설 및 옵션 문의', res.list[3]],
							['기타 문의', res.list[4]]
						]);
					
					
					
					var options = {
							title: '문의게시판 유형별 분류(단위: 건)'
					};
					
					var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					
					chart.draw(data, options);
					
				}//drawChart
		
			}//success
		
		});//ajax
		
		
		
		
	})
})(window, jQuery);