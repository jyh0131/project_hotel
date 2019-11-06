(function(win, $){
	$(function(){
		
		//서브메뉴
		$("ul#main-menu").hover(function(){
			$(this).find("ul.sub-nav").stop().slideDown();
		}, function(){
			$(this).find("ul.sub-nav").stop().slideUp();
		})
		
		//뒤로가기
		function goBack(){
			window.history.back();
		}


	})
})(window, jQuery);