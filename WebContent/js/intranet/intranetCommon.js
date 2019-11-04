(function(win, $){
	$(function(){	
		//서브메뉴 처리
		$("ul.intra-main-menu > li > a").click(function(){
			$(".intra-sub-menu").slideUp();
			if($(this).parent().children(".intra-sub-menu").css("display") == "none") {
				$(this).parent().children(".intra-sub-menu").slideDown();
			} else {
				$(this).parent().children(".intra-sub-menu").slideUp();
			}
		});
	})
})(window, jQuery);