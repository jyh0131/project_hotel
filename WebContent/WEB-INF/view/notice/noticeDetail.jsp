<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.menu-notice-wrap {
		width: 100%;
		min-height: 500px;
		padding: 30px 0 50px;
	}
	div.menu-notice-wrap > h1 {
		width: 60%;
		margin: 0 auto;
		text-align: center;
		border-bottom: 5px solid #47a3da;
		font-size: 3em;
		color: #47a3da;
		font-weight: normal;
		letter-spacing: 0.15em;
	}
	div.menu-notice-wrap > div.notice-wrap {
		width: 60%;
		margin: 15px auto 0;
	}
	div.notice-wrap > form > table > caption {
		caption-side: bottom;
		text-align: right;
		font-size: 14px;
	}
	div.notice-wrap > form > table > caption > a {
		color: #535353;
	}
	div.notice-wrap > form > table {
		width: 90%;
		margin: 0 auto;
		border-collapse: collapse; 
		border: 4px solid #47a3da;
		background: rgba(245, 219, 189, 0.6);
	}
	table td {
		padding: 30px 10px 10px;
	}
	td.n-title {
		text-align: center;
		font-size: 16px;
		letter-spacing: 0.15em;
	}
	td > input[type='text'] {
		width: 90%;
		padding: 5px 0;
	}
	td > textarea {
		width: 90%;
		height: 300px;
	}
	td.df {
		position: relative;
	}
	td.df > img {
		height: 250px;
	}
	td > input[type='file'] {
		margin-top: 24px;
	}
	td > input[type='submit'] {
		width: 70px;
		height: 70px;
		border-radius: 50px;
		background: #47a3da;
		color: white;
		border: none;
		margin: 0 20px 0;
		box-shadow: 2px 2px 3px grey;
		float: right;
	}
	input[readonly], textarea[readonly] {
		border: none;
		outline: none;
	}
</style>
<script>
	$(function(){
		$("#aDel").click(function(){
			var result = confirm("정말 삭제하시겠습니까?");
			
			if(result == true) {
				return true;
			} else {
				return false;
			}
		})
	})
</script>

<div class="menu-notice-wrap">
	<h1>공지사항</h1>
	
	<div class="notice-wrap">
		<form action="insert.do" method="post">
			<table>
				<tr>
					<td class='n-title'>제목</td>
					<td><input type="text" name="title" value="${nt.ntTitle}" readonly="readonly"></td>
				</tr>
				<tr>
					<td class='n-title'>내용</td>
					<td><textarea cols="60" rows="10" name="content" readonly="readonly">${nt.ntContent}</textarea></td>
				</tr>
				<tr>
					<td class='n-title'>첨부파일</td>
					<td class='df'>
						<c:if test="${nt.ntFile != ''}">
							<img src="${pageContext.request.contextPath}/upload/${nt.ntFile}">
						</c:if>
						<c:if test="${nt.ntFile == ''}">
							-
						</c:if>
					</td>
				</tr>
				<caption>
					<c:if test="${nt.member.mId == Admin}">
						<a href="${pageContext.request.contextPath}/notice/update.do?no=${nt.ntNo}">수정</a>
						<a href="${pageContext.request.contextPath}/notice/delete.do?no=${nt.ntNo}" id="aDel">삭제</a>
					</c:if>
					<a href="${pageContext.request.contextPath}/notice/list.do" id="hrefList">목록</a>
				</caption>
			</table>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>