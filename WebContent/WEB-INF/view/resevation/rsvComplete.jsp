<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<!-- 예약마지막 -->
<div class="rsv-step-wrap">
	<!-- background로 step 넣기 -->
</div>

<div class="rsv-cpl-wrap">
	<div class="rsv-cpl-top">
		<p>
			[NAME] 고객님 감사합니다.
			<a href="#">
				인쇄
			</a>
		</p>
		
		<h1>
			예약이 완료되었습니다.
			<span class="rsv-cpl-num">
				<small>예약번호</small>
				16955070
			</span>
			
		</h1>
		
		<p>
			예약하신 내용이 예약 시 입력하신 이메일로 발송되었습니다.<br>
			예약 번호를 메모해두시면 빠르고 편리하게 예약을 확인하실 수 있습니다.<br>
			문의사항은 예약실로 전화주시기 바랍니다.
		</p>
		
		<ul>
			<li>
				<label>고객명</label>
				<span>SOOHEE KIM</span>
			</li>
			<li>
				<label>연락처</label>
				<span>010-0000-0000</span>
			</li>
			<li>
				<label>이메일</label>
				<span>k_1safqaewfahatsu@naver.com</span>
			</li>
		</ul>
	</div>
	
	<div class="rsv-cpl-bottom">
		<div class="cpl-bottom-content-wrap">
			<div class="cpl-bottom-content">
				<h3>PROJECT HOTEL</h3>
				<p>날짜/투숙인원</p>
				<ul>
					<li>
						· 체크인
						<span>2019.11.24.</span>
					</li>
					<li>
						· 체크아웃
						<span>2019.11.26.</span>
					</li>
					<li>
						· 숙박일수
						<span>2박</span>
					</li>
					<li>
						· 투숙인원
						<span>성인: 1명 / 어린이: 0명</span>
					</li>
				</ul>
			</div>
		
			<div class="cpl-bottom-content">
				<p>객실/패키지</p>
				<ul>
					<li>
						· 객실
						<span>Premier / Mountain</span>
					</li>
					<li>
						· 침대타입
						<span>Double</span>
					</li>
					<li>
						· 객실요금
						<span>329,587원</span>
					</li>
					<li>
						· 봉사료
						<span>32,959원</span>
					</li>
					<li>
						· 부가가치세
						<span>36,255원</span>
					</li>
				</ul>
			</div>
		
			<div class="cpl-bottom-content">
				<p>옵션</p>
				<ul>
					<li>
						· 옵션
						<span>Extra bed: 0개</span>
					</li>
					<li>
						　
						<span>Daily Breakfast(Audult): 0명</span>
					</li>
					<li>
						　
						<span>Daily Breakfast(Children): 0명</span>
					</li>
					
					<li>
						· 옵션요금
						<span>352,643원</span>
					</li>
				</ul>
				<h3>123,123,123원</h3>
			</div>
		</div>
	</div>
	
	<div class="btn-area">
		<a href="#">
			<span class="btnHome">[메인으로]</span>
		</a>
		<a href="#">
			<span class="btnMod">[예약수정]</span>
		</a>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>


