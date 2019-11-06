<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<style>
	#roomListWrap {
		width: 100%;
		margin: 0 auto;
	}
	a {
		color: black;
	}
	table {
		margin-top: 10px;
		width: 100%;
	}
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
	th {
		background: rgba(255, 167, 167, 0.5);
	}
	tr:hover>td {
		background: #EAEAEA;
	}
	/* ------------ 객실등록하기 버튼 ------------  */
	#clickHeader a { 
		float:right;
		background: rgba(255, 167, 167, 0.5);
		width:150px;
		line-height:40px;
		text-align: center;
		font-weight: bold;
		margin-bottom:20px;
		margin-right:5px;
		border-radius: 3px;
		box-shadow: 3px 3px 10px 0.2px #BDBDBD;
		padding:5px;
	}
	#clickHeader a:hover{
		font-size: 17px; 
	}
	/* ------- 삭제하기, 수정하기 버튼 ------- */
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
		cursor: pointer;
	}
	.btnUpdate{
		background:rgba(250, 236, 197, 0.8);
	}
	/* ------- 삭제하기 버튼 ------- */
	.btnDelete{
		background:rgba(71, 163, 218, 0.8);
	}
</style>
<script>
	$(function(){
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		var price = addComma($(".price").text());
		$(".price").text(price);
		
		
		
		$(".btnDelete").click(function(){
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
			
			// 삭제버튼 클릭 시 한번 더 확인하기
			if(confirm("정말 삭제하시겠습니까?") == true){
				$(this).parent().parent().remove();
			}else{
				return false;
			}
			
			
		})//.btnDelete
		
	})
</script>
<div id="roomListWrap">
	<h1>객실 리스트</h1>
	<div id="clickHeader">
		<a href="${pageContext.request.contextPath }/room/insert.do">객실 등록하기</a>
		<%-- <a href="${pageContext.request.contextPath }/picture/list.do">사진관리하기(사진 리스트로 이동)</a> --%>	
	</div>
	
	<table>
		<tr>
			<th>호수</th>
			<th colspan="2">객실 분류</th>
			<th>전망 타입</th>
			<th>침대 타입</th>
			<th>객실 크기</th>
			<th>가격</th>
			<th>관리</th>
		</tr>
		<c:forEach var="room" items="${list }">
			<tr>
				<td>${room.roomNo }</td>
				<td>${room.roomCategory.rcName }</td>
				<td>${room.roomCategory.rcEngName }</td>
				<td>${room.viewType.vtName }</td>
				<td>${room.bedType.btName }</td>
				<td>${room.roomSize.rsName }</td>
				<td>
					<fmt:formatNumber value="${room.roomPrice }" pattern="###,###"/>원
				</td>
					<%-- <c:forEach var="pic" items="${picture }">
						<img src="${pageContext.request.contextPath }/upload/${pic.picture.file }">
						<td><p>${pic.picture.file }</p></td> 
					</c:forEach> --%>
				
				<td class="btnBox">
					<a href="${pageContext.request.contextPath }/room/update.do?rNo=${room.roomNo}" class="btnUpdate btn">수정</a>
					<button class="btnDelete btn" data-rNo="${room.roomNo }">삭제</button>
				</td>			
			</tr>
		</c:forEach>
	</table>
	
	<!-- <a href="${pageContext.request.contextPath }/picture/list.do?rNo=${room.roomNo}" class="picture_view">사진관리하기</a> -->

</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>

