
(function(win, $){
	$(function(){
		
		$(".datepicker-here").datepicker({
			toggleSelected: false,
			minDate: new Date(),
			onSelect: function(formattedDate, date, inst){
				
				var dateArr = formattedDate.split("/");
				
				$("#ckIn-info .rsv-year").val(dateArr[2]);
				$("#ckIn-info .rsv-month").val(dateArr[0]);
				$("#ckIn-info .rsv-date").val(dateArr[1]);
				
				$("#ckOut-info .rsv-year").val(dateArr[5]);
				$("#ckOut-info .rsv-month").val(dateArr[3]);
				$("#ckOut-info .rsv-date").val(dateArr[4]);
			}
		});
		
		

	    var cntAdt = parseInt($(".rsv-button-plus").eq(0).closest("div").find(".rsv-num").val() || 0);
	    var cntCdl = parseInt($(".rsv-button-plus").eq(1).closest("div").find(".rsv-num").val() || 0);
	    
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
			$("#adtAdd").closest("div").find("input.rsv-num").val(++cntAdt);
	    	
	    });
	    
	    //어른 감소
	    $("#adtSub").click(function(){
			if(cntAdt == 1){
				$("#adtSub").css("background-position", "0 bottom");
	    		return;
	    	}
			$("#adtAdd").css("background-position", "0 0");
			$("#adtSub").closest("div").find(".rsv-num").val(--cntAdt);
	    });
	    
	    //어린이 증가
	    $("#chdAdd").click(function(){
	    	if((cntAdt+cntCdl) == 4){
				alert("객실 1실 당 성인 3인까지, 성인+소인 4인까지만 투숙 가능합니다.");
	    		return;
	    	}
	    	$("#chdSub").css("background-position", "0 -25px");
	    	$("#chdAdd").closest("div").find(".rsv-num").val(++cntCdl);
	    });
	    
	    //어린이 감소
	    $("#chdSub").click(function(){
			if(cntCdl == 0){
				$("#chdSub").css("background-position", "0 bottom");
	    		return;
	    	}
	    	$("#chdSub").closest("div").find(".rsv-num").val(--cntCdl);
	    });
	    
	    //검색 버튼 누르면 방 리스트 나오게
	    $(".btn-Search").click(function(){
	    	if(($("#ckIn-info .rsv-year").val() == "YYYY" || 
	    	   $("#ckIn-info .rsv-month").val() == "MM" ||
	    	   $("#ckIn-info .rsv-date").val() == "DD") ||
	    	   ($("#ckIn-info .rsv-year").val() == "YYYY" ||  $("#ckIn-info .rsv-year").val() == "" ||
	    	    $("#ckIn-info .rsv-month").val() == "MM" || $("#ckIn-info .rsv-month").val() == "" ||
	    	    $("#ckIn-info .rsv-date").val() == "DD" || $("#ckIn-info .rsv-date").val() == "")) {
	    		
	    		alert("날짜를 입력하시오");
	    		return false;
	    	} else {
	    		$("h2").hide();
	    		$("div.rsv-result-list-wrap").show();
	    	}
	    })
	    
	    
	    //객실 사진 클릭하면 옵션 창 나오게 (위)
	    $("ul.rsv-result-list-top > li > a").click(function(){
	    	$("div#choice-bottom").removeClass("show");
	    	var roomType = $(this).next().text();
	    	$selView = $("<select>").attr("name", "viewType");
	    	$selBed = $("<select>").attr("name", "bedType");
	    	$("ul.result-sub-list").text("");
	    	$("span.available-room-amount").text("");
	    	$("input[name='roomCate']").val(roomType);
	
    		switch(roomType) {
    		case "스탠다드":
    			$selView.append("<option>산</option>").append("<option>정원</option>");
    			$selBed.append("<option>더블</option>").append("<option>트윈</option>");
    			
    			break;
    		case "디럭스":
    			$selView.append("<option>산</option>").append("<option>바다</option>");
    			$selBed.append("<option>더블</option>").append("<option>트윈</option>");
    			
    			break;
    		case "테라스":
    			$selView.append("<option>정원</option>");
    			$selBed.append("<option>더블</option>").append("<option>트윈</option>").append("<option>온돌</option>");
    			
    			break;
    		case "프리미어":
    			$selView.append("<option>산</option>").append("<option>바다</option>");
    			$selBed.append("<option>더블</option>").append("<option>트윈</option>");
    			
    			break;

    		default:
    			$("div#choice-top").removeClass("show");
    			break;
    		}
    		
    		$liBtn = $("<li>").append("<button type='button' class='roomCkBtn'>빈방체크</button>");
        	$liView = $("<li>").append("<label>전망</label>").append($selView);
	    	$liBed = $("<li>").append("<label>침대 타입</label>").append($selBed);
	    	
	    	$("ul.result-sub-list").append($liView).append($liBed).append($liBtn);
	    	$("div#choice-top").toggleClass("show");
	    });
	    
	    //객실 사진 클릭하면 옵션 창 나오게 (아래)
	    $("ul.rsv-result-list-bottom > li > a").click(function(){
	    	$("div#choice-top").removeClass("show");
	    	var roomType = $(this).next().text();
	    	$selView = $("<select>").attr("name", "viewType");
	    	$selBed = $("<select>").attr("name", "bedType");
	    	$("ul.result-sub-list").text("");
	      	$("span.available-room-amount").text("");
	    	$("input[name='roomCate']").val(roomType);
	    	
	    	switch(roomType) {
    		case "프리미어 테라스":
       			$selView.append("<option>정원</option>");
    			$selBed.append("<option>더블</option>");

    			break;
	    	case "퍼시픽 디럭스":
	    		$selView.append("<option>바다</option>").append("<option>정원</option>");
	    		$selBed.append("<option>더블</option>").append("<option>트윈</option>");
	    		
	    		break;
	    	case "로열 스위트":
	    		$selView.append("<option>바다</option>");
	    		$selBed.append("<option>더블</option>");
	    		
	    		break;
	    	case "프레지덴셜 스위트":
	    		$selView.append("<option>바다</option>");
	    		$selBed.append("<option>더블</option>");
	    		
	    		break;
    		default:
    			$("div#choice-bottom").removeClass("show");
    			break;
	    	}
	    	
			$liBtn = $("<li>").append("<button type='button' class='roomCkBtn'>빈방체크</button>");
	    	$liView = $("<li>").append("<label>전망</label>").append($selView);
	    	$liBed = $("<li>").append("<label>침대 타입</label>").append($selBed);
	    	
	    	$("ul.result-sub-list").append($liView).append($liBed).append($liBtn);
	    	$("div#choice-bottom").toggleClass("show");
	    });
	    
	    $(document).on("click", ".roomCkBtn", function(){
	    	var btnObj = $(this);
	    
	    	$.ajax({
	    		url: "findRoom.do",
	    		type: "get",
	    		data: {"rsvDate": $("input[name='rsvDate']").val(), 
	    			   "roomCate": $("input[name='roomCate']").val(), 
	    			   "viewType": $("select[name='viewType']").val(), 
	    			   "bedType": $("select[name='bedType']").val()},
	    		dataType: "json",
	    		success: function(res){
	    			console.log(res);
	    			
	    			if(res == null) {
	    				var res_length = res.list.length;
	    				$(btnObj).closest("ul.result-sub-list").next().find(".available-room-amount").text("예약 가능 객실 : " + res_length + "개");
	    			} else {
	    				var res_length = res.list.length;
	    				$(btnObj).closest("ul.result-sub-list").next().find(".available-room-amount").text("예약 가능 객실 : " + res_length + "개");
	    				$("input[name='roomNum']").val(res.list[0].roomNo);
	    			}
	    		}
	    	});
	    });
	    
	    
	    
	    //방보기 버튼
	    $(document).on("click", "div.rsv-detail-btn", function(){
	    	$("div.rsv-detail-tab").show();
	    });

	    
	    
	})
})(window, jQuery);
   