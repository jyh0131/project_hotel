(function(win, $){
	$(function(){		
		//날짜포맷 메소드
		function dateFormat(time) {
			var date = new Date(time);
			var mon = date.getMonth()+1;
			var date = date.getDate();
		
			//10보다 작은 수들에 0붙이기
			if(mon < 10) {
				mon = "0" + mon;
			}
			if(date < 10) {
				date = "0" + date;
			}
			
			return date.getFullYear() + "-" + mon + "-" + date.getDate();
		}
		
		//select 상태에 따라 리스트 뿌리기
		$("select[name='memState']").change(function(){
			//테이블 리셋
			$("table").empty();
			$trDf = $("<tr>").append("<th>회원번호</th>").append("<th>성명</th>").append("<th>아이디</th>")
					.append("<th>생년월일</th>").append("<th>이메일</th>").append("<th>연락처</th>")
					.append("<th>가입일</th>").append("<th>비고</th>");
			$("table").append($trDf);
			
			$.ajax({
				url: "adminStateList.do",
				type: "get",
				data: {"memState":$(this).val()},
				dataType: "json",
				success: function(res){
					console.log(res);

					if(res.list.length == 0) {
						$("table").append("<tr class='centerAlign'><td colspan='8'>등록된 관리자가 없습니다.</td></tr>");
					}
					
					$(res.list).each(function(i, obj){
						//첫번째 row
						$tdNo = $("<td>").append(obj.mNo);
						$tdName = $("<td>").append(obj.mName);
						$tdId = $("<td>").append(obj.mId);
						$tdBirth = $("<td>").append(dateFormat(obj.mRegdate));
						$tdMail = $("<td>").append(obj.mMail);
						$tdPhone = $("<td>").append("(HP) " + obj.mPhone + " / (TEL) " + obj.mTel);
						$tdRegdate = $("<td>").append(dateFormat(obj.mRegdate));
						
						
						//상태에 따라 비고에 뭘 쓸지 결정
						if(obj.mQuitdate != null) {
							$tdState = $("<td>").append("<span style='color:#DF4D4D;'>탈퇴한 관리자</span>");
						} else {
							$tdState = $("<td>").append("-");
						}
					
						$tr = $("<tr>").append($tdNo).append($tdName).append($tdId).append($tdId).append($tdBirth)
										.append($tdMail).append($tdPhone).append($tdRegdate).append($tdState);
						
						//두번째 row
						$tdAddr = $("<td>").attr("colspan", "8");
						
						if(obj.rRequest != null) {
							$tdAddr.append("주소: (" + obj.mZipcode + ") "
										+ obj.mAddr1 + " " + obj.mAddr2);
						} else {
							$tdAddr.append("주소: -");
						}
						$tr2 = $("<tr>").append($tdAddr);
						
						$("table").append($tr).append($tr2);
					})
				}
			});
		});
		
		
		
	})
})(window, jQuery);