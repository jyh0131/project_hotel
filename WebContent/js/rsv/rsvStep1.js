
(function(win, $){
	$(function(){
		$("#ckIn-info").click(function(){
 	    	$(this).datepicker();	
 	    }); 
	    
	    var cntAdt = parseInt($(".rsv-button-plus").eq(0).closest("div").find(".rsv-num").text() || 0);
	    var cntCdl = parseInt($(".rsv-button-plus").eq(1).closest("div").find(".rsv-num").text() || 0);
	    
	    $(".rsv-button-plus").click(function(){
			if((cntAdt+cntCdl) == 4){
				alert("객실 1실 당 성인 3인까지, 성인+소인 4인까지만 투숙 가능합니다.");
	    		return;
	    	} else if(cntAdt == 3) {
	    		alert("성인 3인 이상 예약 불가");
	    		return;
	    	}
			
	    	switch($(this).attr("id")) {
	    		case "adtAdd":         
	    			$("#adtAdd").closest("div").find(".rsv-num").text(++cntAdt);
	    			break;
	    		case "chdAdd":
	    			$("#chdAdd").closest("div").find(".rsv-num").text(++cntCdl);
	    			break;
	    		}
	    	
	    });//인원 플러스 버튼 눌렀을 때
	    
	    $(".rsv-button-minus").click(function(){
	    	if(cntCdl == 2) {
	    		alert("아이 2명 이상 예약 불가");
	    		return;
	    	} else if ((cntAdt+cntCdl) == 4) {
	    		alert("객실 1실 당 성인 3인까지, 성인+소인 4인까지만 투숙 가능합니다.");
	    		return;
	    	} else if (cntAdt == 1) {
	    		return;
	    	}
	    	
			switch($(this).attr("id")) {
	    		case "adtSub":         
	    			$("#adtSub").closest("div").find(".rsv-num").text(--cntAdt);
	    			break;
	    		case "chdSub":
	    			$("#chdSub").closest("div").find(".rsv-num").text(--cntCdl);
	    			break;
	    	}
	    	
	    });//인원 플러스 버튼 눌렀을 때
	    
	    $(".btn-Search").click(function(){
	    	$(".rsv-result-list").show();
	    	$("div.rsv-result-list-wrap > h2").hide();
	    });//검색 버튼 누르면 리스트 show
	    
	    $("div.rsv-detail-btn").click(function(){
	    	$("div.rsv-detail-tab").show();
	    });//방보기 버튼
	})
})(window, jQuery);
   