<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	@import url('https://fonts.googleapis.com/css?family=Liu+Jian+Mao+Cao&display=swap');
	
	div.act-bg{
		width: 50%;
		height: 1000px;
		position: absolute;
		left: 0;
		top: 150px;
		background: #47a3da;
		z-index: -2;
	}
	div.act-wrap{
		width: 100%;
		height: 700px;
		padding: 50px 0;
	}
	div.act-wrap > h1 {
		font-family: 'Liu Jian Mao Cao', cursive;	
		font-size: 6em;
		position: absolute;
		left: 170px; 
		top: 350px;
		transform: rotate(-8deg);
		text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, 
					 -1px 1px 0 #fff, 1px 1px 0 #fff;  
	}
	div.act-img {
		width: 85%;
		height: 400px;
		margin: 0 auto;
		background: url("../images/bg-img/bg12.jpg") no-repeat;
		background-size: cover;
	}
	div.act-content > p {
		width: 50%;
		float: right;
		line-height: 40px;
		text-align: right;
		margin-top: 30px;
		margin-right: 100px;
		padding-right: 20px;
		border-right: 3px solid #47a3da;
		color: #666;
	}
</style>

<div class="act-bg"></div>
<div class="act-wrap">
	<div class="act-img"></div>
	<h1>a very merry unbirthday to you!</h1>
	<div class="act-content">
		<p>
			이상한 나라의 앨리스에서<br>
			unbirthday를 축하했듯이<br>
			우리도 우리의 아무것도 아닌 날들을<br>
			축하하면서 놀아봅시다<br><br>
			<small>참가 신청: BLUA LUNDO 프론트</small>
		</p>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>