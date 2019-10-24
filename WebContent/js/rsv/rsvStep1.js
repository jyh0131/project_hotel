
(function(win, $){
	$(function(){
		
		$(".datepicker-here").datepicker({
			toggleSelected: false,
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

	    
	    //검색 버튼 누르면 리스트 show
	    $(".btn-Search").click(function(){
			$.ajax({
				url:"findRoom.do",
				type:"get",
				dataType:"json",
				success:function(res){
					console.log(res);
					
			    	$(".rsv-result-list").show();
			    	$("div.rsv-result-list-wrap > h2").hide();
			    	
			    	$(res.list).each(function(i, obj){
			    		var roomPrice = obj.roomPrice;
			    		
			    		//tree
			    		$li = $("<li>");
			    		
			    		$divDetail = $("<div>").addClass("rsv-detail");
			    		
			    		$divLeft = $("<div>").addClass("rsv-detail-left");
			    		$divImg = $("<div>").addClass("rsv-detail-img").append("<img src='${pageContext.request.contextPath}/images/rsv-img/test.jpg'");
			    		$divName = $("<div>").addClass("rsv-detail-Name");
			    		$dl = $("<dl>").addClass("rsv-name-list").append("<dt>Standard</dt>").append("<dd>크기: <span>40</span>㎡</dd>").append("<dd>전망: <span>산, 정원</span></dd>");
			    	
			    		$divName.append($dl);
			    		$divLeft.append($divImg).append($divName);
			    		
			    		$divRight = $("<div>").addClass("rsv-detail-right");
			    		$divPrice = $("<div>").addClass("rsv-detail-price").append("<span class='rsv-price-price'>"+roomPrice+"~</span>").append("<span>원/1박</span>");
			    		$divBtn = $("<div>").addClass("rsv-detail-btn").append("<a href='#'><span></span></a>");
			    	
			    		$divRight.append($divPrice).append($divBtn);
			    		
			    		$divTab = $("<div>").addClass("rsv-detail-tab");
			    		$divTabList = $("<div>").addClass("rsv-tab-list");
			    		$tabUl = $("<ul>");
			    		$tabLi = $("<li>");
			    		$spanLeft = $("<span>").addClass("tab-list-left").append("<span class='tab-list-view'>Mountain</span>").append("<span class='tab-list-room-type'>Double</span>");
			    		$spanRight = $("<span>").addClass("tab-list-right").append("<span><span class='tab-list-price'>280,000</span> 원~</span>").append("<input type='radio' class='tab-room' name='tab-room'>");
			    		$divTabBtn = $("<div>").addClass("rsv-tab-btn").append("<a href='#'><input type='submit' value=''></a>");

			    		$tabUl.append($tabLi).append($spanLeft).append($spanRight);
			    		$divTabList.append($tabUl);
			    		$divTab.append($divTabList).append($divTabBtn);
			    		
			    		$divDetail.append($divLeft).append($divRight).append($divTab);
			    		$li.append($divDetail);
			    		
			    		$("ul.rsv-result-list").append($li);
			    		
			    		
			    	})
			    	
			    	
			    	
/*			    <li>
					<div class="rsv-detail">
						<div class="rsv-detail-left">
							<div class="rsv-detail-img">
								<img src="${pageContext.request.contextPath}/images/rsv-img/test.jpg">
							</div>
									
							<div class="rsv-detail-name">
								<dl class="rsv-name-list">
									<dt>Standard</dt>
									<dd>크기: <span>40</span>㎡</dd>
									<dd>전망: <span>산, 정원</span></dd>
								</dl>
							</div>
						</div>
								
						<div class="rsv-detail-right">
							<div class="rsv-detail-price">
								<span class="rsv-price-price">280,000~</span>
								<span>원/1박</span>
							</div>
									
							<div class="rsv-detail-btn">
								<a href="#">
									<span>
									<!-- background로 버튼 넣기 -->
									</span>
								</a>
							</div>
						</div>
								
						<div class="rsv-detail-tab">
							<div class="rsv-tab-list">
								<ul>
									<li>
										<span class="tab-list-left">
											<span class="tab-list-view">Mountain</span> /
											<span class="tab-list-room-type">Double</span>
										</span>
										<span class="tab-list-right">
											<span><span class="tab-list-price">280,000</span> 원~</span>
											<input type="radio" class="tab-room" name="tab-room">
										</span>
									</li>
								</ul>
							</div>
									
							<div class="rsv-tab-btn">
								<a href="#">
									<input type="submit" value="">
										<!-- background로 버튼 넣기 -->
								</a>
							</div>
						</div>
					</div>
				</li>*/
			    	
			    	
				},
				error:function(e){
					console.log(e);
				}
			});
	    });
	    
	    //방보기 버튼
	    $("div.rsv-detail-btn").click(function(){
	    	$("div.rsv-detail-tab").show();
	    });
	    

	    
	    
	})
})(window, jQuery);
   