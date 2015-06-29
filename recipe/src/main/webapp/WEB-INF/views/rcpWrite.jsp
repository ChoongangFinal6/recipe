<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
  $(function() {
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
 
    $( "#material" )
      // don't navigate away from the field on tab when selecting an item
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        source: function( request, response ) {
          $.getJSON( "search.jsp", {
            term: extractLast( request.term )
          }, response );
        },
        search: function() {
          // custom minLength
          var term = extractLast( this.value );
          if ( term.length < 2 ) {
            return false;
          }
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
  });
  </script>
<body>
<div align="center" style="margin-top: 40px;">
	<div style="width: 940px;">
		<div style="width: 940px;" align="left">
			<h1 style="margin-left: 10px;">레시피 작성</h1>
		</div>		
		
		<div style="border: 2px solid black; margin-top: -15px; width: 940px;"></div>
		
		<div style="border: 1px solid black; margin-top: 15px; padding: 10px;">
		<span style="font-size: 15px; margin-right: 20px;">제목</span>
		<input type="text" id="title" style="width: 50%; height: 25px;">
		
		<select>
			<option>국가</option>
		</select>
		
		<select>
			<option>1인분</option>
		</select>
		
		<div>걸리는 시간 
		<select>
			<option>1</option>
		</select> 일 
		
		<select>
			<option>1</option>
		</select> 시간 
		
		<select>
			<option>30</option>
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
		  <input id="material" size="50">
		</div>
		<p>
		<div>
			<ul>
				
			</ul>
		</div>		
	</div>
	
	<div style="width: 940px;" align="left">
		<h3 style="margin-left: 10px;">내용</h3>
	</div>
	<div style="border: 2px solid black; margin-top: -10px;"></div><p>

	<div style="border: 2px solid black; overflow: auto; padding: 10px;" align="center">
		<table style="border: 1px solid black; padding: 10px;">
			<tr>
				<td><div style="border: 1px solid black; width: 300px; height: 180px; display:table-cell;" id="image"></div></td>
				<td><div style="border: 1px solid black; display:table-cell; height: 180px; width: 500px; padding: 10px;" contenteditable="true"></div></td>
			</tr>
			<tr>
				<td><input type="button" value="사진 등록" id="upload"></td>
				<td align="right"><button style="margin-right: 5px;">추가</button><button>삭제</button></td>
			</tr>
		</table>
	</div>
	</div>
</div>
</body>
</html>