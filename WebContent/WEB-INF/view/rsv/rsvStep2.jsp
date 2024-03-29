<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep2.css" rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/js/rsv/rsvStep2.js"></script> 

<!-- 예약 2단계 -->
<div class="rsv-step-wrap">
	<!-- background로 step 넣기 -->
</div>

<form action="rsvStep2.do" method="post">	
	<div class="rsv-op-content">
		<div class="rsv-op-left">
			<div class="rsv-left-wrap">
				<div class="rsv-op-choice">
					<div class="op-choice-title">
						<p>
							　옵션 사항
							<span>객실이용에 필요한 옵션사항을 선택하세요.</span>
						</p>
					</div>
								
					<div class="op-choice-list">
						<div class="bf-notice">
							<img src="${pageContext.request.contextPath}/images/rsv-img/bf.jpg" class="bf-notice-img" alt="조식사진">
							<span class="bf-notice-content">
								<big>🍳조식 안내</big><br><br>
								BLUA LUNDO의 조식은<br>수영장 조식으로 운영되고 있습니다<br>
								따라서 조식을 추가하시면<br>객실별 예약 인원에 따라<br>가격이 측정됩니다<br>
								이 점 양해 부탁드립니다<br><br>감사합니다
							</span>
						</div>
						
						<table>
							<tr>
								<td>
									Daily Extra Bed<br>
								</td>
								<td></td>
								<td>
									<input type="checkbox" class="op-ck" name="room-op" value="1">
								</td>
								<td><span class="price-bed">40,000</span>원  <small>/1개</small></td>
							</tr>
							<tr>
								<td>
									Daily Breakfast for Adult<br>
								</td>
								<td>성인</td>
								<td>
									<input type="checkbox" class="op-ck" name="room-op" value="2">
								</td>
								<td><span class="price-bf-adt">32,000</span>원  <small>/1인</small></td>
							</tr>
							<tr>
								<td>
									Daily Breakfast for Child<br>
								</td>
								<td>어린이</td>
								<td>
									<input type="checkbox" class="op-ck" name="room-op" value="3">
								</td>
								<td><span class="price-bf-cdr">23,000</span>원  <small>/1인</small></td>
							</tr>
											
						</table>
					</div>
				</div>
								
				<div class="rsv-op-request">
					<div class="op-request-main">
						<p>
							　추가 요청사항
							<span>
								<!-- background로 버튼 -->
							</span>
						</p>
					</div>
					<div class="op-request-sub">
						<textarea name="cReq" placeholder="공항 교통편 문의 또는 호텔 이용 시 문의하실 사항이 있으시면 입력해 주십시오."></textarea>
						<ul>
							<li>· 전망은 체크인 당일 사정에 따라 달라질 수 있습니다.</li>
							<li>· 전 객실은 금연실로 운영중입니다.</li>
						</ul>
					</div>
				</div>
							
			<div class="input-left-wrap">
				<div class="rsv-input-info">
					<div class="input-info-title">
						<p>
							　고객 정보 입력
							<span><span class="required_field">*</span>표시 필수 입력사항</span>
						</p>
					</div>
					
					<div class="input-info-content">
						<table class="ip-info-tb">
							<tr>
								<td colspan="2"><p>투숙자 정보 입력</p></td>
							</tr>
							<tr>
								<td><span class="required_field">*</span>성명<br><small>(국문)</small></td>
								<td>
									<input type="text" name="nameKor" placeholder="이름을 공백없이 입력하세요" value="${rsv.member.mName}">
								</td>
							</tr>
						
							<tr>
								<td><span class="required_field">*</span>이메일</td>
								<td>
									<input type="email" name="mail" placeholder="ex@example.com" value="${rsv.member.mMail}">
								</td>
							</tr>
							
							<tr>
								<td><span class="required_field">*</span>연락처</td>
								<td>
								<c:set var="p" value="${fn:split(rsv.member.mPhone, '-')}"></c:set>
								<select name="tel1">
									<option ${p[0] == "010"?'selected="selected"':''}>010</option>
									<option ${p[0] == "011"?'selected="selected"':''}>011</option>
									<option ${p[0] == "016"?'selected="selected"':''}>016</option>
									<option ${p[0] == "017"?'selected="selected"':''}>017</option>
									<option ${p[0] == "018"?'selected="selected"':''}>018</option>
									<option ${p[0] == "019"?'selected="selected"':''}>019</option>
								</select>
								<input type="tel" name="tel2" value="${p[1]}" maxlength="4">
								<input type="tel" name="tel3" value="${p[2]}" maxlength="4">	
								</td>
							</tr>
						</table>
						
						<table class="ip-info-tb">
							<tr>
								<td colspan="2"><p>카드 정보 입력</p></td>
							</tr>
							
							<tr>
								<td><span class="required_field">*</span>카드종류</td>
								<td>
									<select name="cardType">
										<option selected="selected">선택</option>
										<option>AMEX CARD</option>
										<option>BC CARD</option>
										<option>CITIBANK CARD</option>
										<option>DINERS CARD</option>
										<option>HYUNDAI CARD</option>
										<option>JCB CARD</option>
										<option>KEB CARD</option>
										<option>KOOKMIN CARD</option>
										<option>LOTTE CARD</option>
										<option>MASTER OVERSEAS</option>
										<option>SHINHAN CARD</option>
										<option>SAMSUNG CARD</option>
										<option>VISA OVERSEAS</option>
										<option>UNION PAY</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td><span class="required_field">*</span>카드번호</td>
								<td>
									<input type="text" name="cardNum1" class="cardNum" maxlength="4">
									<input type="password" name="cardNum2" class="cardNum" maxlength="4">
									<input type="password" name="cardNum3" class="cardNum" maxlength="4">
									<input type="text" name="cardNum4" class="cardNum" maxlength="4">
								</td>
							</tr>

							<tr>
								<td><span class="required_field">*</span>유효기간</td>
								<td>
									<select name="cardNumMonth">
										<option>월</option>
										<c:forEach begin="01" end="12" var="card_m">
											<c:if test="${card_m < 10}">
												<option>0${card_m}</option>
											</c:if>
											<c:if test="${card_m >= 10}">
												<option>${card_m}</option>
											</c:if>
										</c:forEach>
									</select>
									<select name="cardNumYear">
										<option>년</option>
										<option>2029</option>
										<option>2028</option>
										<option>2027</option>
										<option>2026</option>
										<option>2025</option>
										<option>2024</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="cau">
										※ 신용카드 정보는 고객님의 투숙에 의한 개런티 외에는 어떤 목적으로도 사용되지 않으며, 체크카드 및 일부 신용 카드의 경우 사용이 제한될 수 있습니다. 
										<br></b><span class="required_field"><u>온라인 예약완료 시 바로 결제가 진행됩니다.</u></span> 관련 문의는 예약실로 전화 부탁드립니다.
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="rsv-input-refund">
					<div class="input-info-title">
						<p>
							　환불 정보 입력
							<span><span class="required_field">*</span>표시 필수 입력사항</span>
						</p>
					</div>
					<table class="ip-info-tb">
						<tr>
							<td><span class="required_field">*</span>환불 은행명</td>
							<td>
								<select name="refundBank">
									<option>은행명</option>
									<option>국민은행</option>
									<option>기업은행</option>
									<option>농협은행</option>
									<option>신한은행</option>
									<option>산업은행</option>
									<option>우리은행</option>
									<option>하나은행</option>
									<option>SC제일은행</option>
									<option>카카오뱅크</option>
									<option>케이뱅크</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><span class="required_field">*</span>환불 계좌번호</td>
							<td>
								<input type="text" name="refundNum" placeholder="-없이 숫자만 입력해주세요(16자리)" maxlength="16">
							</td>
						</tr>
						<tr>
							<td><span class="required_field">*</span>예금주 성명</td>
							<td>
								<input type="text" name="refundName">
							</td>
						</tr>
					</table>
				</div>
				
				<div class="rsv-input-notice">
					<div class="input-notice">
						<p>예약 취소 및 No-Show 안내</p>
						<dl>
							<dt><u>성수기(5월~10월, 12월 24일~31일)</u></dt>
							<dd>- 숙박 예정일 7일 전까지는 위약금 없이 취소 가능합니다.</dd>
							<dd>- 숙박 예정일 6일 전 ~ 1일 전 18시까지 취소 시, 최초 1박 요금의 20%가 위약금으로 부과됩니다.</dd>
							<dd>- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show)시, 최초 1박 요금의 80%가 위약금으로 부과됩니다.</dd>
						</dl>
						<dl>
							<dt><u>비성수기(성수기 외 기간)</u></dt>
							<dd>- 숙박 예정일 1일 전 18시까지는 위약금 없이 취소 가능합니다.</dd>
							<dd>- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show)시, 최초 1박 요금의 10%가 위약금으로 부과됩니다.</dd>
						</dl>
						<p>
							※ <u>예약의 변경은 취소 후 재예약 부탁드립니다.</u><br>
							※ 기타 문의사항이 있으시면 예약실로 전화주시기 바랍니다.
						</p>
					</div>
				</div>
			</div> <!-- left-wrap -->	
								
				<div class="rsv-notice">
					<div class="notice-main">
						<p>
							　유의사항
						</p>
					</div>
					<div class="notice-content">
						<img src="${pageContext.request.contextPath}/images/rsv-img/notice.png">
					</div>
				</div>
								
				<!-- 버튼 -->
				<div class="btn-area">
					<span class="btnBack">
						◀ STEP1
					</span>
					<c:if test="${Auth != null}">
						<input type="submit" value="예약">
					</c:if>
				</div>
			</div>
		</div>
						
		<!-- 오른쪽 -->
		<div class="rsv-op-right">
			<div class="rsv-info-wrap">
				<div class="rsv-info">
					<p>
						예약정보
						<input type="hidden" value="${rsv.room.roomNo}" name="roomNo">
						<a id="aReset" href="${pageContext.request.contextPath}/index.jsp">
							<span style="color: #F15F5F;">예약초기화</span>
						</a>
					</p>
									
					<div class="info-content">
						<ul>
							<li class="info-ckIn">
								체크인
								<fmt:formatDate value="${rsv.rIn}" pattern="yyyy-MM-dd" var="rIn"/>
								<input type="text" readonly="readonly" class="ckIn-area" value="${rIn}" name="ckIn">
							</li>
							<li class="info-ckOut">
								체크아웃
								<fmt:formatDate value="${rsv.rOut}" pattern="yyyy-MM-dd" var="rOut"/>
								<input type="text" readonly="readonly" class="ckOut-area" value="${rOut}" name="ckOut">
							</li>
							<li class="info-ckStay">
								숙박일수
								<input type="text" readonly="readonly" class="ckStay-area" value="${stay}" name="stay">
							</li>
							<li class="info-ckPerson">
								투숙 인원
								<input type="text" readonly="readonly" name="psn" class="ckPerson-area" value="성인: ${adtNum}명 / 어린이: ${chdNUm}명">
							</li>
							<li class="info-ckType">
								객실타입
								<input type="text" readonly="readonly" class="ckType-area" value="${rsv.room.bedType.btName}">
							</li>
						</ul>
					</div>
									
					<div class="rsv-room-info">
						<ul>
							<li><b>객실</b></li>
							<li>
								<input type="text" readonly="readonly" name="roomCate" class="rm-info" value="${rsv.room.roomCategory.rcName} ">
								<input type="text" readonly="readonly" name="viewType" class="rm-info" value=" ${rsv.room.viewType.vtName} ">
								<input type="text" readonly="readonly" name="bedType" class="rm-info" value="${rsv.room.bedType.btName} ">
							</li>
							<li>
								<fmt:formatNumber value="${rsv.room.roomPrice}" pattern="###,###" var="rmPri" />
								<input type="text" readonly="readonly" name="rmPrice" value="${rmPri} 원(1박)">
							</li>
							<li>
								<fmt:formatNumber value="${rsv.rTotalPrice}" pattern="###,###" var="rToP" />
								<input type="text" readonly="readonly"  class="rmPrice" value="${rToP} 원 (${stay}박)" pattern="###,###" />
							</li>
							<li>
								<!-- <img src="images/rsv-img/test.jpg"> -->
							</li>
						</ul>
					</div>
								
					<div class="rsv-op-total">
						<ul>
							<li><b>옵션</b></li>
						</ul>
					</div>			
								
					<div class="rsv-total">
						<ul>
							<li>
								봉사료
								<c:set value="${rsv.rTotalPrice / 10}" var="service_charge"></c:set>
								<fmt:formatNumber value="${service_charge}" pattern="###,###" var="svChar" />
								<input type="text" class="svcCharge" readonly="readonly" value="${svChar} 원">
							</li>
							<li>
								부가가치세
								<c:set value="${(rsv.rTotalPrice+service_charge) / 10}" var="VAT"></c:set>
								<fmt:formatNumber value="${VAT}" pattern="###,###" var="vavat" />
								<input type="text" class="VAT" readonly="readonly" value="${vavat} 원">
							</li>
						</ul>
						<ul class="rsv-total-price">
							<li>
								요금합계
								<c:set value="${rsv.rTotalPrice+service_charge+VAT}" var="totalPrice"></c:set>
								<fmt:formatNumber var="realTt" value="${totalPrice}" pattern="###,###" />
								<input type="text" class="realTotal" name="totalPrice" value="${realTt} 원" readonly="readonly">							</li>
						</ul>
					</div>	
				</div>
			</div>
		</div>
	</div>
</form>			
			


<%@ include file="/WEB-INF/view/include/footer.jsp"%>