<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 작성</title>
</head>
<body>
	<form action="rcpWrite.html" id="frm" method="post">
		<div align="center" style="margin-top: 40px;">
			<div style="width: 940px;">
				<div style="width: 940px;">
					<div style="width: 940px; height: 60px;" align="right" class="listcolor">
						<h1 class="list" style="padding-top: 10px;">레시피 작성</h1>			 
			 				<div style="width: 940px; height:10px; margin-top: -10px;" class="listcolor"></div>
					</div>
				</div>	

				<div style="margin-top: 20px; padding: 20px; height: 60px; background-color: #FFF5EF;">
					<span class="subtitle left" style="font-size: 17px; margin-right: 20px;">요리명</span>
					<input class="left" type="text" id="title"	style="width: 50%; height: 25px;" name="name" value="${recipe.name}">

					<div style="float: right; width: 350px; margin-bottom: 10px;" align="right">
						<input type="hidden" name="oven"  id="oven" value="N">
						<div class="ovenDiv" style="height:32px; width:32px; overflow:hidden; ">
							<img class="ovenImage" alt="오븐" src='<c:url  value="/resources/img/ovenImage.png"></c:url>'>
						</div>
					</div>

					<div style="float: left; margin-top: 20px;">
						<select name="country" id="country">
							<option value="korea">한식</option>
							<option value="china">중식</option>
							<option value="japan">일식</option>
							<option value="europe">양식</option>
						</select> <select name="amount" id="amount">
							<option value="1">1인</option>
							<option value="2">2인</option>
							<option value="3">3인</option>
							<option value="4">4인</option>
						</select> <select name="difficulty" id="difficulty">
							<option value="3">상</option>
							<option value="2">중</option>
							<option value="1">하</option>
						</select>
					</div>

					<div style="float: right; margin-top: 20px;">
						걸리는 시간 <select name="time-d" id="time-d">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 일 <select name="time-h" id="time-h">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 시간 <select name="time-m" id="time-m">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 분
					</div>
				</div>

				<div style="width: 940px; margin-top: 0px;">
					<div style="width: 940px; height: 45px;" align="right" class="listcolor">
						<h3 class="list" style="padding-top: 15px;">재료</h3>
					 
					 <div style="width: 940px;height:10px; margin-top: -10px;" class="listcolor"></div>
					</div>
				</div>

					<div class="ui-widget" style="margin-top: 20px; padding:10px; background-color: #FFF5EF;">
						<label for="material" style="margin-right: 20px;">재료 검색</label><input id="material" size="50" name="material">
						<ul id="ul-material">
						</ul>
					</div>
				</div>
				
				<div style="width: 940px; margin-top: 50px;">
					<div style="width: 940px; height: 45px;" align="right" class="listcolor">
						<h3 class="list" style="padding-top: 15px;">내용</h3>
					 
					 <div style="width: 940px;height:10px; margin-top: -10px;" class="listcolor"></div>
					</div>
				</div>
				
				<div style="overflow: auto; padding: 10px; vertical-align: middle; margin-top: 20px; width: 920px; background-color: #FFF5EF;"	align="center" id="div-content">

					<ul style="list-style: none; " id="wcontent">
						<li>
							<table class="content-table" style="background-color: #B2A095;">
								<tr>				
									<td>
										<div id="image" class="content-table-div-left upload-btn" align="center">
											<div style="margin-top: 60px;">이미지 등록</div>
										</div>	
									</td>
									<td style="padding-left: 10px;">										
										<div class="content-table-div-right" id="content" contenteditable="true"></div>
									</td>
									<td style="padding-left: 10px;">										
										<input type="button" class="addlist btn" value="추가"><p>
										<input type="button" class="cont-move btn" value="이동"><p>
										<input type="button" class="removelist btn" value="삭제">
									</td>
								</tr>								
							</table>
						</li>
					</ul>
				</div>
			<input type="button" id="send" value="확인" style="margin-top: 30px;">
			</div>

		<div id="sendText"></div>
		<div id="sendLi"></div>
		<div id="imageLi"></div>
	</form>
</body>
</html>