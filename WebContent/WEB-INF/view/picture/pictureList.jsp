<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	table, td{
		border:1px solid black;
		border-collapse: collapse;
	}
	#p_table img{
		width:250px;
	}
</style>
<div>
	<div id="p_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/picture/list.do">사진 리스트 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/picture/insert.do">사진 등록하기</a></li>
		</ul> 	
	</div>
	
	<table id="p_table">
		<tr>
			<td>사진</td>
			<td>파일명</td>
			<td>갤러리분류</td><!-- 분류명 들어와야함. -->
			<td>객실분류</td>
			<td></td>
		</tr>
		<c:forEach var="pic" items="${list }">
			<tr>
				<p style="display:none;">${pic.picNo }</p>
				<td><img src="${pageContext.request.contextPath }/upload/${pic.picFile }"></td>
				<td>${pic.picFile }</td>
				<td>${pic.gType.gName }</td>
				<td>${pic.roomCategory.rcName }</td>
				<td>
					<a href="${pageContext.request.contextPath }/room/update.do?rNo=${room.roomNo}" class="r_btn_update">수정</a>
					<button class="r_btn_delete" data-rNo="${room.roomNo }">삭제</button>
				</td>	
			</tr>
		</c:forEach>	
	</table>
	<%-- <ul>
		<c:forEach var="list" items="${list }">
			<li><img src="${pageContext.request.contextPath }/upload/${pic.picture.file }"></li>	
		</c:forEach>
	</ul> --%>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>