
(function(win, $){
	$(function(){
		
		$(".datepicker-here").datepicker({
			toggleSelected: false,
			minDate: new Date(),
			clear: 'Clear',
			firstDay: 0,
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
	    	$("h2").hide();
	    	
	    	$.ajax({
	    		url: "availbleRoom.do",
	    		type: "get",
	    		data: {"rsvDate": $("input[name='rsvDate']").val()},
	    		dataType: "json", 
	    		success: function(res){
	    			console.log(res);
	    			
	    			$(res.ar).each(function(i, obj){
	    				//RC 만들기
	    				$divImg = $("<div>").addClass("ar-rc-img").append("<p>이미지 들어갈 곳</p>");
	    				$divType = $("<div>").addClass("ar-rc-type")
	    							.append("<p>크기: "+obj.roomSize.rsName+"㎡</p>")
	    							.append("<p>가격: "+addComma(obj.roomPrice)+"<small>(1박)</small></p>");
	    				$divName = $("<div>").addClass("ar-rc-name").append("<h1>"+obj.roomCategory.rcName+"</h1>");
	    				
	    				//OP 만들기
	    				$pPrice = $("<p>").addClass("ar-ep").append("객실 옵션을 선택하고 예약을 눌러주세요.");
	    				$selOp1 = $("<select name='viewType'>").addClass("ar-selOp1");
	    				$divOp1 = $("<div>").addClass("ar-op1").append("<p>옵션1</p>").append($selOp1);
	    				$divOp1.append($selOp1);
	    				
	    				$selOp2 = $("<select name='bedType'>").addClass("ar-selOp2");
	    				$divOp2 = $("<div>").addClass("ar-op2").append("<p>옵션2</p>").append($selOp2);
	    				$divOp2.append($selOp2);
	    				
	    				$divOpBtn = $("<div>").addClass("ar-op-btn").append("<input type='submit' value='예약'>");
	    				
	    				$liRc = $("<li>").addClass("ar-rc").append($divImg).append($divType).append($divName);
	    				$liOp = $("<li>").addClass("ar-op").append($pPrice).append($divOp1).append($divOp2).append($divOpBtn);
	    				$("ul.ar-list").append($liRc).append($liOp);
	    			});
	    		}
	    	});
	    })

	    //객실 선택시 옵션창 나오게
	    $(document).on("click", "li.ar-rc", function(){
	    	$("input[name='roomCate']").val($(this).find(".ar-rc-name").children("h1").text());
	    	$(".ar-selOp1").empty().append("<option>전망 타입</option>");
			$(".ar-selOp2").empty().append("<option>침대 타입</option>");
	    	
	    	$.ajax({
	    		url: "findOption.do",
	    		type: "post",
	    		data: {"name":$(this).find(".ar-rc-name").children("h1").text()},
	    		dataType: "json",
	    		success: function(res){
	    			console.log(res);
	    			
	    			var op1Arr = [];
	    			var op2Arr = [];
	    			
	    			$(res.options).each(function(i, obj){
	    				op1Arr.push(obj[0]);
	    				op2Arr.push(obj[1]);
	    			});
	    			
	    			var uniqueOp1 = [];
	    			var uniqueOp2 = [];
	    			
	    			//옵션 중복 제거
	    			$.each(op1Arr, function(i, obj){
	    				if($.inArray(obj, uniqueOp1) == -1) uniqueOp1.push(obj);
	    			});

	    			$.each(op2Arr, function(i, obj){
	    				if($.inArray(obj, uniqueOp2) == -1) uniqueOp2.push(obj);
	    			});
	    			
	    			for(var i=0; i < uniqueOp1.length; i++) {
	    				$opView = $("<option>").append(uniqueOp1[i]);
	    				$(".ar-selOp1").append($opView);
	    			}
	    			
	    			for(var i=0; i < uniqueOp2.length; i++) {
	    				$opBed = $("<option>").append(uniqueOp2[i]);
	    				$(".ar-selOp2").append($opBed);
	    			}
	    			
	    		}
	    	});

	    	//sub창 나오기
	    	$("li.ar-op").slideUp();
	    	if($(this).next().css("display") == "none") {
	    		$(this).next().slideDown();
	    	} else {
	    		$("li.ar-op").slideUp();
	    	}
	    	
	    });
	    
	    //방보기 버튼
	    $(document).on("click", "input[type='submit']", function(){
	    	$(".ar-selOp1").val($(this).closest("li.ar-op").find("select[name=viewType]").val());
	    	$(".ar-selOp2").val($(this).closest("li.ar-op").find("select[name=bedType]").val());
	    });
	  
	    
	    
	})
})(window, jQuery);
   