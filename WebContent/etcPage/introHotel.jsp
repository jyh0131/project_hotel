<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.intro-hotel-wrap {
		width: 100%;
		height: 100%;
		overflow: hidden;
		padding: 100px 0 150px;
	}
	div.intro-img {
		width: 50%;
		height: 600px;
		background: url("../images/bg-img/intro-bg.jpg") no-repeat;
		background-size: cover;
		float: left;
	}
	div.intro-content {
		width: 30%;
		padding: 50px 30px;
		float: right;
		margin-right: 90px;
		text-align: right;
	}
	div.intro-content > h2 {
		color: #47a3da;
		font-weight: lighter;
		letter-spacing: 0.15em;
		font-size: 3em;
		margin-bottom: 20px;
		border-bottom: 5px solid #47a3da;
	}
	div.intro-content > p {
		font-size: 14px;
		line-height: 35px;
		color: #a5a5a5;
	}
</style>


<div class="intro-hotel-wrap">
	<div class="intro-img"></div>
	<div class="intro-content">
		<h2>BLUA LUNDO</h2>
		<p>
			BLUA LUNDO는 에스페란토어로, <br>영어로 번역하자면 blue monday라는 뜻이다<br>
			현대를 살아가는 우리에게<br>가장 우울한 요일을묻는다면<br>대다수는 주저않고 월요일을 말할 것이다<br>
			주말은 신데렐라의 호박마차처럼 순식간에 사라지고,<br>남은 것은 먼지나는 현실의 시작이지만<br>
			이 곳에서만큼은 우울한 월요일은 존재하지 않기를<br>바라는 마음으로 호텔 이름을 지었다
		</p>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>