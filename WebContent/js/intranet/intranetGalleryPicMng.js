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
		
		// 삭제
		$(document).on("click", ".btnDelete", function(){
			// 삭제버튼 클릭 시 한번 더 확인하기
			if(confirm("정말 삭제하시겠습니까?") == true){
				$(this).parent().parent().remove();
			}else{
				return false;
			}
			
			var picFile = $(this).attr("data-picFile");
	
			$.ajax({
				url:"delete.do", 
				type:"get",
				data:{"picFile":picFile},
				dataType:"json",
				success:function(res){
					console.log(res);
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
		})//.btnDelete
		
		
		//객실 카테고리별 보기
		$("select.gal-state").change(function(){
			var state = $(this).val();
			var conPath = $("#conPath").val();
			
			//테이블 select
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
						$tdImg = $("<td>").append("<img src='"+conPath+"/upload/gallery/"+obj.gType.gPath+"/"+obj.picFile+"'>");
						$tdCate = $("<td>").append(obj.gType.gName);
						
						$tdFile = $("<td>").append(obj.picFile);
						$btn = $("<button>").addClass("btnDelete btn").attr("data-picFile", obj.picFile).append("삭제");
						$tdBtn = $("<td>").append($btn);
						$tr = $("<tr>").addClass("c-b").append($tdImg).append($tdFile).append($tdCate).append($tdBtn);
						$("table").append($tr);
					})
					
				}//success
				
			});//ajax
			
		});//select.gal-state change
		
	})
})(window, jQuery);