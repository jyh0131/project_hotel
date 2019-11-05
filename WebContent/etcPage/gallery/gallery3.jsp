<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" rel="stylesheet">
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
	ul.slide-title {
		width: 100%;
		overflow: hidden;
	}
	ul.slide-title > li {
		padding: 20px 20px 10px;
		width: 80px;
		float: left; 
		background: #47a3da;
		border-radius: 15px 15px 0 0;
		border-bottom: 10px solid rgb(245,219,189);
		text-align: center;
		color: #eaeaea;
		cursor: pointer;
	}
	ul.slide-title > li > a {
		color: #eaeaea;
	}
	.cc {
		background: rgb(245,219,189) !important;
		border-bottom: 10px solid #47a3da !important;
	}
	.cc > a {
		color: #353535 !important;
	}
	.bxslider img {
		width: 1000px;
	}
</style>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
    $(document).ready(function(){
      $('.bxslider').bxSlider({
          auto: true,
          autoControls: true,
          stopAutoOnClick: true,
          pager: true,
          adaptiveHeight: true,
          slideWidth: "1000px"
      });

    });
</script>
<div class="gal-wrap">
	<input type="hidden" value="${pageContext.request.contextPath}" id="conPath">
	<div class="gal-menu-wrap">
		<ul class="gal-menu">
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery1.jsp">사진</a></li>
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/video.jsp">동영상</a></li>
		</ul>
	</div>
	
	<div class="gal-slide-wrap">
		<ul class="slide-title">
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery1.jsp">객실</a></li>
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery2.jsp">다이닝</a></li>
			<li class="cc"><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery3.jsp">액티비티</a></li>
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery4.jsp">부대시설</a></li>
			<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery5.jsp">기타</a></li>
		</ul>
		
		<div class="bxslider">
			<c:forEach begin="1" end="14" var="i">
				<div><img src="${pageContext.request.contextPath}/upload/gallery/activity/activity${i}.jpg"></div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>