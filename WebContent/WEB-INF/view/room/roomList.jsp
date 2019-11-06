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
		
		
		$(document).on("change", "select[name='rcName']", function(){
			var rcName = $(this).val();
			
			$.ajax({
				url:"${pageContext.request.contextPath }/room/list.do",
				type:"post",
				data:{"rcName" : rcName},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(".allList").empty();
					$(".selectedList").remove();
					$(res.postList).each(function(i, obj){
						if(rcName != "전체보기"){// select가 '전체보기'가 아닐 때
							// td만들기
							var $td_rNo = $("<td>").append(obj.roomNo); // 호수
							var $td_rName = $("<td>").append(obj.roomCategory.rcName); // 객실 한글이름
							var $td_rcEngName = $("<td>").append(obj.roomCategory.rcEngName); // 객실 영어이름
							var $td_vtName = $("<td>").append(obj.viewType.vtName); // 객실 타입
							var $td_btName = $("<td>").append(obj.bedType.btName); // 침대 타입
							var $td_rsNo = $("<td>").append(obj.roomSize.rsNo); // 객실 사이즈
							var $td_rPrice = $("<td>").append(obj.roomPrice); // 가격
							
							// 삭제버튼
							var $btn_delete = $("<button>").addClass("btnDelete btn").attr("data-rNo", obj.roomNo).append("삭제");
							
							// 수정버튼
							var href = "${pageContext.request.contextPath }/room/update.do?rNo=";
							var $a_update = $("<a>").attr("href", href + obj.roomNo).addClass("btnUpdate btn").append("수정");

							// 버튼 td에 연결하기
							var $td_btn = $("<td>").addClass("btnBox").append($btn_delete).append($a_update);
							
							// tr만들어서 td연결하기
							var $tr = $("<tr>").addClass("selectedList");
							$tr.append($td_rNo).append($td_rName).append($td_rcEngName).append($td_vtName).append($td_btName).append($td_rsNo).append($td_rPrice).append($td_btn);
							
							// 테이블에 연결하기
							$("table").append($tr);
						}else{// select가 '전체보기'일 때
							
							
						}
						// 할일
						// 전체보기
						// select하고 삭제 안됨
						// select하고 버튼 css적용
						
					})// each
				},
				error:function(e){
					console.log(e);
				}
			})
			
		}) // ajax
		
		
		
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
			<th style="border-right:none;">객실 분류</th>
			<th style="border-left:none;">
				<select name="rcName">
					<option selected="selected" value="전체보기">전체보기</option>
					<c:forEach var="rcList" items="${rcList }">
						<option value="${rcList.rcName }">${rcList.rcName }</option>
					</c:forEach>
				</select>
			</th>
			<th>전망 타입</th>
			<th>침대 타입</th>
			<th>객실 크기</th>
			<th>가격</th>
			<th>관리</th>
		</tr>
		<c:forEach var="room" items="${list }">
			<tr class="allList">
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

