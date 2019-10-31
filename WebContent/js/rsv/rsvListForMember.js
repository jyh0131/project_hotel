(function(win, $){
	$(function(){
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		//날짜포맷 메소드
		function dateFormat(time) {
			var date = new Date(time);
			return date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
		}
		
		//select 상태에 따라 리스트 뿌리기
		$("select[name='rsvState']").change(function(){
			//테이블 리셋
			$("table").empty();
			$trDf = $("<tr>").append("<th>예약번호</th>").append("<th>객실</th>")
							.append("<th>체크인/체크아웃</th>").append("<th>숙박인원</th>")
							.append("<th>결제날짜</th>").append("<th></th>");
			$("table").append($trDf);
			
			$.ajax({
				url: "rsvStateList.do",
				type: "get",
				data: {"rsvState":$(this).val()},
				dataType: "json",
				success: function(res){
					console.log(res);

					if(res.list.length == 0) {
						$("table").append("<tr><td>등록된 예약이 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						//첫번째 row
						$tdNo = $("<td>").append(obj.rNo);
						$tdRoom = $("<td>").append(obj.room.roomNo + "<br>" 
												 + obj.room.roomCategory.rcName + " / " 
												 + obj.room.viewType.vtName + " / "
												 + obj.room.bedType.btName);
						$tdDate = $("<td>").append(dateFormat(obj.rIn) + "~" + dateFormat(obj.rOut) + "<br>(" + obj.rStay + "박)");
						$tdPsn = $("<td>").append("성인: " + obj.rPsnAdt + "명 / 어린이: " + obj.rPsnCdr + "명");
						$tdPayDate = $("<td>").append(dateFormat(obj.rPayDate));
						
						//상태에 따라 버튼 노출여부 결정
						$tdBtn = $("<td>");
						if(obj.rState == "예약완료") { /*취소버튼 쫌있다가!*/
							$tdBtn.append("<a href='#' id='aDel'>예약취소</a>");
						} else {
							$tdBtn.append("취소된 예약");
						}
					
						$tr = $("<tr>").append($tdNo).append($tdRoom).append($tdDate)
										.append($tdPsn).append($tdPayDate).append($tdBtn);
						
						$("table").append($tr);
					})
				}
			});
		});
		
		//예약 취소
		$("a#aDel").click(function(){
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result == true) {
				return true;
			} else {
				return false;
			}
		});
		
		
		
	})
})(window, jQuery);