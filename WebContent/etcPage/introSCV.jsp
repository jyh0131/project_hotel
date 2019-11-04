<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	@import url('https://fonts.googleapis.com/css?family=Poiret+One&display=swap');
	
	div.intro-scv-wrap {
		width: 100%;	
		padding: 60px 0 150px;
	}
	div.intro-content {
		overflow: hidden;
	}
	div.intro-content > h2 {
		width: 100%;
		text-align: center;
		font-size: 5em;
		color: #47a3da;
		font-family: 'Poiret One', cursive;
		letter-spacing: 0.05em;
	}
	div.intro-scv {
		width: 80%;
		border: 8px solid #47a3da;
		padding: 30px 40px;
		margin: 20px;
		border-radius: 0 50px 0 50px;
	}
	div#scv1 {
		float: left;
	}
	div#scv2 {
		float: right;
	}
	div#scv1-img {
		width: 260px;
		height: 260px;
		background: url("../images/bg-img/scv1.jpg") no-repeat;
		background-size: contain;
		float: left;
	}
	div#scv2-img {
		width: 260px;
		height: 260px;
		background: url("../images/bg-img/scv2.png") no-repeat;
		background-size: contain;
		float: left;
	}
	div#scv1-con, div#scv2-con {
		float: right;
	}
	div.intro-scv h3 {
		font-size: 3em;
		font-weight: lighter;
		margin: 0 0 50px 0;
	}
	div.intro-scv p {
		font-size: 17px;
		letter-spacing: 0.1em;
		line-height: 30px;
		margin-left: -10px;
	}
	div.intro-scv h5 {
		text-align: right;
		margin-top: 30px;
	}
</style>


<div class="intro-scv-wrap">
	<div class="intro-content">
		<h2>SCV of BLUA LUNDO</h2>
	
		<div class="intro-scv" id="scv1">
			<div id="scv1-img"></div>
			<div id="scv1-con">
				<h3>신천동 코딩머신 김핑구</h3>
				<p>
					특징: 손가락을 키보드에 갖다대면 자동으로 코드가 쳐짐.<br>혼수상태에서도 코딩이 가능하다는 소문이 있음.<br>
					
				</p>
				<h5>contact me🤑<br>gitHub: peeinnkim</h5>
			</div>
		</div>

		<div class="intro-scv" id="scv2">
			<div id="scv2-img"></div>
			<div id="scv2-con">
				<h3>신천동 데이터마스터 이피치</h3>
				<p>
					특징: 눈 감았다가 뜨면 엑셀 데이터 3,000라인이 완성되어 있음.<br>캐시미어 100%의 섬세함을 소유함.<br>
				</p>
				<h5>contact me😎<br>gitHub: jibell02</h5>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>