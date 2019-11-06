<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	#qbListWrap {
		width: 1000px;
		margin: 0 auto;
	}
	
	a {
		color: black;
	}
	
	h1 {
		margin: 10px 0;
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
	/* ------------ 구분 select, 전체보기, 내 문의 보기 버튼 ------------  */
	#clickHeader {
		margin: 20px 0;
	}
	
	#clickHeader p { /* 구분 :  */
		display: inline-block;
		font-weight: bold;
		font-size: 20px;
		padding: 5px;
	}
	
	select {
		padding: 10px;
	}
	
	#clickHeader>div { /* 버튼 있는 box */
		float: right;
	}
	
	.btn {
		width: 100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color: black;
		background: rgba(250, 236, 197, 0.8);
		border: 1px solid #FFE5CA;
		margin-left: 15px;
		font-size: 16px;
	}
	
	.btn:hover {
		cursor: pointer;
	}
</style>
<script>
	$(function(){
		$(".btnAllList").css("background", "rgba(71, 163, 218, 0.8)");
		
		//날짜포맷 메소드
		function dateFormat(time) {
			var date = new Date(time);
			
			if(date.getDate() < 10){
				var d = "0" + date.getDate();
			}else{
				var d = date.getDate();
			}
			return date.getFullYear() + "-" + (date.getMonth()+1) + "-" + d;
		}
		
		// 내 문의글 보기 클릭 시
		$(".btnMyList").click(function(){
			$(this).css("background", "rgba(71, 163, 218, 0.8)");
			$(".btnAllList").css("background", "rgba(250, 236, 197, 0.8)");
			
			var mId = $(this).attr("data-id");

			$.ajax({
				url:"${pageContext.request.contextPath }/qb/list.do",
				type:"post",
				data:{"mId":mId},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(".selectedList").remove(); // 내 문의글 리스트
					$(".qbListTr").remove(); // 기존에 나와있는 전체리스트
					
					$(res.idList).each(function(i, obj){
						var $td_no = $("<td>").append(obj.qbNo);
						
						var category = "";
						if(obj.qbCategory == 1){
							category = "결제 문의"; 
						}else if(obj.qbCategory == 2){
							category = "예약 문의"; 
						}else if(obj.qbCategory == 3){
							category = "객실 문의"; 
						}else if(obj.qbCategory == 4){
							category = "시설 및 옵션 문의"; 
						}else if(obj.qbCategory == 5){
							category = "기타 문의"; 
						}
						
						var $td_category = $("<td>").append(category);
						
						var href = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
						var $a = $("<a>").attr("href", href).append(obj.qbTitle);
						var $td_title = $("<td>").append($a);
						var $td_name = $("<td>").append(obj.qbName);
						var $td_date = $("<td>").append(dateFormat(obj.qbDate));
						
						var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date);
						$("#qbListTable").append($tr);
						
					})  
					
				},
				error:function(e){
					console.log(e);
				}
				
			})//ajax
			
		})//.btnMyList
		
		
		// 전체 보기 클릭 시
		$(".btnAllList").click(function(){
			$(this).css("background", "rgba(71, 163, 218, 0.8)");
			$(".btnMyList").css("background", "rgba(250, 236, 197, 0.8)");
			
			var mId = $(this).attr("data-id");
			
			$.ajax({
				url:"${pageContext.request.contextPath }/qb/allList.do",
				type:"get",
				data:{"mId":mId},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(".selectedList").remove(); // 내 문의글 리스트
					$(".qbListTr").remove(); // 기존에 나와있는 전체리스트
					
					$(res.allList).each(function(i, obj){
						var $td_no = $("<td>").append(obj.qbNo);
						
						var category = "";
						if(obj.qbCategory == 1){
							category = "결제 문의"; 
						}else if(obj.qbCategory == 2){
							category = "예약 문의"; 
						}else if(obj.qbCategory == 3){
							category = "객실 문의"; 
						}else if(obj.qbCategory == 4){
							category = "시설 및 옵션 문의"; 
						}else if(obj.qbCategory == 5){
							category = "기타 문의"; 
						}
						
						var $td_category = $("<td>").append(category);
						
						var href = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
						var $a = $("<a>").attr("href", href).append(obj.qbTitle);
						var $td_title = $("<td>").append($a);
						var $td_name = $("<td>").append(obj.qbName);
						var $td_date = $("<td>").append(dateFormat(obj.qbDate));
						
						var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date);
						$("#qbListTable").append($tr);
						
					})   
					
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
		})//.btnAllList
		
		
		// select
		$(document).on("change", "select[name='selectCategory']", function(){
			var category = $(this).val();
			//var mId = $(this).attr("data-id");

			$.ajax({
				url:"${pageContext.request.contextPath }/qb/categoryList.do",
				type:"get",
				data:{"category":category},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(".selectedList").remove(); // 내 문의글 리스트
					$(".qbListTr").remove(); // 기존에 나와있는 전체리스트
					
					
					$(res.allList).each(function(i, obj){
					
						var textArr = ["전체보기", "결제 문의", "예약 문의", "객실 문의", "시설 및 옵션 문의", "기타 문의"];
						var nCategory = Number(category);
						
						if(category == "0"){//select가 '전체보기'일 때
							var $td_no = $("<td>").append(obj.qbNo);
							var $td_category = $("<td>").append(obj.qbCategory);
							
							var href = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", href).append(obj.qbTitle);
							var $td_title = $("<td>").append($a);
							var $td_name = $("<td>").append(obj.qbName);
							var $td_date = $("<td>").append(dateFormat(obj.qbDate));
							
							var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date);
							$("#qbListTable").append($tr);
						}else{
							var $td_no = $("<td>").append(obj.qbNo);
							
							
							var $td_category = $("<td>").append(textArr[obj.qbCategory]);
							
							var href = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", href).append(obj.qbTitle);
							var $td_title = $("<td>").append($a);
							
							var $td_name = $("<td>").append(obj.qbName);
							var $td_date = $("<td>").append(dateFormat(obj.qbDate));
							
							var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date);
							$("#qbListTable").append($tr);
						}
						
					})//each  
					
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
		})//.change
		
	})
