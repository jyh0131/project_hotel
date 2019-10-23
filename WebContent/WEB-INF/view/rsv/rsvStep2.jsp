<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep2.css" rel="stylesheet" type="text/css">
<!-- 예약 2단계 -->
<div class="rsv-step-wrap">
	<span> 
		<!-- background로 step 넣기 -->
	</span>
</div>
	
<div class="rsv-op-content">
	<div class="rsv-op-left">
		<div class="rsv-left-wrap">
			<div class="rsv-op-choice">
				<div class="op-choice-title">
					<p>
						　옵션 사항
						<span>객실이용에 필요한 옵션사항을 선택하세요.</span>
					</p>
				</div>
							
				<div class="op-choice-list">
					<table>
						<tr>
							<td>
								Daily Extra Bed<br>
								<span>40,000원</span>
							</td>
							<td></td>
							<td><span class="amount-bed">0</span>개</td>
							<td>
								<span class="op-btnMinus bed"></span>
								<span class="op-btnPlus bed"></span>
							</td>
							<td><span class="price-bed">40,000</span>원</td>
						</tr>
						<tr>
							<td>
								Daily Breakfast for Adult<br>
								<span>32,000원</span>
							</td>
							<td>성인</td>
							<td><span class="person-bf-adt">0</span>명</td>
							<td>
								<span class="op-btnMinus adt"></span>
								<span class="op-btnPlus adt"></span>
							</td>
							<td><span class="price-bf-adt">23,000</span>원</td>
						</tr>
						<tr>
							<td>
								Daily Breakfast for Child<br>
								<span>23,000원</span>
							</td>
							<td>어린이</td>
							<td><span class="person-bf-adt">0</span>명</td>
							<td>
								<span class="op-btnMinus cdr"></span>
								<span class="op-btnPlus cdr"></span>
							</td>
							<td><span class="price-bf-cdr">23,000</span>원</td>
						</tr>
										
					</table>
				</div>
			</div>
							
			<div class="rsv-op-request">
				<div class="op-request-main">
					<p>
						　추가 요청사항
						<span>
							<!-- background로 버튼 -->
						</span>
					</p>
				</div>
				<div class="op-request-sub">
					<textarea placeholder="공항 교통편 문의 또는 호텔 이용 시 문의하실 사항이 있으시면 입력해 주십시오."></textarea>
					<ul>
						<li>· 전망은 체크인 당일 사정에 따라 달라질 수 있습니다.</li>
						<li>· 전 객실은 금연실로 운영중입니다.</li>
					</ul>
				</div>
			</div>
							
			<div class="rsv-notice">
				<div class="notice-main">
					<p>
						　유의사항
					</p>
				</div>
				<div class="notice-content">
					<img src="images/rsv-img/notice.png">
				</div>
			</div>
							
			<!-- 버튼 -->
			<div class="btn-area">
				<a href="#">
					<span class="btnBack"></span>
				</a>
				<a href="#">
					<span class="btnRsv"></span>
				</a>
			</div>
		</div>
	</div>
					
	<!-- 오른쪽 -->
	<div class="rsv-op-right">
		<div class="rsv-info-wrap">
			<div class="rsv-info">
				<p>
					예약정보
					<a href="#">
						<span>예약초기화</span>
					</a>
				</p>
								
				<div class="info-content">
					<ul>
						<li class="info-ckIn">
							체크인
							<span class="ckIn-area">2019.11.26.</span>
						</li>
						<li class="info-ckOut">
							체크아웃
							<span class="ckOut-area">2019.11.27.</span>
						</li>
						<li class="info-ckStay">
							숙박일수
							<span class="ckStay-area">1박</span>
						</li>
						<li class="info-ckPerson">
							투숙 인원
							<span class="ckPerson-area">성인: 1  어린이: 0</span>
						</li>
						<li class="info-ckType">
							객실타입
							<span class="ckType-area">Twin</span>
						</li>
					</ul>
				</div>
								
				<div class="rsv-room-info">
					<ul>
						<li>
							Deluxe / Mountain / Twin
						</li>
						<li>
							2019.11.26.
							<span>313,057 원</span>
						</li>
						<li>
							<span>313,057  원 (1박)</span>
						</li>
						<li>
							<img src="images/rsv-img/test.jpg">
						</li>
					</ul>
				</div>
							
				<div class="rsv-total">
					<ul>
						<li>
							봉사료
							<span>31,306 원</span>
						</li>
						<li>
							부가가치세
							<span>34,437 원</span>
						</li>
					</ul>
					<ul class="rsv-total-price">
						<li>
							요금합계
							<span>378,800 원</span>
						</li>
					</ul>
				</div>	
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>