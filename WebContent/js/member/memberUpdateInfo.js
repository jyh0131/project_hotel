(function(win, $){
	$(function(){		
		
		//휴대전화 입력시
		$("input[name='phone2']").blur(function(){
			var phoneReg2 = /^[0-9]{3,4}$/;
			var phone2 = $("input[name='phone2']").val();
			
			if(phoneReg2.test(phone2) == false) {
				$(this).nextAll(".error").css("display", "inline").css("padding","0px");
			}
		});
		$("input[name='phone3']").blur(function(){
			var phoneReg3 = /^[0-9]{4}$/;
			var phone3 = $("input[name='phone3']").val();
			
			if(phoneReg3.test(phone3) == false) {
				$(this).nextAll(".error").css("display", "inline").css("padding","0px");
			}
		});
		//휴대전화 에러 리셋
		$("input[name='phone2']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		$("input[name='phone3']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		
		$("form").submit(function(){
			//휴대전화
			var phone2 = $("input[name='phone2']").val();
			var phone3 = $("input[name='phone3']").val();
			if(phone2 == "" || phone3 == "") {
				alert("휴대전화번호는 필수 입력사항입니다. 입력 바랍니다.");
				return false;
			}
			
			//에러 존재시 submit 막기
			var er = 0;
			$(".error").each(function(i, obj){
				if($(obj).css("display") != "none") {
					er++;
				}
			})
			
			if(er > 0) {
				alert("잘못된 입력이 존재합니다. 수정 바랍니다.");
				return false;
			}
		});
		
		
	})
})(window, jQuery);