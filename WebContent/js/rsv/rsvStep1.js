
(function(win, $){
	$(function(){
		
		$(".datepicker-here").datepicker({
			toggleSelected: false,
			onSelect: function(formattedDate, date, inst){
				
				var dateArr = formattedDate.split("/");
				
				$("#ckIn-info .rsv-year").text(dateArr[2]);
				$("#ckIn-info .rsv-month").text(dateArr[0]);
				$("#ckIn-info .rsv-date").text(dateArr[1]);
				
				$("#ckOut-info .rsv-year").text(dateArr[5]);
				$("#ckOut-info .rsv-month").text(dateArr[3]);
				$("#ckOut-info .rsv-date").text(dateArr[4]);
			}
		});
		
		

	    var cntAdt = parseInt($(".rsv-button-plus").eq(0).closest("div").find(".rsv-num").text() || 0);
	    var cntCdl = parseInt($(".rsv-button-plus").eq(1).closest("div").find(".rsv-num").text() || 0);
	    
	    //어른 추가
	    $("#adtAdd").click(function(){
			if((cntAdt+cntCdl) == 4){
				alert("객실 1실 당 성인 3인까지, 성인+소인 4인까지만 투숙 가능합니다.");
				$("#adtAdd").css("background-position", "0 -50px");
	    		return;
	    	} else if(cntAdt == 3) {
	    		$("#adtAdd").css("background-position", "0 -50px");
	    		alert("성인 3인 이상 예약 불가");
	    		return;
	    	}
			$("#adtSub").css("background-position", "0 -25px");
			$("#adtAdd").closest("div").find(".rsv-num").text(++cntAdt);
	    	
	    });
	    
	    //어른 감소
	    $("#adtSub").click(function(){
			if(cntAdt == 1){
				$("#adtSub").css("background-position", "0 bottom");
	    		return;
	    	}
			$("#adtAdd").css("background-position", "0 0");
			$("#adtSub").closest("div").find(".rsv-num").text(--cntAdt);
	    	
	    });
	    
	    //어린이 증가
	    $("#chdAdd").click(function(){
	    	if((cntAdt+cntCdl) == 4){
				alert("객실 1실 당 성인 3인까지, 성인+소인 4인까지만 투숙 가능합니다.");
	    		return;
	    	}
	    	$("#chdSub").css("background-position", "0 -25px");
	    	$("#chdAdd").closest("div").find(".rsv-num").text(++cntCdl);
	    	
	    });
	    
	    //어린이 감소
	    $("#chdSub").click(function(){
			if(cntCdl == 0){
				$("#chdSub").css("background-position", "0 bottom");
	    		return;
	    	}
	    	$("#chdSub").closest("div").find(".rsv-num").text(--cntCdl);
	    	
	    });

	    
	    //검색 버튼 누르면 리스트 show
	    $(".btn-Search").click(function(){
	    	$(".rsv-result-list").show();
	    	$("div.rsv-result-list-wrap > h2").hide();
	    });
	    
	    //방보기 버튼
	    $("div.rsv-detail-btn").click(function(){
	    	$("div.rsv-detail-tab").show();
	    });
	    
	    
	    
	    
	})
})(window, jQuery);
   