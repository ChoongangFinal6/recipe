<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="result.html" id="frm" method="post">
<div align="center" style="margin-top: 40px;">
	<div style="width: 940px;">
		<div style="width: 940px;" align="left">
			<h1 style="margin-left: 10px;">레시피 작성</h1>
		</div>		
		
		<div style="border: 2px solid black; margin-top: -15px; width: 940px;"></div>
		
		<div style="border: 1px solid black; margin-top: 15px; padding: 10px;">
		<span style="font-size: 15px; margin-right: 20px;">제목</span>
		<input type="text" id="title" style="width: 50%; height: 25px;" name="name" required="required">
		
		<input type="checkbox" name="oven" value="Y"> 오븐
		
		<div>
			<select name="country" class="selectbox">			
				<option value="korea">한식</option>
				<option value="china">중식</option>
				<option value="japan">일식</option>
				<option value="europe">양식</option>
			</select>
			
			<select name="amount" class="selectbox">			
				<option value="1">1인</option>
				<option value="2">2인</option>
				<option value="3">3인</option>
				<option value="4">4인</option>
			</select>
			
			<select name="difficulty" class="selectbox">			
				<option value="3">상</option>
				<option value="2">중</option>
				<option value="1">하</option>
			</select>
		</div>
		
		<div>걸리는 시간 
		<select name="time-d" class="selectbox">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> 일 
		
		<select name="time-h" class="selectbox">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> 시간 
		
		<select name="time-m" class="selectbox">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> 분 
		</div>
	</div>
	
	<div style="width: 940px;" align="left">
		<h3 style="margin-left: 10px;">재료</h3>
		<div style="border: 2px solid black; margin-top: -10px;"></div><p>
	</div>
	<div style="border: 1px solid black; padding: 10px;">
		<div class="ui-widget">
		  <label for="material">재료 검색</label>
		  <input id="material" size="50" name="material">
		</div>
		<p>
		<div>
			<ul id="ul-material">
				
			</ul>
		</div>		
	</div>
	<div style="width: 940px;" align="left">
		<h3 style="margin-left: 10px;">내용</h3>
	</div>
	<div style="border: 2px solid black; margin-top: -10px;"></div><p>
	
	<div style="border: 2px solid black; overflow: auto; padding: 10px; vertical-align:middle;" align="center" id="div-content">
		
			<ul style="list-style:none;" id="wcontent">
				<li>
					<table class="content-table">
						<tr>
							<td><div id="image" class="content-table-div-left"></div></td>
							<td style="padding-left: 10px;"><div contenteditable="true" class="content-table-div-right" id="content"></div></td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><input type="button" value="사진 등록" id="upload" class="upload-btn"></td>
							<td align="right" style="padding-top: 10px;">
								<input type="button" style="margin-right: 10px;" class="addlist" value="추가">
								<input type="button" class="removelist" value="삭제">								
							</td>
						</tr>						
					</table>							
				</li>
			</ul>
		</div>
	</div>
	<input type="button" id="send" value="확인" style="margin-top: 30px;">
</div>
<div id="sendImage"></div>
<div id="sendText"></div>
<div id="sendLi"></div>
</form>
</body>
</html>