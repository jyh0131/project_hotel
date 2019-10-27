<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/util/datepicker.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep1.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/util/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/util/datepicker.en.js"></script>
<script src="${pageContext.request.contextPath}/js/rsv/rsvStep1.js"></script>


<div class="rsv-step-wrap">
	<span> 
		<!-- background로 step 넣기 -->
	</span>
</div>

<form action="rsvStep1.do" method="post">
	<div class="rsv-date-wrap">
		<div class="rsv-date-inner">
			<div class="rsv-date-top">
				<div class="rsv-date">
					<input type="text" name="rsvDate" readonly="readonly" class="datepicker-here" data-position="bottom left" 
					data-language="en" data-range="true" data-multiple-dates-separator="/" data-language="en"/>
					<span class="ck-title">체크인</span>
		
					<div class="ck-date" id="ckIn-info">
						<span class="left-side"> 
							<input type="text" name="inYear" value="YYYY" readonly="readonly" class="rsv-year">
							<input type="text" name="inMonth" value="MM" readonly="readonly" class="rsv-month">
						</span> 
						<span class="right-side"> 
							<input type="text" name="inDate" value="DD" readonly="readonly" class="rsv-date">
						</span>
					</div>
				</div>
		
				<div class="rsv-date">
					<span class="ck-title">체크아웃</span>
		
					<div class="ck-date" id="ckOut-info">
						<span class="left-side"> 
							<input type="text" name="outYear" value="YYYY" readonly="readonly" class="rsv-year">
							<input type="text" name="outMonth" value="MM" readonly="readonly" class="rsv-month">
						</span> 
						<span class="right-side"> 
							<input type="text" name="outDate" value="DD" readonly="readonly" class="rsv-date">
						</span>
					</div>
				</div>
		
				<div class="rsv-date">
					<span class="ck-title">성인</span>
					<div class="rsv-person">
						<span class="left-side"> 
							<input type="text" value="1" readonly="readonly" class="rsv-num" name="adtNum">
						</span> 
						<span class="right-side"> 
							<span class="rsv-button-plus" id="adtAdd"> 
								<!-- 성인 인원 증가 background로 버튼 넣기  -->
							</span> 
							<span class="rsv-button-minus" id="adtSub"> 
								<!-- 성인 인원 감소 background로 버튼 넣기  -->
							</span>
						</span>
					</div>
				</div>
		
				<div class="rsv-date">
					<span class="ck-title">어린이</span>
					<div class="rsv-person">
						<span class="left-side"> 
							<input type="text" value="0" readonly="readonly" class="rsv-num" name="chdNum">
						</span> 
						<span class="right-side"> 
							<span class="rsv-button-plus" id="chdAdd"> 
								<!-- 어린이 인원 증가 background로 버튼 넣기  -->
							</span> 
							<span class="rsv-button-minus" id="chdSub"> 
								<!-- 어린이 인원 감소 background로 버튼 넣기  -->
							</span>
						</span>
					</div>
				</div>
		
				<div class="rsv-date">
					<button class="btn-Search" type="button">검색</button>
				</div>
			</div>
			<!-- 날짜설정 영역 끝 -->
			
			<!-- 객실 리스트 영역 -->
			<div class="rsv-date-bottom">
				<div class="rsv-result-wrap">
					<div class="rsv-result">
						<div class="rsv-result-title">
							<span>ROOM LIST</span>
							
						</div>
						
						<h2>예약을 원하시는 호텔, 날짜, 인원을 선택 후 검색 버튼을 눌러주세요.</h2>
						
						<div class="rsv-result-list-wrap">
							<h2>원하시는 방과 옵션을 선택해주세요.</h2>
							<input type="hidden" name="roomCate">
							<input type="hidden" name="roomNum">
							<ul class="rsv-result-list-top">
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>스탠다드</span>
								</li>
		
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>디럭스</span>
								</li>
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>테라스</span>
								</li>
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>프리미어</span>
								</li>
							</ul>
							
							<div class="option-choice-wrap" id="choice-top">
								<ul class="result-sub-list">

								</ul>
								<div class="available-result">
									<span class='available-room-amount'></span>
									<input type='submit' value='예약'>
								</div>
							</div>
							
							<ul class="rsv-result-list-bottom">
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>프리미어 테라스</span>
								</li>
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>퍼시픽 디럭스</span>
								</li>
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>로열 스위트</span>
								</li>
								<li>
									<a>
										<img src="images/rsv-img/test.jpg">
									</a>
									<span>프레지덴셜 스위트</span>
								</li>
							</ul>		
							
							<div class="option-choice-wrap" id="choice-bottom">
								<ul class="result-sub-list">

								</ul>
								<div class="available-result">
									<span class='available-room-amount'></span>
									<input type='submit' value='예약'>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 객실 리스트 영역 끝 -->
		</div>
	</div>
</form>	

<%@ include file="/WEB-INF/view/include/footer.jsp"%>