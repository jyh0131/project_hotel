<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv_form.css" rel="stylesheet" type="text/css">
<script>
	$(function(){
		$(".r_btn_delete").click(function(){
			var rNo = $(this).attr("data-rNo");

			$.ajax({
				url:"${pageContext.request.contextPath }/room/delete.do", 
				type:"get",
				data:{"rNo":rNo},
				dataType:"json",
				success:function(res){
					console.log(res);
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
			$(this).parent().parent().remove();
			
		})//.r_btn_delete
		
	})
</script>
<style>
	table, td{
		border:1px solid black;
		border-collapse: collapse;
	}
</style>
<div> 
	<div id="r_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/room/insert.do">객실 등록하기</a></li>
			<li><a href="${pageContext.request.contextPath }/picture/list.do">사진관리하기(사진 리스트로 이동)</a></li>
		</ul> 	
	</div>
	
	<table>
		<tr>
			<td>호수</td>
			<td colspan="2">객실 분류</td>
			<td>전망 타입</td>
			<td>침대 타입</td>
			<td>객실 크기</td>
			<td>가격</td>
			<td></td>
			<td></td>
		</tr>
		<c:forEach var="room" items="${list }">
			<tr>
				<td>${room.roomNo }</td>
				<td>${room.roomCategory.rcName }</td>
				<td>${room.roomCategory.rcEngName }</td>
				<td>${room.viewType.vtName }</td>
				<td>${room.bedType.btName }</td>
				<td>${room.roomSize.rsName }</td>
				<td>${room.roomPrice }</td>
					<%-- <c:forEach var="pic" items="${picture }">
						<img src="${pageContext.request.contextPath }/upload/${pic.picture.file }">
						<td><p>${pic.picture.file }</p></td> 
					</c:forEach> --%>
				
				<td>
					<a href="${pageContext.request.contextPath }/room/update.do?rNo=${room.roomNo}">수정</a>
					<button class="r_btn_delete" data-rNo="${room.roomNo }">삭제</button>
				</td>			
			</tr>
		</c:forEach>
	</table>
	
	<!-- <a href="${pageContext.request.contextPath }/picture/list.do?rNo=${room.roomNo}" class="picture_view">사진관리하기</a> -->
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>