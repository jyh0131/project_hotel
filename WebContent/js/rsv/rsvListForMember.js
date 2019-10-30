(function(win, $){
	$(function(){
		
		$("a#aDel").click(function(){
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result == true) {
				return true;
			} else {
				return false;
			}
		})
		
		
		
	})
})(window, jQuery);