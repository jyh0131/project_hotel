<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv.css" rel="stylesheet" type="text/css">

<div class="rsv-step-wrap">
	<span> <!-- background로 step 넣기 -->
	</span>
</div>

<div class="rsv-date-wrap">
	<div class="rsv-date-inner">
		<div class="rsv-date" id="rsv-hotel">
			<span class="ck-title">호텔</span>
			<div>호호호호호텔</div>
		</div>

		<div class="rsv-date">
			<span class="ck-title">체크인</span>

			<div class="ck-date" id="ckIn-info">
				<span class="left-side"> <span class="rsv-year">2019</span> <span
					class="rsv-month">02</span>
				</span> <span class="right-side"> <span class="rsv-date">32</span>
				</span>
			</div>
		</div>

		<div class="rsv-date">
			<span class="ck-title">체크인</span>

			<div class="ck-date" id="ckOut-info">
				<span class="left-side"> <span class="rsv-year">2019</span> <span
					class="rsv-month">02</span>
				</span> <span class="right-side"> <span class="rsv-date">33</span>
				</span>
			</div>
		</div>

		<div class="rsv-date">
			<span class="ck-title">성인</span>
			<div class="rsv-person">
				<span class="left-side"> <span class="rsv-num">1</span>
				</span> <span class="right-side"> <span class="rsv-button-plus"
					id="adtAdd"> <!-- background로 버튼 넣기  -->
				</span> <span class="rsv-button-minus" id="adtSub"> <!-- background로 버튼 넣기  -->
				</span>
				</span>
			</div>
		</div>

		<div class="rsv-date">
			<span class="ck-title">어린이</span>
			<div class="rsv-person">
				<span class="left-side"> <span class="rsv-num">0</span>
				</span> <span class="right-side"> <span class="rsv-button-plus"
					id="chdAdd"> <!-- background로 버튼 넣기  -->
				</span> <span class="rsv-button-minus" id="chdSub"> <!-- background로 버튼 넣기  -->
				</span>
				</span>
			</div>
		</div>

		<a href="#" class="btn-Search"> <!-- background로 버튼 넣기 -->
		</a>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>