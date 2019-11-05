<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	table{
		margin-top:10px;
		width:100%;
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:10px;
				text-align: center;
	}
	/* ------------ 전체보기, 내 문의 보기 버튼 ------------  */
	.btn{
		margin-top:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(250, 236, 197, 0.8);
		border:1px solid #FFE5CA;
	}
	.btn:hover{
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
							
							// 타이틀
							var hrefTitle = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", hrefTitle).append(obj.qbTitle);
							var $td_title = $("<td>").append($a);
							
							var $td_name = $("<td>").append(obj.qbName);
							var $td_date = $("<td>").append(dateFormat(obj.qbDate));
							
							// 게시글 삭제 
							var hrefBtn = "${pageContext.request.contextPath }/qb/delete.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", hrefBtn);
							var $td_btn = $("<td>").append($a);

							
							var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date).append($td_btn);
							$("#qbListTable").append($tr);
						}else{
							var $td_no = $("<td>").append(obj.qbNo);
							
							
							var $td_category = $("<td>").append(textArr[obj.qbCategory]);
							
							
							// 타이틀
							var hrefTitle = "${pageContext.request.contextPath }/qb/detail.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", hrefTitle).append(obj.qbTitle);
							var $td_title = $("<td>").append($a);
							
							var $td_name = $("<td>").append(obj.qbName);
							var $td_date = $("<td>").append(dateFormat(obj.qbDate));
							
							// 게시글 삭제 
							var hrefBtn = "${pageContext.request.contextPath }/qb/delete.do?qbNo=" + obj.qbNo;
							var $a = $("<a>").attr("href", hrefBtn);
							var $td_btn = $("<td>").append($a);

							
							var $tr = $("<tr>").addClass("selectedList").append($td_no).append($td_category).append($td_title).append($td_name).append($td_date).append($td_btn);
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
<div>

	<div>
		<h1>문의하기(관리자용)</h1>
		<div>
			<select name="selectCategory">
				<option value=0 selected="selected">전체 보기</option>
				<option value=1>결제 문의</option>
				<option value=2>예약 문의</option>
				<option value=3>객실 문의</option>
				<option value=4>시설 및 옵션 문의</option>
				<option value=5>기타 문의</option>
			</select>
		</div>
		<table id="qbListTable">
			<tr>
				<th>글번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
			
			
			<c:forEach var="list" items="${list }">
			<input type="hidden" value="${list.member.mId }" name = "mId">
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
						<a href="${pageContext.request.contextPath }/qr/detail.do?qbNo=${list.qbNo }">${list.qbTitle }</a>
					</td>
					<td>${list.qbName }</td>
					<td>
						<fmt:formatDate value="${list.qbDate}" pattern="yyyy-MM-dd"/>
					</td>
					
					<td>
						<a href="${pageContext.request.contextPath }/qb/delete.do?qbNo=${list.qbNo}">[게시글 삭제]</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<!-- 회원일 경우 -->
		<c:if test="${Auth != null }"> 
			<a href="${pageContext.request.contextPath }/qb/insert.do?mId=${Auth}">글쓰기</a>
		</c:if> 
	</div>
	
	
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
