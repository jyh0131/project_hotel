<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div#container {
		width: 100%;
	}
	div#section {
		clear: both;
		width: 100%;
	}
	/* div#rm_wrap {
		width: 1200px; 
		margin: 0 auto;
	} */
/* --------- 왼쪽 메뉴 --------- */
	#rm_left_menu{
		background: #F1E3C4;
		padding:30px;
		width:140px;
		height:500px;
		float: left;
		margin-top: 50px;
	}
	#rm_left_menu hr{
		margin:15px 0;
	}
	#rm_left_menu li{
		font-size: 14px;
		color:#633E10;
		font-weight: bold;
	} 
	#rm_left_menu li a{
		display: inline-block;
		width:90%;
		padding:10px;
		color:black;
	}
	#rm_left_menu li a:hover{
		background: #D3C09A;
	}
	#rm_left_menu .btnAll{
		background: #81725F;
		color:white;
		display: inline-block;
		width:130px;
		line-height:40px;
		text-align: center;
		margin-top:90px;
	}
	
/* --------- 큰 title, > 객실 > 스탠다드 --------- */	
	#rm_roomContent{
		width:78%;
		float: right;
		margin-top: 50px;
	}
	#rm_roomTitle p{
		text-align: right;
		padding:5px;
		font-size: 13px;
		margin-right:20px;
	}
/* --------- 객실 이미지 슬라이드 --------- */
	#roomImg{
		margin-bottom:50px;
	}
	#roomImg img{
		width:700px;
	}
/* --------- 객실 설명 --------- */
	#rm_contentLeft{
		width:48%;
		float: left;
	}
	#rm_contentLeft img{
		width:450px;
	}
/* --------- hotel info Box, 문의하기, 예약하기 버튼 --------- */
	#rm_contentRight{
		width:340px;
		float: right;
		margin-bottom:10px;
	}
	#rm_btn a{
		color:white;
		padding:0 20px;
		width:37%;
		line-height:50px;
		display:inline-block;
		text-align: center;	
	}
	#btn_ask{
		background: #826B51;
	}
	#btn_rsv{
		background: #3A3125;
	}
/* --------- hotel info --------- */
	#rm_hotelInfo{
		background: #FAF7ED;
		margin-top:25px;
		padding:20px;
		font-size: 13px;
	}
	#rm_hotelInfo h3{
		margin-bottom:20px;
	}
	#rm_hotelInfo .sBox{
		width:140px;
		float: left;
		margin-right:10px;
		margin-bottom: 15px;
	}
	#rm_hotelInfo #rm_rsv{
		clear: both;
	}
	#rm_hotelInfo p{
		padding:3px 0;
	}
/* --------- 객실 이용 외 설명 테이블 --------- */	
	#rm_tableBox{
		clear: both;
	}
	#rm_tableBox th, td{
		padding:20px;
	}
	#rm_tableBox li{
		line-height: 25px;
		background: url(bgDot.gif) 0 8px no-repeat;
		padding-left:8px;
	}
	#rm_tableBox th, td{
		border-top:1px solid #EAEAEA;
	}
</style>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<div>
	<div id="rm_left_menu">
		<h3>객실</h3>
		<hr size=3 color="black">
		<ul>
			<c:forEach var="list" items="${list }">
				<li><a href="${pageContext.request.contextPath }/room/main.do?rcNo=${list.rcNo }">${list.rcName }</a></li>
			</c:forEach>
		</ul>		
		<a href="#" class="btnAll">전체 객실 보기</a>
	</div> <!-- #left_menu -->
	<div id="rm_roomContent">	
		<div id="rm_roomTitle">
			<h2>${rc.rcName }</h2>
			<p>
				<img src="location.gif">
				> 객실 > 
				<strong>${rc.rcName }</strong>
			</p>
		</div><!-- #rm_roomTitle -->
		
		<div id="roomImg">
			<img src="room.jpg">
		</div>
		
		<div id="rm_contentBox">
			<div id="rm_contentLeft">
				<img src="content.jpg">
			</div>
			
			<div id="rm_contentRight">
				<div id="rm_btn">
					<a href="#" id="btn_ask">문의하기</a>
					<a href="#" id="btn_rsv">예약하기</a>
				</div><!-- #rm_btn -->
				
				<div id="rm_hotelInfo">
					<h3>Hotel Info</h3>
					<div class="sBox">
						<strong>조식 이용 안내</strong>
						<p>- 시간: 07:00 ~ 10:00</p>
						<p>- 식당: 한식, 뷔페</p>
					</div>
					<div class="sBox">
						<strong>체크인/체크아웃 시간</strong>
						<p>- 체크인: 오후 2시 이후</p>
						<p>- 체크아웃: 11시</p>
					</div>
					<div id="rm_rsv">
						<strong>예약 취소/변경 및 No-Show 안내</strong>
						<p>성수기(5월~10월, 12월 24일~31일)</p>
						<p>- 숙박 예정일 7일 전: 위약금 없음</p>
						<p>- 숙박 예정일 6일 전 ~ 1일 전(18시까지 취소 및 변경 시): 최초 1박 요금의 20%</p>
						<p>- 숙박 예정일 1일 전(18시 이후 취소 및 변경, No-Show 시): 최초 1박 요금의 80%</p>
						<p>비수기(성수기 외 기간)</p>
						<p>- 숙박 예정일 1일 전(18시까지): 위약금 없음</p>
						<p>- 숙박 예정일 1일 전(18시 이후 취소 및 변경, No-Show 시): 최초 1박 요금의 10%</p>
						
					</div>
				</div><!-- #rm_hotelInfo -->
			</div><!-- #rm_contentRight -->
			
			<div id="rm_tableBox">
				<table>
					<tr>
						<th>객실 이용</th>
						<td>
							<ul>
								<li>위성 TV 무료 – 30개 채널</li>
								<li>유·무선 인터넷(wi-fi)</li>
								<li>220V 또는 110V 전원</li>
								<li>
									엑스트라 베드 또는 침구 1개 추가 48,400원/1박
									<br>
									(12개월 이하 영아 침대 1개 무료 제공)
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>부대시설</th>
						<td>
							<ul>
								<li>피트니스 클럽, 실내외 수영장 무료 이용</li>
								<li>사우나 이용 시 유료</li>
								<li>
									키즈클럽 시설 이용 무료
									<br>
									(프로그램 이용 시 별도 요금 부가)
								</li>
								<li>유아 물품 대여 서비스(무료) - 사전예약필요</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>룸서비스</th>
						<td>
							<ul>
								<li>객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.</li>
								<li>한식, 일식: 조식07:00~10:00, 점심12:00~14:30, 저녁18:00~22:00</li>
								<li>양식 및 음료: 24시간</li>
							</ul>
						</td>
					</tr>
				</table>
			</div><!-- #rm_tableBox -->
			
		</div> <!-- #rm_contentBox -->
		
	</div><!-- #rm_roomContent -->

</div>	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>