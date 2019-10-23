<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep1.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/rsv/rsvStep1.js"></script>

<!-- 예약 1단계 -->
<div class="rsv-step-wrap">
	<span> 
		<!-- background로 step 넣기 -->
	</span>
</div>

<div class="rsv-date-wrap">
	<div class="rsv-date-inner">
		<div class="rsv-date-top">
			<div class="rsv-date" id="rsv-hotel">
				<span class="ck-title">호텔</span>
				<div>호호호호호텔</div>
			</div>
	
			<div class="rsv-date">
				<span class="ck-title">체크인</span>
	
				<div class="ck-date" id="ckIn-info">
					<span class="left-side"> 
						<span class="rsv-year">2019</span> 
						<span class="rsv-month">02</span>
					</span> 
					<span class="right-side"> 
						<span class="rsv-date">32</span>
					</span>
				</div>
			</div>
	
			<div class="rsv-date">
				<span class="ck-title">체크아웃</span>
	
				<div class="ck-date" id="ckOut-info">
					<span class="left-side"> 
						<span class="rsv-year">2019</span> 
						<span class="rsv-month">02</span>
					</span> 
					<span class="right-side"> 
						<span class="rsv-date">33</span>
					</span>
				</div>
			</div>
	
			<div class="rsv-date">
				<span class="ck-title">성인</span>
				<div class="rsv-person">
					<span class="left-side"> 
						<span class="rsv-num">1</span>
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
						<span class="rsv-num">0</span>
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
	
			<a href="#" class="btn-Search"> 
				<!-- 검색버튼 background -->
			</a>
		</div>
		<!-- 날짜설정 영역 끝 -->
		
		<!-- 객실 리스트 영역 -->
		<div class="rsv-date-bottom">
			<div class="rsv-result-wrap">
				<div class="rsv-result">
					<div class="rsv-result-title">
						<span>ROOM LIST</span>
					</div>
					
					<div class="rsv-result-list-wrap">
						<h2>예약을 원하시는 날짜, 인원을 선택 후 검색 버튼을 눌러주세요.</h2>
						<ul class="rsv-result-list"> <!-- 이 ul에 li가 추가되는 형식으로 -->
							<li>
								<div class="rsv-detail">
									<div class="rsv-detail-left">
										<div class="rsv-detail-img">
											<img src="${pageContext.request.contextPath}/images/rsv-img/test.jpg">
										</div>
												
										<div class="rsv-detail-name">
											<dl class="rsv-name-list">
												<dt>Standard</dt>
												<dd>크기: <span>40</span>㎡</dd>
												<dd>전망: <span>산, 정원</span></dd>
											</dl>
										</div>
										
									</div>
											
									<div class="rsv-detail-right">
										<div class="rsv-detail-price">
											<span class="rsv-price-price">280,000~</span>
											<span>원/1박</span>
										</div>
												
										<div class="rsv-detail-btn">
											<a href="#">
												<span>
												<!-- background로 버튼 넣기 -->
												</span>
											</a>
										</div>
									</div>
											
									<div class="rsv-detail-tab">
										<div class="rsv-tab-list">
											<ul>
												<li>
													<span class="tab-list-left">
														<span class="tab-list-view">Mountain</span> /
														<span class="tab-list-room-type">Double</span>
													</span>
													<span class="tab-list-right">
														<span><span class="tab-list-price">280,000</span> 원~</span>
														<input type="radio" class="tab-room" name="tab-room">
													</span>
												</li>
											</ul>
										</div>
												
										<div class="rsv-tab-btn">
											<a href="#">
												<span>
													<!-- background로 버튼 넣기 -->
												</span>
											</a>
										</div>
									</div>
								</div>
							</li>
						</ul>			
					</div>
				</div>
			</div>
		</div>
		
		<!-- 객실 리스트 영역 끝 -->
		
	</div>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>