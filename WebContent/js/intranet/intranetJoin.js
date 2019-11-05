(function(win, $){
	$(function(){		
		
		//아이디 중복체크
		$("#btnIdCk").click(function(){
			//유효성 체크
			var idReg = /^[a-z]{1}[0-9a-z-_]{5,14}$/;
			var id = $("input[name='id']").val();
			
			if(idReg.test(id) == false) {
				$("input[name='id']").nextAll(".formRule").css("display", "none");
				$("input[name='id']").nextAll(".error").css("display", "inline");
				return;
			}
				
			$.ajax({
				url:"dupCheck.do",
				type:"get",
				data:{"id":$("input[name='id']").val()},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					var result = res.result;
					
					if(result == "available") {
						$("#btnIdCk").css("display", "none");
						$("#btnIdCk").next(".avCon").css("display", "inline");
					} else {
						alert("이미 사용하고 있는 아이디입니다. 다른 아이디를 입력해주세요.");
						$("input[name='id']").val("");
					}
				}
			});
		});
		//아이디 에러 리셋
		$("input[name='id']").focus(function(){
			$(this).nextAll(".formRule").css("display", "inline");
			$(this).nextAll(".error").css("display", "none");
			$(this).nextAll(".avCon").css("display", "none");
			$(this).nextAll("#btnIdCk").css("display", "inline");
		});
		
		//비밀번호 입력시
		$("input[name='password']").blur(function(){
			var pwReg = /^[0-9a-z!@#$%^&*-_]{8,20}$/i;
			var pw = $("input[name='password']").val();
			
			if(pwReg.test(pw) == false) {
				$(this).nextAll(".formRule").css("display", "none");
				$(this).nextAll(".error").css("display", "inline");
			}
		});
		//비밀번호 에러 리셋
		$("input[name='password']").focus(function(){
			$(this).nextAll(".formRule").css("display", "inline");
			$(this).nextAll(".error").css("display", "none");
		});
		
		//비밀번호 확인 입력시
		$("input[name='confirmPassword']").blur(function(){
			var pw = $("input[name='password']").val();
			var cPw = $("input[name='confirmPassword']").val();
			
			if(pw == cPw) {
				$(this).nextAll(".error").css("display", "none");
				$(this).nextAll(".avCon").css("display", "inline");
			} else {
				$(this).nextAll(".avCon").css("display", "none");
				$(this).nextAll(".error").css("display", "inline").css("padding", "0px");
			}
		});
		
		//이름 입력시
		$("input[name='name']").blur(function(){
			var nameReg = /^[가-힣]{2,5}$/;
			var name = $(this).val();
			
			if(nameReg.test(name) == false) {
				$(this).nextAll(".error").css("display", "inline").css("padding","0px");
			}
		});
		//이름 에러 리셋
		$("input[name='name']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		})
		
		//휴대전화 입력시
		$("input[name='phone']").blur(function(){
			var phoneReg = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))\d{4}$/;
			var phone = $(this).val();
			
			if(phoneReg.test(phone) == false) {
				$(this).nextAll(".formRule").css("display", "none");
				$(this).nextAll(".error").css("display", "inline");
			}
		});
		//휴대전화 에러 리셋
		$("input[name='phone']").focus(function(){
			$(this).nextAll(".formRule").css("display", "inline");
			$(this).nextAll(".error").css("display", "none");
		});
		
		//이메일 중복체크
		$("#btnMailCk").click(function(){
			//유효성 검사
			var mailReg = /^[a-z0-9]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
			var mail = $("input[name='mail']").val();
			
			if(mailReg.test(mail) == false) {
				$("input[name='mail']").nextAll(".error").css("display", "inline");
				return;
			}
			
			$.ajax({
				url:"dupCheck.do",
				type:"post",
				data:{"mail":$("input[name='mail']").val()},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					var result = res.result;
					
					if(result == "available") {
						$("#btnMailCk").css("display", "none");
						$("#btnMailCk").next(".avCon").css("display", "inline");
					} else {
						alert("이미 사용하고 있는 메일주소입니다. 다른 메일주소를 입력해주세요.");
						$("input[name='mail']").val("");
					}
				}
			});
		});
		//이메일 에러 리셋
		$("input[name='mail']").focus(function(){
			$(this).nextAll(".error").css("display", "none");
		});
		
		
		
		
		
		//submit 전 유효성 검사
		$("form").submit(function(){
			//아이디
			var id = $("input[name='id']").val();
			
			if(id == "") {
				alert("아이디를 입력하세요");
				return false;
			}
			
			//비밀번호
			var pw = $("input[name='password']").val();
			var pw2 = $("input[name='confirmPassword']").val();
			
			if(pw == "" || pw2 == "") {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			//성명
			var name = $("input[name='name']").val();
			
			if(name == "") {
				alert("이름을 입력하세요.");
				return false;
			}
			
			
			//휴대전화
			var phone2 = $("input[name='phone2']").val();
			var phone3 = $("input[name='phone3']").val();
			if(phone2 == "" || phone3 == "") {
				alert("전화번호 입력란이 비었습니다. 입력 바랍니다.");
				return false;
			}
			
			//이메일
			var mail = $("input[name='mail']").val();
			
			if(mail == "") {
				alert("메일을 입력하세요.");
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
			
			
			//아이디 중복확인
			if($("#btnIdCk").css("display") != "none") {
				alert("아이디 중복체크가 팔요합니다.");
				return false;
			}

			//이메일 중복확인
			if($("#btnMailCk").css("display") != "none") {
				alert("이메일 중복체크가 팔요합니다.");
				return false;
			}
			
		});
		
		
	})
})(window, jQuery);