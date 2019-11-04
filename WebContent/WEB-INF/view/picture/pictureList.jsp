<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetMain.css" rel="stylesheet" type="text/css">
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
		// 삭제하기
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
						
						if(rcNo != 0){// select가 '전체보기'가 아닐 때
							var $td_img = $("<td>");
							var $img = $("<img>").attr("src", "${pageContext.request.contextPath }/upload/" + obj.picFile); // 사진 
							$td_img.append($img); 
							
							var $td_file = $("<td>").append(obj.picFile); // 파일명	
							var $td_gName = $("<td>").append(obj.gType.gName); // 갤러리 분류명(객실, 엑티비티, 다이닝 등)
							var $td_rcName = $("<td>").append(obj.roomCategory.rcName); // 객실 이름(스탠다드, 디럭스 등))
							
							var textArr = ["작은 이미지", "원본 이미지", "내용 이미지"];
							var $td_picCategory = $("<td>").append(textArr[obj.picCategory]); // obj.picCategory : 사진 구분(1, 2, 3);

							var $btn = $("<button>").addClass("p_btn_delete").attr("data-picFile", obj.picFile).append("삭제");
							
							var $tr = $("<tr>").addClass("selectedList");
							$tr.append($td_img).append($td_file).append($td_gName).append($td_rcName).append($td_picCategory).append($btn);
							
							$("#p_table").append($tr);
						}else{// select가 '전체보기'일 때
							
							var $td_img = $("<td>");
							var $img = $("<img>").attr("src", "${pageContext.request.contextPath }/upload/" + obj.picFile); // 사진 
							$td_img.append($img); 
							
							var $td_file = $("<td>").append(obj.picFile); // 파일명	
							var $td_gName = $("<td>").append(obj.gType.gName); // 갤러리 분류명(객실, 엑티비티, 다이닝 등)
							var $td_rcName = $("<td>").append(obj.roomCategory.rcName); // 객실 이름(스탠다드, 디럭스 등))
							
							var textArr = ["작은 이미지", "원본 이미지", "내용 이미지"];
							var $td_picCategory = $("<td>").append(textArr[obj.picCategory]); // obj.picCategory : 사진 구분(1, 2, 3);

							var $btn = $("<button>").addClass("p_btn_delete").attr("data-picFile", obj.picFile).append("삭제");
							
							var $tr = $("<tr>").addClass("selectedList");
							$tr.append($td_img).append($td_file).append($td_gName).append($td_rcName).append($td_picCategory).append($btn);
							
							$("#p_table").append($tr);
						}
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
<div>
	<div id="p_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/picture/list.do">사진 리스트 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/picture/insert.do">객실 사진 등록하기</a></li>
		</ul> 	
	</div>
	<h2>객실 사진 리스트</h2>
	<table id="p_table">
		<tr>
			<td>사진</td>
			<td>파일명</td>
			<td>갤러리분류</td><!-- 분류명 들어와야함. -->
			<td>
				<select name="rcName">
					<option selected="selected" value="0">전체보기</option>
					<c:forEach var="rc" items="${rc }">
						<option value="${rc.rcNo }">${rc.rcName }</option>
					</c:forEach>
				</select>
			</td>
			<td>파일분류</td>
			<td></td>
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
						<c:when test="${getList.picCategory == '3'}">
							내용 이미지
						</c:when>
					</c:choose>
				</td>
				<td>
					<button class="p_btn_delete" data-picFile="${getList.picFile }">삭제</button> 
				</td>
			</tr>
		</c:forEach> 
		
	</table>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
