<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<style>
	#pListWrap {
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
	#p_table img{
		width:150px;
	}
	select{
		padding:5px;
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
	}
	.btn:hover{
		color:rgba(250, 236, 197, 0.8);
	}
	/* ------- 삭제하기 버튼 ------- */
	.btnDelete{
		background:rgba(71, 163, 218, 0.8);
	}
</style>
<script>
	$(function(){
		// 삭제하기
		$(document).on("click", ".btnDelete", function(){
			// 삭제버튼 클릭 시 한번 더 확인하기
			if(confirm("정말 삭제하시겠습니까?") == true){
				$(this).parent().parent().remove();
			}else{
				return false;
			}
			
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
			
		})
		
		// 객실 분류 선택 시 해당 객실 리스트 나오게 하기
		$(document).on("change", "select[name='rcName']", function(){
			var rcNo = $(this).val();

			$.ajax({
				url:"${pageContext.request.contextPath }/picture/list.do",
				type:"post",
				data:{"rcNo" : rcNo},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(".allList").empty();
					$(".selectedList").remove();
					$(res.postList).each(function(i, obj){
						var $td_img = $("<td>");
						var $img = $("<img>").attr("src", "${pageContext.request.contextPath }/upload/" + obj.picFile); // 사진 
						$td_img.append($img); 
						
						var $td_file = $("<td>").append(obj.picFile); // 파일명	
						var $td_gName = $("<td>").append(obj.gType.gName); // 갤러리 분류명(객실, 엑티비티, 다이닝 등)
						var $td_rcName = $("<td>").append(obj.roomCategory.rcName); // 객실 이름(스탠다드, 디럭스 등))
						
						var textArr = ["원본 이미지", "작은 이미지", "내용 이미지"];
						var $td_picCategory = $("<td>").append(textArr[obj.picCategory]); // obj.picCategory : 사진 구분(1, 2, 3); -> 원본이미지 : 0, 작은이미지 : 1, 내용이미지 : 2

						var $btn = $("<button>").addClass("btnDelete btn").attr("data-picFile", obj.picFile).append("삭제");
						var $td_btn = $("<td>").append($btn);
							
						var $tr = $("<tr>").addClass("selectedList");
						$tr.append($td_img).append($td_file).append($td_gName).append($td_rcName).append($td_picCategory).append($td_btn);
						
						$("#p_table").append($tr);
						//$(".allList").css("display", "none"); // select 선택 시 기본 리스트 지워지기
					
					
					})// each
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
		}) 
	})
	
</script>
	<h2 style="margin-bottom:10px;">사진 관리(객실 사진)</h2>
<div id="pListWrap">
	
	<div id="clickHeader">
		<a href="${pageContext.request.contextPath }/picture/insert.do">객실 사진 등록하기</a> 	
	</div>
	
	<table id="p_table">
		<tr>
			<th rowspan="2">사진</th>
			<th rowspan="2">파일명</th>
			<th rowspan="2">갤러리분류</th><!-- 분류명 들어와야함. -->
			<th style="border-bottom:none;">객실분류</th>
			<th rowspan="2">파일분류</th>
			<th rowspan="2">관리</th>
		</tr>
		<tr><!-- 객실분류 -->
			<th style="border-top:none;">
				<select name="rcName">
					<option selected="selected" value="0">전체보기</option>
					<c:forEach var="rc" items="${rc }">
						<option value="${rc.rcNo }">${rc.rcName }</option>
					</c:forEach>
				</select>
			</th>
		</tr>
		
		<c:forEach var="getList" items="${getList }">
			<tr class="allList">
				<td><img src="${pageContext.request.contextPath }/upload/${getList.picFile }"></td>
				<td>${getList.picFile }</td> 
				<td>${getList.gType.gName }</td>
				<td>${getList.roomCategory.rcName }</td>
				<td>
					<c:choose>
						<c:when test="${getList.picCategory == '1'}">
							작은 이미지
						</c:when>
						<c:when test="${getList.picCategory == '0'}">
							원본 이미지
						</c:when>
						<c:when test="${getList.picCategory == '2'}">
							내용 이미지
						</c:when>
					</c:choose>
				</td>
				<td>
					<button class="btnDelete btn" data-picFile="${getList.picFile }">삭제</button> 
				</td>
			</tr>
		</c:forEach> 
		
	</table>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
