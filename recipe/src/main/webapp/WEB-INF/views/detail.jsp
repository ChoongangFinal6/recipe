<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${recipe.name}</title>
<link rel="stylesheet" href="<c:url value="/resources/css/reply.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/detail.js"/>"></script>
</head>
<body>
	<div class="detail" align="center" style="margin-top: 40px;">
		<div style="width: 940px;">
			<div style="width: 940px; height: 60px;" align="right" class="listcolor">
				<h1 class="list" style="padding-top: 10px;">${recipe.name}</h1>
			 
			 <div style="width: 940px; height:10px; margin-top: -10px;" class="listcolor"></div>
			</div>
		</div>	
			
		<div style="width: 920px;  height: 112px; padding: 10px; margin-top: 18px;" class="contcolor fontcolor">
			<div  class="border" style="height: 107px; padding: 0 20 0 20;">				
				<div style="float: right; width: 350px; margin: 10 10 0 0;" align="right">
					<c:if test="${recipe.oven=='Y'}"><img alt="오븐사용" src="<c:url value="/resources/img/oven.png"/>"></c:if>
					<c:if test="${recipe.oven=='N'}"><img alt="오븐사용 안함" src="<c:url value="/resources/img/no_oven.png"/>"></c:if>
				</div>
					
				<div class="left" style="margin: 10 100 0 0; font-size: 17px;">
					<div class="left subtitle">나라 |</div>
					<div class="left subcont">${recipe.country}</div>
				</div>
				
				<div class="left" style="margin: 10 100 0 0; font-size: 17px;">
					<div class="left subtitle">양 | </div> 
					<div class="left subcont">${recipe.amount }</div>
				</div>
				
				<div class="left" style="margin: 10 10 0 0; font-size: 17px;">
					<div class="left subtitle">난이도 | </div> 
					<div class="left subcont">${recipe.difficulty }</div>
				</div>
				
				<div style="border:2px solid #B2A095; margin-top: 10px; width: 870px; float: left;"></div>
		
				<div style="float: left; margin: 10 10 0 0;">
					<div class="left subtitle ">걸리는 시간 | </div>
					<div class="left subcont">${day} 일</div>
					<div class="left subcont">${hour} 시간</div>
					<div class="left subcont">${minute} 분</div>
				</div>				
			</div>
		</div>		
		
		<div style="width: 940px; margin-top: 0px;">
			<div style="width: 940px; height: 45px;" align="right" class="listcolor">
				<h3 class="list" style="padding-top: 15px;">재료</h3>
			 
			 <div style="width: 940px;height:10px; margin-top: -10px;" class="listcolor"></div>
			</div>
		</div>
		
		<div style="width: 920px; padding: 10px; margin-top: 16px; overflow: auto;" class="contcolor fontcolor">
			<div class="border" style="overflow: auto;">
				<div>
					<ul class="left" id="ul-material">
						<c:forEach var="mt" items="${mList}">
							<li><div class="left mcolor" style="padding: 10px;">${mt[0]} ${mt[2]} ${mt[1]}</div></li>
						</c:forEach>
					</ul>
				</div>				
			</div>
		</div>		
		
		<div style="width: 940px; margin-top: 20px;">
			<div style="width: 940px; height: 45px;" align="right" class="listcolor">
				<h3 class="list" style="padding-top: 15px;">내용</h3>
			 
			 <div style="width: 940px;height:10px; margin-top: -10px;" class="listcolor"></div>
			</div>
		</div>				
		
		<div style="width: 920px; padding: 10px; margin-top: 16px; overflow: auto;" class="contcolor fontcolor">
			<div class="border" style="overflow: auto;">
				<ul style="list-style: none;" id="wcontent">
					<li>
						<table class="content-table border">
							<c:forEach items="${content}" var="cntnt">
								<tr>
									<td><div id="image" class="content-table-div-left">
											<img alt="${cntnt.image}" src="image/${cntnt.image }">
										</div></td>
									<td style="padding-left: 10px;"><div class="content-table-div-right" id="content">${cntnt.content }</div></td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(content)<1}">
								<tr>
									<td>본문이 없습니다</td>
								</tr>
							</c:if>
						</table>
					</li>
				</ul>		
			</div>
		</div>
		
		<div>
			<input type="button" id="aaa" value="목록으로" onclick="location.href='rcpList.html?pageNo=${pageNo}'" style="margin-top: 30px;"> 
			<input type="button" value="수정하기" onclick="location.href='rcpUpdate.html?no=${recipe.no}'" style="margin-top: 30px;">
			<input type="button" value="삭제하기" onclick="del(${recipe.no},${pageNo})" style="margin-top: 30px;">
		</div>	
		
		<div class="rate">
		<input type="hidden" value="${recipe.no }" id="recipeNo" name="postNo"> 
		<span class="score" id="score">평점 :${recipe.rate}</span> 
		<span class="count" id="count">(${count}명 참여)</span> 
		<span> 
			<select name="rate" id="rateSelect">
				<c:forEach begin="0" end="9" var="j">
					<option value="${10-j}">
						<c:forEach begin="0" end="${9-j }" var="i">♩</c:forEach> ${10-j}
					</option>
				</c:forEach>
			</select>
		</span>
		<span>
			<input type="button" value="평가" id="rating">
		</span>
	</div>					
</div>

		<div id="comment"></div>	
</body>
</html>