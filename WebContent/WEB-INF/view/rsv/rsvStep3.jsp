<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep3.css" rel="stylesheet" type="text/css">
<!-- 예약 3단계 -->
<div class="rsv-step-wrap">
	<span> 
		<!-- background로 step 넣기 -->
	</span>
</div>
			
<div class="rsv-input-content">
	<div class="rsv-input-left">
		<div class="input-left-wrap">
			<div class="rsv-input-info">
				<div class="input-info-title">
					<p>
						　고객 정보 입력
						<span><span class="required_field">*</span>표시 필수 입력사항</span>
					</p>
				</div>
				
				<div class="input-info-content">
					<ul>
						<li>
							<p>투숙자 정보 입력</p>
							<p>
								<label><span class="required_field">*</span>성명(국문)</label>
								<select>
									<option selected="selected">선택</option>
									<option>Ms.</option>
									<option>Mr.</option>
									<option>Dr.</option>
								</select>
								<input type="text" name="nameKor">
							</p>
							<p>
								<label><span class="required_field">*</span>성명(영문)</label>
								<input type="text" placeholder="FIRST NAME(이름)" name="firstNameEng">
								<input type="text" placeholder="LAST NAME(성)" name="lastNameEng">
							</p>
							<p>
								<label><span class="required_field">*</span>지역(여권기준)</label>
								<select name="location">
									<option>South Korea</option>
								</select>
							</p>
							<p>
								<label><span class="required_field">*</span>이메일</label>
								<input type="email" name="mail">
							</p>
							<p>
								<label><span class="required_field">*</span>연락처</label>
								<select>
									<option selected="selected">휴대전화</option>
									<option>자택전화</option>
								</select>
								<input type="tel" name="tel">
							</p>
							
						</li>
						
						<li>
							<p>카드 정보 입력</p>
							<p>
								<label><span class="required_field">*</span>카드종류</label>
								<select name="cardType">
									<option selected="selected">선택</option>
									<option>AMEX CARD</option>
									<option>BC CARD</option>
									<option>CITIBANK CARD</option>
									<option>DINERS CARD</option>
									<option>HYUNDAI CARD</option>
									<option>JCB CARD</option>
									<option>KEB CARD</option>
									<option>KOOKMIN CARD</option>
									<option>LOTTE CARD</option>
									<option>MASTER OVERSEAS</option>
									<option>SHINHAN CARD</option>
									<option>SAMSUNG CARD</option>
									<option>VISA OVERSEAS</option>
									<option>UNION PAY</option>
								</select>
							</p>
							<p>
								<label><span class="required_field">*</span>카드번호</label>
								<input type="text" name="cardNum1" class="cardNum">
								<input type="text" name="cardNum2" class="cardNum">
								<input type="text" name="cardNum3" class="cardNum">
								<input type="text" name="cardNum4" class="cardNum">
							</p>
							<p>
								<label><span class="required_field">*</span>유효기간</label>
								<select name="cardNumMonth"><!-- c:forEach로 처리할것 -->
									<option>월</option>
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
								</select>
								<select name="cardNumYear">
									<option>년</option>
									<option>2029</option>
									<option>2028</option>
									<option>2027</option>
									<option>2026</option>
								</select>
							</p>
							<p>
								※ 신용카드 정보는 고객님의 투숙에 의한 개런티 외에는 어떤 목적으로도 사용되지 않으며, 체크카드 및 일부 신용 카드의 경우 사용이 제한될 수 있습니다. 
								<span class="required_field"><u>온라인 예약 시 직접 결제가 이루어지지 않으며,</u></span> 최종 결제는 체크아웃 시 프런트 데스크에서 해주시기 바랍니다.
							</p>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="rsv-input-notice">
				<div class="input-notice">
					<p>예약 취소/변경 및 No-Show 안내</p>
					<dl>
						<dt><u>성수기(5월~10월, 12월 24일~31일)</u></dt>
						<dd>- 숙박 예정일 7일 전까지는 위약금 없이 취소 및 변경됩니다.</dd>
						<dd>- 숙박 예정일 6일 전 ~ 1일 전 18시까지 취소 및 변경 시, 최초 1박 요금의 20%가 위약금으로 부과됩니다.</dd>
						<dd>- 숙박 예정일 1일 전 18시 이후 취소/변경하거나 노쇼(No-Show)시, 최초 1박 요금의 80%가 위약금으로 부과됩니다.</dd>
					</dl>
					<dl>
						<dt><u>비성수기(성수기 외 기간)</u></dt>
						<dd>- 숙박 예정일 1일 전 18시까지는 위약금 없이 취소 및 변경됩니다.</dd>
						<dd>- 숙박 예정일 1일 전 18시 이후 취소/변경하거나 노쇼(No-Show)시, 최초 1박 요금의 10%가 위약금으로 부과됩니다.</dd>
					</dl>
					<p>
						※ 홈페이지를 통한 온라인 예약의 경우 체크인 기준 7일 이후 예약건만 온라인에서 취소 및 변경이 가능합니다.<br>
						※ 체크인 7일 이내 예약을 취소하실 경우 예약실로 전화주시기 바랍니다.
					</p>
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
			
		</div> <!-- left-wrap -->	
	</div>



	<!-- 오른쪽(저번 페이지거 동일하게 들어오게) -->
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