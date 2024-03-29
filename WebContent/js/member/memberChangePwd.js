(function(win, $){
	$(function(){		
		
		var pw, pw1, pw2;
		//DB비밀번호 에러 리셋
		$("input[name='password']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		
		
		//비밀번호 입력시
		$("input[name='confirmPassword']").blur(function(){
			var pwReg = /^[0-9a-z!@#$%^&*-_]{8,20}$/i;
			pw = $(this).val();
			
			if(pwReg.test(pw) == false) {
				$(this).nextAll(".error").css("display", "inline");
			}
		});
		
		//새 비밀번호 에러 리셋
		$("input[name='confirmPassword']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		
		//비밀번호 확인 일치여부
		$("input[name='confirmPassword2']").blur(function(){
			pw1 = $("input[name='confirmPassword']").val();
			pw2 = $("input[name='confirmPassword2']").val();
			
			if(pw1 != pw2) {
				$(this).nextAll(".error").css("display", "inline");
			}
		});
		
		//새 비밀번호 확인 에러 리셋
		$("input[name='confirmPassword2']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		
		//submit 전 유효성 체크
		$("form").submit(function(){
			pw = $("input[name='password']").val();
			pw1 = $("input[name='confirmPassword']").val();
			pw2 = $("input[name='confirmPassword2']").val();

			if(pw == "" || pw1 == "" || pw2 == "") {
				alert("비밀번호를 입력해주세요.");
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