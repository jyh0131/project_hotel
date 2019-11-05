<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.act-wrap {
		width: 100%;
		padding: 50px 0;
		overflow: hidden;
	}
	div.act-wrap > h1 {
		width: 60%;
		margin: 10px auto 40px;
		text-align: center;
		border-bottom: 5px solid #47a3da;
		font-size: 3em;
		color: #47a3da;
		font-weight: lighter;
		letter-spacing: 0.05em;
	}
	div.act-img1 {
		width: 48%;
		height: 912px;
		background: url("../images/bg-img/act4-img1.jpg") no-repeat;
		background-size: cover;
		float: left;
	}
	div.act-img2 {
		width: 50%;
		height: 350px;
		background: url("../images/bg-img/act4-img2.jpg") no-repeat;
		background-size: cover;
		float: right;
	}
	div.act-img3 {
		width: 24%;
		height: 280px;
		background: url("../images/bg-img/act4-img3.jpg") no-repeat;
		background-size: cover;
		float: right;
		margin-left: 26px;
		margin-top: 26px;
	}
	div.act-img4 {
		width: 24%;
		height: 280px;
		background: url("../images/bg-img/act4-img4.jpg") no-repeat;
		background-size: cover;
		float: right;
		margin-top: 26px;
	}
	div.act-content {
		float: right;
		background: #47a3da;
		border: 10px solid rgba(245,219,189);
		padding: 30px 100px;
		margin-top: 26px;
	}
	div.act-content > p {
		text-align: center;
		font-size: 14px;
		line-height: 25px;
		color: #EAEAEA;
	}
</style>

<div class="act-wrap">
	<h1>전시 및 포토 스팟</h1>
	<div class="act-img1"></div>
	<div class="act-img2"></div>
	<div class="act-img3"></div>
	<div class="act-img4"></div>
	<div class="act-content">
		<p>
			기침과 감성은 감출 수가 없어서 힙이 흘러넘치는 전시를 준비했습니다<br>
			전시를 즐기고 온 생애를 걸쳐 다시 나올 수 없을 사진을 찍어보세요<br>
			사진에 자신이 없으신 분은 프론트에 문의해주시면<br>
			음식전문 사진작가가 여러분을 맛있게 찍어드립니다(비용 별도)<br><br>
			<small>전시는 상시 진행됩니다</small>
		</p>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>