(function(win, $){
	$(function(){
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		//초기화 선택시
		$("#aReset").click(function(){
			var rs = confirm("예약을 취소하고 메인으로 돌아시겠습니까?");
			if(rs == true) {
				return true;
			} else {
				return false;
			}
		});
		
		//옵션 선택시 총 금액에 반영되게
		var psn = $("input.ckPerson-area").val().trim();
		var psnAdt = psn.substr(psn.indexOf("명")-1, 1);
		var psnCdr = psn.substr(psn.lastIndexOf("명")-1, 1);
		
		$(".op-ck").click(function(){
			var op1Price = 0;
			var op2Price = 0;
			var op3Price = 0;
			
			$("div.rsv-op-total > ul").empty();
			$("div.rsv-op-total > ul").append("<li><b>옵션</b></li>");
			
			if($(".op-ck:eq(0)").prop("checked") == true) {
				$li = $("<li>");
				$li.addClass("op0").append("침대 추가")
								   .append("<input type='text' readonly='readonly' class='bedP' value='40,000 원'>");
				$("div.rsv-op-total > ul").append($li);
				op1Price = parseInt($(".bedP").val().replace("원","").replace(",","") || 0);
			}

			if($(".op-ck:eq(1)").prop("checked") == true) {
				$li = $("<li>");
				$li.addClass("op1").append("조식(성인)")
								   .append("<input type='text' readonly='readonly' class='adtP' value='"+addComma(32000 * psnAdt)+" 원'>");
				$("div.rsv-op-total > ul").append($li);
				op2Price = parseInt($(".adtP").val().replace("원","").replace(",","") || 0);
			}
			
			if($(".op-ck:eq(2)").prop("checked") == true) {
				if(psnCdr == 0) {
					alert("투숙하시는 인원 외 조식 추가는 불가합니다.");
					$(".op-ck:eq(2)").prop("checked", false);
					return;
				}
				
				$li = $("<li>");
				$li.addClass("op2").append("조식(어린이)")
								   .append("<input type='text' readonly='readonly' class='cdrP' value='"+addComma(23000 * psnCdr)+" 원'>");
				$("div.rsv-op-total > ul").append($li);
				op3Price = parseInt($(".cdrP").val().replace("원","").replace(",","") || 0);
			}
			
			//방 가격
			var rmPricee = $("input.rmPrice").val().substring($("input.rmPrice").val().indexOf("원"), 0);
			var rmPrice = parseInt(rmPricee.replace(/,/gi,""));
			
			//옵션 가격
			var opTotal = op1Price + op2Price + op3Price;
			
			//봉사료 & 부가세
			var svcCharge = (rmPrice + opTotal) / 10;
			$("input.svcCharge").val(addComma(svcCharge) + " 원");
			var vat = (rmPrice + opTotal + svcCharge) / 10;
			$("input.VAT").val(addComma(vat) + " 원");
			
			//찐 토탈
			var realTotal = rmPrice + opTotal + svcCharge + vat;
			$("input.realTotal").val(addComma(realTotal) + " 원");
		});
		
		
		//submit 전 유효성 검사
		$("form").submit(function(){
			//이름
			var nameReg = /^[가-힣]{2,5}$/;
			var name = $("input[name='nameKor']").val();
			
			if(name == "") {
				alert("이름을 입력하세요.");
				return false;
			} else if(nameReg.test(name) == false) {
				alert("입력된 이름이 형식에 맞지 않습니다. 다시 확인 바랍니다.");
				return false;
			}
			
			//이메일
			var mailReg = /^[a-z0-9]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
			var mail = $("input[name='mail']").val();
			
			if(mail == "") {
				alert("메일을 입력하세요.");
				return false;
			} else if(mailReg.test(mail) == false){ 
				alert("입력된 메일주소가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
				return false;
			}
			
			//휴대전화
			var tel2Reg = /^[0-9]{3,4}$/;
			var tel3Reg = /^[0-9]{3,4}$/;
			var tel2 = $("input[name='tel2']").val();
			var tel3 = $("input[name='tel3']").val();
			
			if(tel2 == "" && tel3 == "") {
				alert("전화번호를 입력하세요.");
				return false;
			} else if(tel2Reg.test(tel2) == false || tel3Reg.test(tel3) == false){
				alert("입력된 전화번호가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
				return false;
			}
			
			//카드종류
			var card = $("select[name='cardType']").val();
			if(card == "선택") {
				alert("카드종류를 선택해주세요.");
				return false;
			}
			
			//카드번호
			var cardReg = /^[0-9]{4}$/;
			var cardNum1 = $("input[name='cardNum1']").val();
			var cardNum2 = $("input[name='cardNum2']").val();
			var cardNum3 = $("input[name='cardNum3']").val();
			var cardNum4 = $("input[name='cardNum4']").val();
			
			if(cardNum1 == "" || cardNum2 == "" || cardNum3 == "" || cardNum4 == "") {
				alert("카드번호를 입력해주세요.");
				return false;
			}
			
			if(cardReg.test(cardNum1) == false || cardReg.test(cardNum2) == false
			|| cardReg.test(cardNum3) == false || cardReg.test(cardNum4) == false) {
				alert("입력된 카드번호가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
				return false;
			}
			
			//카드 유효기간
			var selMonth = $("select[name='cardNumMonth']").val();
			var selYear = $("select[name='cardNumYear']").val();
			
			if(selMonth == "월") {
				alert("카드 유효기간을 입력해주세요.");
				return false;
			} else if(selYear == "년") {
				alert("카드 유효기간을 입력해주세요.");
				return false;
			}
			
			//환불은행명
			var selBank = $("select[name='refundBank']").val();
			if(selBank == "은행명") {
				alert("은행을 선택해주세요.");
				return false;
			}
			
			//환불 계좌번호
			var bankNumReg = /^[0-9]{16}$/;
			var bankNum = $("input[name='refundNum']").val();
			if(bankNum == "") {
				alert("환불 계좌번호를 입력해주세요.");
				return false;
			} else if(bankNumReg.test(bankNum) == false) {
				alert("입력된 계좌번호가 형식에 맞지 않습니다. 다시 확인 바랍니다.")
				return false;
			}
			
			//환불 예금주
			var rfName = $("input[name='refundName']").val();
			if(name == "") { 
				alert("환불 예금주명을 입력하세요.");
				return false;
			} else if(nameReg.test(rfName) == false) {
				alert("입력된 예금주명이 형식에 맞지 않습니다. 다시 확인 바랍니다.");
				return false;
			}
			
		});
		
		
	})
})(window, jQuery);