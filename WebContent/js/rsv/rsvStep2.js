(function(win, $){
	$(function(){
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
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
		
		

		
		
		
		
		
		
		
		
		
	})
})(window, jQuery);