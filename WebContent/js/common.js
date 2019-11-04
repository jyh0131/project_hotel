(function(win, $){
	$(function(){
		
		$("ul#main-menu").hover(function(){
			$(this).find("ul.sub-nav").stop().slideDown();
		}, function(){
			$(this).find("ul.sub-nav").stop().slideUp();
		})
	})
})(window, jQuery);