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
</style>
<script src="${pageContext.request.contextPath}/js/intranet/intranetGalleryPicMng.js"></script>

<h2>사진관리(갤러리 사진)</h2>

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
					<c:if test="${pic.gType.gNo == 1}">
						<td><img src="${pageContext.request.contextPath}/upload/gallery/room/${pic.picFile}"></td>
						<td>${pic.picFile}</td>
						<td>객실</td>
						<td>
							<button>버튼</button>
						</td>
					</c:if>
					
					<c:if test="${pic.gType.gNo == 2}">
						<td><img src="${pageContext.request.contextPath}/upload/gallery/dining/${pic.picFile}"></td>
						<td>${pic.picFile}</td>
						<td>다이닝</td>
						<td>
							<button>버튼</button>
						</td>
					</c:if>
					
					<c:if test="${pic.gType.gNo == 3}">
						<td><img src="${pageContext.request.contextPath}/upload/gallery/activity/${pic.picFile}"></td>
						<td>${pic.picFile}</td>
						<td>액티비티</td>
						<td>
							<button>버튼</button>
						</td>
					</c:if>
				
					<c:if test="${pic.gType.gNo == 4}">
						<td><img src="${pageContext.request.contextPath}/upload/gallery/sub_facilities/${pic.picFile}"></td>
						<td>${pic.picFile}</td>
						<td>부대시설</td>
						<td>
							<button>버튼</button>
						</td>
					</c:if>
					
					<c:if test="${pic.gType.gNo == 5} ">
						<td><img src="${pageContext.request.contextPath}/upload/gallery/etc/${pic.picFile}"></td>
						<td>${pic.picFile}</td>
						<td>기타</td>
						<td>
							<button>버튼</button>
						</td>
					</c:if>
				</tr>
			</c:forEach>	
		</table>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
