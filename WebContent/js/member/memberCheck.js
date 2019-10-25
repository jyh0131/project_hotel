
	$(function(){
		$("#btn").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/IdCheckJson.do",
				type:"get",
				data:{"check":$("#check").val()},
				dateType:"json",
				success:function(res){
					console.log(res);
					if(res.result=="success"){
						var name = $("input[name='check']").val();
						$("input[name='check']").next().css("display","inline");
						$("input[name='check']").next().next().css("display","none");	
					}else{
						var name = $("input[name='check']").val();
						$("input[name='check']").next().next().css("display","inline");	
						$("input[name='check']").next().css("display","none");
					}
					
				}
			})
		})
		$("#ebtn").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/emailCheckJson.do",
				type:"get",
				data:{"echeck":$("#echeck").val()},
				dateType:"json",
				success:function(res){
					console.log(res);
					if(res.result=="success"){
						var name = $("input[name='echeck']").val();
						$("input[name='echeck']").next().css("display","inline");
						$("input[name='echeck']").next().next().css("display","none");	
					}else{
						var name = $("input[name='echeck']").val();
						$("input[name='echeck']").next().next().css("display","inline");	
						$("input[name='echeck']").next().css("display","none");
					}
					
				}
			})
		})
		$("form").submit(function(){
			//이름(한글 2~5)
			var nameReg = /^[가-힣]{2,5}$/;
			var name = $("input[name='name']").val();
			if(nameReg.test(name) == false){
				$("input[name='name']").next().css("display","inline");
				return false;
			}
			//이메일(xxxx@xxxxx.xxx)
			var emailReg =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = $("input[name='email']").val();
			if(emailReg.test(email) == false){
				$("input[name='email']").next().css("display","inline");
				return false;
			}
			//휴대전화(숫자 11)
			var phoneReg = /^[0-9]{11}$/;
			var phone = $("input[name='phone']").val();
			if(phoneReg.test(phone) == false){
				$("input[name='phone']").next().css("display","inline");
				return false;
			}
			//아이디 (영어,숫자 6~15)
			var idReg = /^[a-z][a-z0-9]{5,14}$/i;
			var id = $("input[name='id']").val();
			if(idReg.test(id) == false ){
				$("input[name='id']").next().css("display","inline");
				return false;
			}
			
			//비밀번호(영어,숫자 6~20)
			var passReg = /^[a-z0-9!@#$%^&]{6,20}$/;
			var pass = $("input[name='password']").val();
			if(passReg.test(pass) == false){
				$("input[name='password']").next().css("display","inline");
				return false;
			}
			//비밀번호 확인
			if($("input[name='password']").val()!=$("input[name='confirmPassword']").val()){
				$("input[name='confirmPassword']").next().next().css("display","inline");
				return false;
			}
		})
	})

