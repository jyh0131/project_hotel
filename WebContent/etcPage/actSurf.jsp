<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.act-wrap {
		width: 100%;
		padding: 50px 0;
	}
	div.act-wrap > h1 {
		width: 60%;
		margin: 10px auto 40px;
		text-align: center;
		border-bottom: 5px solid #47a3da;
		font-size: 3em;
		color: #47a3da;
		font-weight: normal;
		letter-spacing: 0.05em;
	}
	div.act-content {
		width: 100%;
		overflow: hidden;
	}
	span.act-img {
		width: 100%;
		height: 400px;
		display: block;
		background: url("../images/bg-img/act-img2.jpg") no-repeat;
		background-size: cover;
	}
	div.act-content > img {
		width: 45%;
		height: 600px;
		float: left;
		margin-top: 30px;
	}
	div.act-info {
		width: 40%;
		float: right;
		padding: 60px;
		text-align: center;
		border: 5px solid #47a3da;
		margin-top: 30px;
	}
	div.act-info > h2 {
		font-weight: lighter;
		letter-spacing: 0.05em;
		margin-bottom: 25px;
	}
	div.act-info > p {
		line-height: 30px;
		font-size: 14px;
	}
	div.act-info2 {
		width: 40%;
		float: right;
		padding: 40px 60px;
		text-align: center;
		border: 5px solid #47a3da;
		margin-top: 30px;
	}
	div.act-info2 > h3 {
		font-weight: normal;
		letter-spacing: 0.05em;
		margin-bottom: 25px;
	}
	div.act-info2 > ul {
		font-size: 12px;
	}
	div.act-info2 > ul > li {
		margin: 5px 0;
	}
</style>


<div class="act-wrap">
	<h1>서핑 체험</h1>
	
	<div class="act-content">
		<span class="act-img"></span>
		<img src="${pageContext.request.contextPath}/images/bg-img/act-img1.jpg">
		
		<div class="act-info">
			<h2>망망대해에서 혼자가 되어보세요....</h2>
			<p>
				푸른 바다, 하얀 모래, 일렁이는 파도<br>
				모두 온전히 만끽하고 싶으신 회원님들께 추천합니다<br>
				호텔에서 직접 운영하는 서핑샵에서 진행하는 코스로<br>
				안전, 신뢰는 물론 합리적인 가격으로 제공됩니다<br>
				잊고 살았던 자신의 진짜 모습을 찾아<br>
				바다에서 미아가 되어 보세요
			</p>
		</div>
		
		<div class="act-info2">
			<h3>🌊 운영 일정 🤿</h3>
			<ul>
				<li>▪운영 시기: 해가 뜨고 달이 뜨는 날까지</li>			
				<li>▪체험 신청: BLUA LUNDO 프론트</li>			
				<li>▪체험 비용: 강습비 무료, 도구 대여비 별도</li>			
			</ul>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>