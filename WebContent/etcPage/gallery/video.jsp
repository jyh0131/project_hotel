<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.gal-wrap {
		width: 100%;
		padding: 50px 0;
		overflow: hidden;	
	}
	div.gal-menu-wrap {
		width: 18%;
		margin: 0 auto;
		float: left;
	}
	div.gal-menu-wrap > ul {
		padding: 30px;
		height: 350px;
		border: 8px solid #47a3da;
	}
	div.gal-menu-wrap > ul > li {
		text-align: center;
		height: 80px;
	}
	div.gal-menu-wrap > ul > li:hover > a {
		background: rgba(255,203,203,0.5);
	}
	div.gal-menu-wrap > ul > li > a {
		line-height: 80px;
		display: block;
		border-bottom: 1px solid #47a3da;
		color: #47a3da;
		font-size: 18px;
		letter-spacing: 0.15em;
	}
	div.gal-slide-wrap {
		width: 78%;
		float: right;
	}
	div.gal-slide-wrap > h2 {
		width: 40%;
		float: right;
		background: #47a3da;
		padding: 10px 40px 10px 0px;
		text-align: right;
		color: #eaeaea;
		font-weight: normal;
		lette-spcing: 0.15em;
		font-size: 2em;
		margin-bottom: 20px;
	}
	div.gal-slide-wrap > video {
		width: 75%;
		display: block;
		margin: 0 auto;
	}
	div.gal-slide-wrap > div.gal-slide-content > p {
		margin-top: 20px;
		text-align: center;
		font-size: 14px;
		line-height: 25px;
	}
</style>
<div class="gal-wrap">
	<input type="hidden" value="${pageContext.request.contextPath}" id="conPath">
	<div class="gal-menu-wrap">
		<ul class="gal-menu">
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery1.jsp">사진</a></li>
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/video.jsp">동영상</a></li>
		</ul>
	</div>
	
	<div class="gal-slide-wrap">
		<h2>동영상</h2>
		<video src="${pageContext.request.contextPath}/images/bg-img/video.mp4" controls="controls"></video>
		<div class="gal-slide-content">
			<p>
				동영상 메뉴를 만들어서 넣기는 해야하는데 넣을것도 없는 현실이 너무 슬픕니다<br>
				그렇다고 아무거나 넣었다가 저작권 문제로 고소당하고 싶지는 않고, 또 그렇다고 촌스러운건 싫은데<br>
				결국엔 이렇게 아무것도 아닌 영상을 넣게 되었습니다
			</p>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>