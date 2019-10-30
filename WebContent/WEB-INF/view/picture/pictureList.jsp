<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	table, td{
		border:1px solid black;
		border-collapse: collapse;
	}
	#p_table img{
		width:150px;
	}
</style>
<script>
	$(function(){
		$(".p_btn_delete").click(function(){
			var picFile = $(this).attr("data-picFile"); 
			
			$.ajax({
				url:"${pageContext.request.contextPath }/picture/delete.do",
				type:"get",
				data:{"pic_file" : picFile},
				dataType:"json",
				success:function(res){
					console.log(res);
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			$(this).parent().parent().remove();
		})//.p_btn_delete
	})
</script>
<div>
	<div id="p_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/picture/list.do">사진 리스트 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/picture/insert.do">객실 사진 등록하기</a></li>
		</ul> 	
	</div>
	
	<table id="p_table">
		<tr>
			<td>사진</td>
			<td>파일명</td>
			<td>갤러리분류</td><!-- 분류명 들어와야함. -->
			<td>객실분류</td>
			<td>파일분류</td>
			<td></td>
		</tr>
		<c:forEach var="pic" items="${list }">
			<tr>
				<td><img src="${pageContext.request.contextPath }/upload/${pic.picFile }"></td>
				<td>${pic.picFile }</td>
				<td>${pic.gType.gName }</td>
				<td>${pic.roomCategory.rcName }</td>
				<td>
					<c:choose>
						<c:when test="${pic.picCategory == '1'}">
							작은 이미지
						</c:when>
						<c:when test="${pic.picCategory == '2'}">
							원본 이미지
						</c:when>
						<c:when test="${pic.picCategory == '3'}">
							내용 이미지
						</c:when>
					</c:choose>
				</td>
				<td>
					<button class="p_btn_delete" data-picFile="${pic.picFile }">삭제</button>
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