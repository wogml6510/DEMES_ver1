<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 예산수립 상세.css -->
<link rel="stylesheet" href="/resource/css/budget/detail.css" />


	   <!-- project작업공간 -->
		<div class="p-main-body">
   			
   			
   			
   			<div class="bud_body">
   				<div class="bud_title">
	   				<div  class="bud_title0">
	   					<span>${projects.PJ_NAME } 예산서</span>
	   				</div>
	   			</div>
	   			
   				<div class="bud_conts">
   					<div class="bud_cont">
	   					<div class="bud_regi_cont">
	   						<table border="1" class="w-full">
	   							<thead>
	   								<tr>
	   									<th style="width:6%;">No</th>
	   									<th style="width:12%;">구분</th>
	   									<th style="width:35%;">예산내역</th>
	   									<th style="width:25%;">비고</th>
	   									<th style="width:17%;">예산금액</th>
	   									<th style="width:5%;"></th>
	   								</tr>
	   							</thead>
	   							<tbody>
	   								<c:forEach items="${budgetDetailList }" var="budgetDetailList" varStatus="status">
	   								<tr>
	   									<td class="text-center">
	   										<div class="p-1 w-full">${status.index+1}</div>
	   									</td>
	   									<td class="text-center">
	   										<div class="p-1 pl-2 w-full">${budgetDetailList.BUDDT_TYPE }</div>
	   									</td>
	   									<td>
	   										<div class="p-1 pl-2 w-full">${budgetDetailList.BUDDT_INFO }</div>
	   									</td>
	   									<td>
	   										<div class="p-1 pl-2 w-full">${budgetDetailList.BUDDT_ETC }</div>
	   									</td>
	   									<td class="text-right">
	   										<div class="p-1 pr-6 w-full">
	   											<fmt:formatNumber value="${budgetDetailList.BUDDT_COST}" pattern="#,###"/>원
	   										</div>
	   									</td>
	   									<td>
	   										
	   									</td>
	   							 	</tr>
	   								</c:forEach>
	   							</tbody>
	   						</table>
	   					</div>
	   					
	   					<div class="bud_regi_cont-foots">
							<div class="bud_regi_cont-foot">
	 							<div class="bud_add">
	 								
	 							</div>
	 						</div>
	 						<div class="w-full bud_regi_cont-foot-1 p-2">
	 							<div style="color:#AAAAAA;font-weight:bold;">총 ${budgetDetailListCount } 건</div> ㅣ
	 							<div style="color:#153A66;font-weight:bold;"><fmt:formatNumber value="${BUDDT_TOTAL}" pattern="#,###"/> 원</div>
	 						</div>
	 					</div>
	   					
	   					
	   				
	   				</div>
	   				<div class="bud_exp shadow-md">
   						<div class="bud_exp_0" style="height:45%;">
   							<div class="progress">
							    <div class="progress__bar"></div>
							    <div class="progress__text">
							      <span>${PLUS_COST_Per }</span>%
							    </div>
						  </div>
   							<!-- data-percent 안에 퍼센트 값을 준다. -->
							<!-- <div class="bud_donut" data-percent="95.4"></div> -->
   						</div>
   						<div class="bud_exp_1" style="height:10%;">
   							<div><i class="fa-solid fa-circle mr-2" style="color:skyblue;"></i>예산금액</div>
   							<div><i class="fa-solid fa-circle mr-2" style="color:#e7e7e7;"></i>예산매출</div>
   						</div>
   						<div class="bud_exp_2" style="height:39%;">
   							<div>
   								<span>예상 매출액</span>
   								<span><fmt:formatNumber value="${projects.PJ_PRICE}" pattern="#,###"/> 원</span>
   							</div>
   							<div >
   								<span>예상 지출액</span>
   								<span class="pl-4">${budgetDetailListCount } 건</span>
   								<span><fmt:formatNumber value="${BUDDT_TOTAL}" pattern="#,###"/> 원</span>
   							</div>
   							<div class="border-b-2">
   								<span>예상 매출이익률</span>
   								<span id="budget_pro">${PLUS_COST_Per }%</span>
   							</div>
   							<div style="color: rgb(2 132 199);">
   								<span>예상 매출이익</span>
   								<span><fmt:formatNumber value="${PLUS_COST }" pattern="#,###"/> 원</span>
   							</div>
   						</div>
   						
   					</div>
	   				
 					
   				</div>	
   				<div class="bud_regi-bt">
   					<div style="display:block;">
						<button class="a-bud-bt bg-green-600">승인</button>
						<button class="a-bud-bt bg-red-600">반려</button>
   					</div>
   				</div>
   				
   				
   				
   			</div>
   			
	
   
   
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->


<script>
let bar = document.querySelectorAll('.progress__bar'),
val = document.querySelectorAll('.progress__text > span');
for (let i = 0; i < bar.length; i++) {
let percent = parseInt(val[i].innerHTML);
bar[i].style.transform = 'rotate(' + (percent * 1.8 - 45) + 'deg)';
}
</script>