</script>
<div id="qbListWrap">
	<h1>문의하기</h1>
	<div id="clickHeader">
		<p>구분 :</p>
		<select name="selectCategory">
			<option value=0 selected="selected">전체 보기</option>
			<option value=1>결제 문의</option>
			<option value=2>예약 문의</option>
			<option value=3>객실 문의</option>
			<option value=4>시설 및 옵션 문의</option>
			<option value=5>기타 문의</option>
		</select>
		<div><!-- 회원일 경우 -->
			<a data-id="${Auth }" class="btnMyList btn">내 문의 보기</a> 
			<a class="btnAllList btn">전체 보기</a>
			<c:if test="${Auth != null }">
				<a href="${pageContext.request.contextPath }/qb/insert.do?mId=${Auth}" class="btn">글쓰기</a>
			</c:if>
		</div>
	</div>
	<table id="qbListTable">
		<tr>
			<th>글번호</th>
			<th>구분</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<c:if test="${Admin != null }">
				<th>관리</th>
			</c:if>
		</tr>

		<c:forEach var="list" items="${list }">
			<input type="hidden" value="${list.member.mId }" name="mId">
			<tr class="qbListTr">
				<td>${list.qbNo }</td>
				<td>
					<c:if test="${list.qbCategory == 1}">
						결제 문의
					</c:if>
					<c:if test="${list.qbCategory == 2}">
						예약 문의
					</c:if>
					<c:if test="${list.qbCategory == 3}">
						객실 문의
					</c:if>
					<c:if test="${list.qbCategory == 4}">
						시설 및 옵션 문의
					</c:if>
					<c:if test="${list.qbCategory == 5}">
						기타 문의
					</c:if>
				</td>
				<td><!-- 제목 -->
					<!-- 관리자 아닐 경우 -->
					<c:if test="${Auth != null }">
						<a href="${pageContext.request.contextPath }/qb/detail.do?qbNo=${list.qbNo }">${list.qbTitle }</a>
						<!-- 답변이 있을 경우 -->
						<%-- <c:if test="${list.result == 1 }">
								<p>답변</p>
							</c:if> --%>
					</c:if> <!-- 관리자일 경우 --> <c:if test="${Admin != null }">
						<a href="${pageContext.request.contextPath }/qr/detail.do?qbNo=${list.qbNo }">${list.qbTitle }</a>
					</c:if>
				</td>
				<td>${list.qbName }</td>
				<td><fmt:formatDate value="${list.qbDate}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
	</table>

</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
