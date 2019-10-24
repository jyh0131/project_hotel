<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath}/css/datepicker.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep1.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/datepicker.en.js"></script>
<script src="${pageContext.request.contextPath}/js/rsv/rsvStep1.js"></script>


<!-- 예약 1단계 -->
<div class="rsv-step-wrap">
	<span> 
		<!-- background로 step 넣기 -->
	</span>
</div>

<form action="rsvStep1.do" method="post">
	<div class="rsv-date-wrap">
		<div class="rsv-date-inner">
			<div class="rsv-date-top">
				<div class="rsv-date" id="rsv-hotel">
					<span class="ck-title">호텔</span>
					<div>호호호호호텔</div>
				</div>
		
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
							<input type="text" value="1" readonly="readonly" class="rsv-num">
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
							<input type="text" value="1" readonly="readonly" class="rsv-num">
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
		
				<span href="#" class="btn-Search"> 
					<!-- 검색버튼 background -->
				</span>
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
								
							</ul>			
						</div>
					</div>
				</div>
			</div>
			<!-- 객실 리스트 영역 끝 -->
		</div>
	</div>
</form>	

<%@ include file="/WEB-INF/view/include/footer.jsp"%>