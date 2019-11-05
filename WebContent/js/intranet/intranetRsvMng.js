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
		
		//테이블 리셋 메소드
		function tableReset(){
			$("table").empty();
			$trDf = $("<tr>").append("<th>예약번호</th>").append("<th>예약자명</th>").append("<th>객실</th>")
					.append("<th>체크인/체크아웃</th>").append("<th>투숙인원</th>").append("<th>금액</th>")
					.append("<th>결제날짜</th>").append("<th>예약상태</th>").append("<th>비고</th>");
			$("table").append($trDf);
		}
		
		//기간별 조건에 따라 리스트 뿌리기
		$("#btnSearch").click(function(){
			//테이블 리셋
			
			tableReset();
			var date = $(".datepicker-here").val();
			var dateArr = date.split("~");
			
			$.ajax({
				url: "rsvDateList.do",
				type: "get",
				data: {"inDate":dateArr[0], "outDate":dateArr[1]},
				dataType: "json",
				success: function(res){
					console.log(res);
					
					if(res.list.length == 0) {
						$("table").append("<tr class='centerAlign'><td>등록된 예약이 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						//첫번째 row
						$tdNo = $("<td>").append(obj.rNo);
						$tdName = $("<td>").append(obj.member.mName + "<br>(" + obj.member.mId + ")");
						$tdRoom = $("<td>").append(obj.room.roomNo + "<br>" 
												 + obj.room.roomCategory.rcName + " / " 
												 + obj.room.viewType.vtName + " / "
												 + obj.room.bedType.btName);
						$tdDate = $("<td>").append(dateFormat(obj.rIn) + "~" + dateFormat(obj.rOut) + "<br>(" + obj.rStay + "박)");
						$tdPsn = $("<td>").append("성인: " + obj.rPsnAdt + "명 / 어린이: " + obj.rPsnCdr + "명");
						$tdPrice = $("<td>").append(addComma(obj.rTotalPrice)+"원");
						$tdPayDate = $("<td>").append(dateFormat(obj.rPayDate));
						$tdState = $("<td>").append(obj.rState);
						$tdBtn = $("<td>").attr("rowspan", "2");
						
						//상태에 따라 버튼 노출여부 결정
						if(obj.rState == "예약완료") { /*취소버튼 쫌있다가!*/
							$tdBtn.append("<a href='#' id='aDel'>취소</a>");
						} else {
							$tdBtn.append("취소됨");
						}
					
						$tr = $("<tr>").append($tdNo).append($tdName).append($tdRoom).append($tdDate).append($tdPsn)
						.append($tdPrice).append($tdPayDate).append($tdState).append($tdBtn);
						
						//두번째 row
						$tdReq = $("<td>").attr("colspan", "8");
						
						if(obj.rRequest != null) {
							$tdReq.append("요청사항: " + obj.rRequest);
						} else {
							$tdReq.append("요청사항: -");
						}
						$tr2 = $("<tr>").append($tdReq);
						
						$("table").append($tr).append($tr2);
					})
				}
			});
		})
		
		
		//select 상태에 따라 리스트 뿌리기
		$("select[name='rsvState']").change(function(){
			//테이블 리셋
			tableReset();
			
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
						$tdName = $("<td>").append(obj.member.mName + "<br>(" + obj.member.mId + ")");
						$tdRoom = $("<td>").append(obj.room.roomNo + "<br>" 
												 + obj.room.roomCategory.rcName + " / " 
												 + obj.room.viewType.vtName + " / "
												 + obj.room.bedType.btName);
						$tdDate = $("<td>").append(dateFormat(obj.rIn) + "~" + dateFormat(obj.rOut) + "<br>(" + obj.rStay + "박)");
						$tdPsn = $("<td>").append("성인: " + obj.rPsnAdt + "명 / 어린이: " + obj.rPsnCdr + "명");
						$tdPrice = $("<td>").append(addComma(obj.rTotalPrice)+"원");
						$tdPayDate = $("<td>").append(dateFormat(obj.rPayDate));
						$tdState = $("<td>").append(obj.rState);
						$tdBtn = $("<td>").attr("rowspan", "2");
						
						//상태에 따라 버튼 노출여부 결정
						if(obj.rState == "예약완료") { /*취소버튼 쫌있다가!*/
							$tdBtn.append("<a href='#' id='aDel'>취소</a>");
						} else {
							$tdBtn.append("취소됨");
						}
					
						$tr = $("<tr>").append($tdNo).append($tdName).append($tdRoom).append($tdDate).append($tdPsn)
						.append($tdPrice).append($tdPayDate).append($tdState).append($tdBtn);
						
						//두번째 row
						$tdReq = $("<td>").attr("colspan", "8");
						
						if(obj.rRequest != null) {
							$tdReq.append("요청사항: " + obj.rRequest);
						} else {
							$tdReq.append("요청사항: -");
						}
						$tr2 = $("<tr>").append($tdReq);
						
						$("table").append($tr).append($tr2);
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