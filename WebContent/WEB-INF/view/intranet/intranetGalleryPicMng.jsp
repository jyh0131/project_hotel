<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<style>
	div.gal-list-wrap {
		width: 100%;
	}
	div.gal-state-wrap {
		width: 90%;
		margin: 0 auto;
		text-align: right;
	}
	div.gal-state-wrap > select {
		padding: 5px;
		margin: 30px 0 5px;
	}
	div.gal-list-content > table {
		width: 90%;
		margin: 0 auto;
		border-collapse: collapse;
		text-align: center;
	}
	div.gal-list-content > table th {
		background: #47a3da;
		color: white;
		padding: 10px;
	}
	div.gal-list-content > table td {
		padding: 15px 10px;
	}
	div.gal-list-content > table img {
		width: 400px;
	}
	.c1 {width: 50%;}
	.c2 {width: 20%;}
	.c3 {width: 20%;}
	.c4 {width: 10%;}
	.c-b {border-bottom: 1px solid #47a3da;}
	button {padding: 10px;}
	.centerAlign {text-align: center;}
	/* 삭제하기 버튼 */
	.btn{
		width:70px;
		padding:10px 0;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(250, 236, 197, 0.8);
		border:1px solid #FFE5CA;
		border:none;
		font-size: 16px;
	}
	.btn:hover{
		color:rgba(71, 163, 218, 0.8);;
	}
</style>
<script src="${pageContext.request.contextPath}/js/intranet/intranetGalleryPicMng.js"></script>

<h2>갤러리 사진 리스트</h2>

<div class="gal-list-wrap">
	<div class="gal-state-wrap">
		<select class="gal-state">
			<option value="0">전체 보기</option>
			<option value="1">객실</option>
			<option value="2">다이닝</option>
			<option value="3">액티비티</option>
			<option value="4">부대시설</option>
			<option value="5">기타</option>
		</select>
	</div>
	
	<div class="gal-list-content">
		<input type="hidden" value="${pageContext.request.contextPath}" id="conPath">
		<table>
			<tr>
				<th class="c1">사진</th>
				<th class="c2">파일명</th>
				<th class="c3">카테고리</th>
				<th class="c4"></th>
			</tr>	
			
			<c:forEach var="pic" items="${list}">
				<tr class='c-b'>
					<td><img src="${pageContext.request.contextPath}/upload/gallery/${pic.gType.gPath }/${pic.picFile}"></td>
					<td>${pic.picFile}</td>
					<td>${pic.gType.gName}</td>
					<td>
						<button class="btnDelete btn" data-picFile="${pic.picFile }">삭제</button> 
					</td>
				</tr>
			</c:forEach>	
		</table>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
