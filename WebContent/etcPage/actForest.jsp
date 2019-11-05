<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.act-bg {
		width: 100%;
		height: 1000px;
		position: absolute;
		left: 0;
		top: -100px;
		background: url("../images/bg-img/act2-img1.jpg") no-repeat;
		background-size: cover;
		z-index: -2;
	}
	div.act-wrap {
		width: 100%;
		height: 500px;
		padding: 50px 0;
	}
	div.act-wrap > h1 {
		width: 60%;
		margin: 10px auto 40px;
		text-align: center;
		border-bottom: 5px solid #2C5927;
		font-size: 3em;
		color: #2C5927;
		font-weight: normal;
		letter-spacing: 0.05em;
	}
	#pp {
		text-align: center;
		font-size: 14px;
		line-height: 25px;
		color: #2C5927;
	}
</style>
<div class="act-bg"></div>
<div class="act-wrap">
	<h1>숲으로 수프로</h1>
	<div class="act-cotent">
		<p id="pp">
			깊은 숲 속으로 들어가서 길을 잃고 헤매다가<br>
			맛있는 냄새에 이끌려 찾아간 마녀의 집에서 먹는 수프 한 숟갈<br>
			누구나 한번쯤 꿈꿔왔던 그것을 완벽히 재현합니다<br>
			피톤치드를 애피타이져로 마시고 따끈한 수프로 배를 채우면<br>
			위장부터 영혼까지 만복 행복 이연복 탕수육
			<br><br>
			<small>체험 문의: BLUA LUNDO 프론트</small>
		</p>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>