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
			var mon = date.getMonth()+1;
			var dt = date.getDate();
		
			//10보다 작은 수들에 0붙이기
			if(mon < 10) {
				mon = "0" + mon;
			}
			if(date < 10) {
				dt = "0" + dt;
			}
			
			return date.getFullYear() + "-" + mon + "-" + dt;
		}
		
		//테일블 리셋 메소드
		function tableReset(){
			$("table").empty();
			$trDf = $("<tr>").append("<th>예약번호</th>").append("<th>객실</th>")
							.append("<th>체크인/체크아웃</th>").append("<th>숙박인원</th>")
							.append("<th>결제날짜</th>").append("<th></th>");
			$("table").append($trDf);
		}
		
		
		//데이트피커 컨트롤
		var dStart, dEnd;
		
		//날짜선택창
		$("#pick_start").datepicker({
			toggleSelected: false,
			clear: 'Clear',
			autoClose: true,
			firstDay: 0,
			onSelect: function(formattedDate, date, inst){
				dStart = date;
				
				$("#pick_end").datepicker({
					minDate: new Date(date)
				});
			}
		});
		
		$("#pick_end").datepicker({
			toggleSelected: false,
			clear: 'Clear',
			autoClose: true,
			onSelect: function(formattedDate, date, inst){
				dEnd = date;
			}
		});
		
		//기간별 조건에 따라 리스트 뿌리기
		$("#btnSearch").click(function(){
			//데이트피커 공란일 때
			if($("#pick_start").val() == "" || $("#pick_end").val() == "") {
				alert("날짜를 선택해주세요");
				return;
			}
			//데이트피커 날짜 조건
			if(dStart == dEnd) {
				alert("시작날짜가 종료날짜와 같을 수 없습니다.");
				$("#pick_start").val("");
				return;
			}
			if(dStart > dEnd) {
				alert("시작날짜가 종료날짜보다 이후일 수 없습니다.");
				$("#pick_start").val("");
				return;
			}
			
			
			//테이블 리셋
			tableReset();
			$("select[name='rsvState'] > option:eq(0)").prop("selected", true);
			
			var dateStart = $("#pick_start").val();
			var dateEnd = $("#pick_end").val();
			
			$.ajax({
				url: "rsvDateList.do",
				type: "get",
				data: {"inDate":dateStart, "outDate":dateEnd},
				dataType: "json",
				success: function(res){
					console.log(res);
					

					if(res.list.length == 0) {
						$("table").append("<tr><td colspan='6'>등록된 예약이 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						//첫번째 row
						$tdNo = $("<td>").append(obj.rNo);
						$tdDate = $("<td>").append(dateFormat(obj.rIn) + "~" + dateFormat(obj.rOut) + "<br>(" + obj.rStay + "박)");
						$tdPsn = $("<td>").append("성인: " + obj.rPsnAdt + "명 / 어린이: " + obj.rPsnCdr + "명");
						$tdPayDate = $("<td>").append(dateFormat(obj.rPayDate));
						$aRoom = $("<a>").attr("href", "detail.do?no="+obj.rNo);
						
						//상태에 따라 버튼 노출여부 결정
						$tdBtn = $("<td>");
						if(obj.rState == "예약완료") {
							$tdBtn.append("<a href='#' class='aDel'>예약취소</a>");
						} else {
							$tdBtn.addClass("canceled-rsv").append("취소된 예약");
							$aRoom.addClass("canceled-rsv");
						}
						
						$aRoom.append(obj.room.roomCategory.rcName + " / " 
									 + obj.room.viewType.vtName + " / "
									 + obj.room.bedType.btName);
						$tdRoom = $("<td>").append($aRoom);
					
						$tr = $("<tr>").append($tdNo).append($tdRoom).append($tdDate)
										.append($tdPsn).append($tdPayDate).append($tdBtn);
						
						$("table").append($tr);
					})
				}
			});
		})
		
		
		//select 상태에 따라 리스트 뿌리기
		$("select[name='rsvState']").change(function(){
			//상태 선택시 날짜 선택은 공란으로
			$("#pick_start").val("");
			$("#pick_end").val("");
			
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
						$("table").append("<tr><td colspan='6'>등록된 예약이 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						//첫번째 row
						$tdNo = $("<td>").append(obj.rNo);
						$tdDate = $("<td>").append(dateFormat(obj.rIn) + "~" + dateFormat(obj.rOut) + "<br>(" + obj.rStay + "박)");
						$tdPsn = $("<td>").append("성인: " + obj.rPsnAdt + "명 / 어린이: " + obj.rPsnCdr + "명");
						$tdPayDate = $("<td>").append(dateFormat(obj.rPayDate));
						$aRoom = $("<a>").attr("href", "detail.do?no="+obj.rNo);
						
						//상태에 따라 버튼 노출여부 결정
						$tdBtn = $("<td>");
						if(obj.rState == "예약완료") {
							$tdBtn.append("<a href='#' class='aDel'>예약취소</a>");
						} else {
							$tdBtn.addClass("canceled-rsv").append("취소된 예약");
							$aRoom.addClass("canceled-rsv");
						}
						
						$aRoom.append(obj.room.roomCategory.rcName + " / " 
									 + obj.room.viewType.vtName + " / "
									 + obj.room.bedType.btName);
						$tdRoom = $("<td>").append($aRoom);
					
						$tr = $("<tr>").append($tdNo).append($tdRoom).append($tdDate)
										.append($tdPsn).append($tdPayDate).append($tdBtn);
						
						$("table").append($tr);
					})
				}
			});
		});
		
		//예약 취소
		$("a.aDel").click(function(){
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result == true) {
				return true;
			} else {
				return false;
			}
		});
		
		
		
	})
})(window, jQuery);