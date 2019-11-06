<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberJoinAgree.css" rel="stylesheet" type="text/css">

<script>
	$(function(){
		$("input[type='reset']").click(function(){
			window.href="${pageContext.request.contextPath}/main.do";
		})
		$("form").submit(function(){
			
			if($("#n").prop("checked") || $("#n1").prop("checked")){		 
				alert("호텔 이용약관에 대한 동의는 필수 사항입니다"); 
				return false;
			}
					 
			if($("#y").prop("checked") == false && $("#n").prop("checked") == false) {
				alert("호텔 이용약관에 대한 동의를 체크해주세요"); 
				return false;
			}
			
			if($("#y1").prop("checked") == false && $("#n1").prop("checked") == false) {
				alert("개인정보 수집, 이용에 대한 동의를 체크해주세요 "); 
				return false;
			}
			 
		})
		
	})   
</script>

<div class="join-agree-wrap">
	<h1>약관동의</h1>
	
	<form action="agree.do" method="post">
		<h3>호텔 이용약관에 대한 동의 (필수)</h3>
		<div class="agree-content">
			제1조 <br>
			멤버십 규정 일반 <br>
			1. 본 약관은 주식회사 호텔신라(이하 “회사”)의 호텔 멤버십 프로그램인 Shilla Rewards(이하
			“멤버십 프로그램”)의 이용에 관한 기본적인 사항을 정함을 목적으로 합니다. <br>
			2. 멤버십 프로그램의 이용약관 및 멤버십
			운영에 관련한 각종 혜택 및 서비스의 적용 범위는 다음과 같습니다. (이하 (1)~(3)을 총칭하여 "가맹호텔") -
			신라호텔 : 서울신라호텔, 제주신라호텔 - 신라스테이 전 점 - 그 외 향후 제휴 호텔 및 리조트 
			3. 회사는 본 약관에서
			멤버십 프로그램의 회원 자격과 혜택, 멤버십 포인트 획득과 사용에 관한 내용을 규정합니다. <br>
			4. 멤버십 프로그램은 만 19세
			이상의 개인 회원을 대상으로 하며, 법인 또는 단체 등은 멤버십에 가입할 수 없습니다. <br>
			5. 멤버십 프로그램의 약관, 규칙
			중에 신청자 및 회원의 소속 국가 및 거주지의 강행법규에 위배되는 부분이 있을 경우, 해당 부분은 해당 회원에 한하여 무효화
			합니다. <br>
			6. 회사는 멤버십 운영 주체의 상황에 따라 본 이용약관을 포함한 프로그램 구성, 특전 및 그 내용을 변경하고,
			멤버십 프로그램을 종료할 수 있습니다. <br>
			7. 회사는 본 약관을 변경하는 경우 변경되는 약관의 적용일자 및 변경내용, 사유
			등을 명시하여 현행약관과 함께 변경약관 적용일로부터 10일(회원에게 불리하게 변경되는 경우 1개월) 이전에 서면, 전자우편,
			홈페이지 공지 등의 방법을 통해 회원에게 통지합니다. 회원은 변경약관에 동의하지 않을 수 있으며, 변경약관에 동의하지 않을
			경우 회원 탈퇴를 할 수 있습니다. 단, 회사가 위 약관 변경 통지를 하면서 변경약관 적용일까지 의사표시를 하지 않으면
			변경약관에 동의한 것으로 간주한다는 내용을 고지하였음에도 불구하고, 회원이 명시적으로 거부의사를 표시하지 않은 경우 회원이
			변경약관에 동의한 것으로 간주합니다. 단, 회원에게 불리하게 변경되는 경우 통지 후 2개월 이내 회원 탈퇴를 할 수
			있습니다. <br>
			8. 회사는 멤버십 프로그램 종료 최소 6개월 이전에 호텔 공식
			웹사이트(https:www.shillahotels.com, 이하 “멤버십 홈페이지”)에 공지를 하며, 전 회원을 대상으로
			1회 이상 전자우편을 통한 안내문을 발송합니다. <br>
			9. 프로그램 종료 통보 이후 6개월 경과 시점 기준으로 보유 포인트는 자동
			소멸되며, 모든 혜택 및 서비스 제공이 중단됩니다. <br>
			10. 주소 및 기타 개인정보 사항의 변경 시 회원은 회사에 통보하여야
			하고, 미 통보로 인한 회원의 불이익은 해당 회원이 감수하며 회사가 책임지지 않습니다. <br>
			11. 회사는 호텔정보 및 회원의
			계정명세 등을 회원에게 통지할 수 있고, 우편에 의한 통지의 경우 그 분실 또는 전달의 지연에 대한 책임을 지지 않습니다.<br>
			12. 본 약관은 대한민국 법률이 적용되며, 멤버십 프로그램과 관련한 분쟁에 대한 소송은 서울중앙지방법원을 전속관할법원으로
			합니다.<br>
		</div>
			
		<div class="agree-radio-wrap">
			<input type="radio" name="agree" value="yes" id="y"><label for="y">동의함</label>
			<input type="radio" name="agree" value="no" id="n"><label for="n">동의하지않음</label>
		</div>
			

		<h3>개인정보 수집, 이용에 대한 동의 (필수)</h3>
		<div class="agree-content">
			1. 수집<br>
			이용 항목 성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호,
			신라리워즈 번호 
			2. 수집 이용 목적 본인 식별, 신라리워즈 서비스 제공 및 민원처리<br> 
			3. 보유 이용 기간 수집·시용<br>
			동의일로부터 회원 탈퇴 시 까지 ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원
			가입 및 서비스 이용이 불가합니다.<br>
			이용 항목 성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호,
			신라리워즈 번호 2. 수집 이용 목적 본인 식별, 신라리워즈 서비스 제공 및 민원처리 3. 보유 이용 기간 수집·시용
			동의일로부터 회원 탈퇴 시 까지 ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원
			가입 및 서비스 이용이 불가합니다.<br>
			이용 항목 성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호,
			신라리워즈 번호 2. 수집 이용 목적 본인 식별, 신라리워즈 서비스 제공 및 민원처리 3. 보유 이용 기간 수집·시용
			동의일로부터 회원 탈퇴 시 까지 ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원
			가입 및 서비스 이용이 불가합니다.<br><br>
			개인정보 수집, 이용에 대한 동의<br>
			1. 제공받는 자 : 신라스테이㈜<br>
			2. 제공하는 항목
			성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약 내역, 투숙기간, 아이디, 신라리워즈 번호<br>
			3. 제공받는 자의 이용 목적 : 신라리워즈 서비스 제공<br>
			4. 제공받은 자의 보유·이용 기간 :수집·이용 동의일로부터 회원 탈퇴 시까지<br>
			※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원 가입 및 서비스 이용이 불가합니다.
		</div>
			
		<div class="agree-radio-wrap">
		   	<input type="radio" name="agree1" value="yes1" id="y1"><label for="y1">동의함</label> 
			<input type="radio" name="agree1" value="no1" id="n1"><label for="n1">동의하지않음</label>
		</div>
		
		<div class="agree-btn-wrap">
			<input type="submit" value="다음"> 
			<input type="reset" value="취소" onclick="goBack()">
		</div>
	</form>			
</div>	


<%@ include file="/WEB-INF/view/include/footer.jsp"%>