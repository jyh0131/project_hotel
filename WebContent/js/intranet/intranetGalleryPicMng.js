(function(win, $){
	$(function(){		
		//테이블 리셋 메소드
		function tableReset(){
			$("table").empty();
			$trDf = $("<tr>").append("<th class='c1'>사진</th>")
							.append("<th class='c2'>파일명</th>")
							.append("<th class='c3'>카테고리</th>")
							.append("<th class='c4'></th>");
			$("table").append($trDf);
		}
		
		$("button").click(function(){
			alert("버튼 기능 고민중입니다.");
		});
		
		
		//객실 카테고리별 보기
		$("select.gal-state").change(function(){
			var state = $(this).val();
			var conPath = $("#conPath").val();
			
			//테이블 리셋
			tableReset()
			
			$.ajax({
				url: "galStateList.do",
				type: "post",
				data:{"state": state},
				dataType: "json",
				success: function(res){
					console.log(res);
					
					if(res.list.length == 0) {
						$("table").append("<tr class='centerAlign'><td>등록된 사진이 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						
						switch(obj.gType.gNo) {
						case 1:
							$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/room/"+obj.picFile+"'>");
							$tdCate = $("<td>").append("객실");

							break;
						case 2:
							$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/dining/"+obj.picFile+"'>");
							$tdCate = $("<td>").append("다이닝");
							
							break;
						case 3:
							$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/activity/"+obj.picFile+"'>");
							$tdCate = $("<td>").append("액티비티");
							
							break;
						case 4:
							$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/sub_facilities/"+obj.picFile+"'>");
							$tdCate = $("<td>").append("부대시설");
							
							break;
						case 5:
							$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/etc/"+obj.picFile+"'>");
							$tdCate = $("<td>").append("기타");
							
							break;
						}
						
						$tdFile = $("<td>").append(obj.picFile);
						$tdBtn = $("<td>").append("<button>버튼</button>");
						
						$tr = $("<tr>").append($tdImg).append($tdFile).append($tdCate).append($tdBtn);
						$("table").append($tr);
					})
					
				}//success
			});
			
			
		});
		
	})
})(window, jQuery);