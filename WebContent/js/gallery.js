(function(win, $){
	$(function(){	
		
		//탭 선택여부에 따라 슬라이더 이미지 바꾸기
		$(".slide-title > li").click(function(){
			$(".slide-title > li").removeClass("cc");
			$(this).addClass("cc");
			
//			var group = $(this).attr("data-group");
//			var contextPath = $("input[type='hidden']").val();
//			var $divSlide = $("<div>").addClass("bxslider");
			
			//탭이 어떤 분류인지 받아와서 사진 집어넣기
//			$.ajax({
//				url:"gList.do",
//				type:"post",
//				data:{"gNo" : group},
//				dataType: "json",
//				success: function(res){
//					console.log(res);
//				}
//			});
			
		});

		
		
		
	})
})(window, jQuery);