$(function() {
	$("#send").click(function() {
		for (var i=0; i<$("#wcontent > li").length; i++) {
			$("#sendImage").append(function() {		
				var img = $("#wcontent > li").eq(i).find("input").val();
				var sendImage = "<input type='hidden' name='sendImage' value= '" + img+ "'>";			
				return sendImage;
			});		
			
			$("#sendText").append(function() {		
				var text = $("#wcontent > li").eq(i).find("div").parent().next().find("div").html();
				var sendText = "<input type='hidden' name='sendText' value= '" + text+ "'>";			
				return sendText;
			});			
		}		
		$("#frm").submit();
	});
		
	$("#submit").click(function () {
		$("#frm").submit(); 
	});
	
	$("#cancel").click(function() {	
		window.close();
	});
	
	$( "div#div-content" ).on("click", ".removelist", (function( event ) {			
		$(this).parent().parent().parent().parent().parent().fadeOut(2000).remove();
	}));

	$( "div#div-content" ).on("click", ".addlist", (function( event ) {	
		$(this).parent().parent().parent().parent().parent().after("<li id='li-content' style='display:none;'><table class='content-table'>"
				+ "<tr>"
				+		"<td><div id='image' class='content-table-div-left'></div></td>"
				+		"<td style='padding-left: 10px;'><div contenteditable='true' class='content-table-div-right' id='content'></div></td>"
				+"</tr>"
				+"<tr>"
				+		"<td style='padding-top: 10px;'><input type='button' value='사진 등록' id='upload' class='upload-btn'></td>"
				+		"<td align='right' style='padding-top: 10px;'><input type='button' style='margin-right: 10px;' class='addlist' value='추가'>" 
				+		"<input type='button' class='removelist' value='삭제'></td>"
				+"</tr>"
				+"</table></li>").next().fadeIn(1000);
		
		var position = $(this).offset();
	    $('html, body').animate({scrollTop : position.top}, 1000);		
	}));	
	
	$( "div#div-content" ).on("click", ".upload-btn", (function( event ) {		
		cnt = $(this).parent().parent().parent().parent().parent().index("li");
		window.open("upload.html", "search",
		"width=385,height=370,scrollbars=yes,resizeable=no,left=300,top=150");
	}));
});

var cnt;
function cntplus(path, name) {
	$("li").eq(cnt).find("div#image").html("<input type='hidden' value='"+name+"'><img src="+path+"/"+name+" alt='업로드 이미지' width='200px'>");
}

function listRemove( $item ) {		
	alert($item.last().attr("class"));
	$("ul#wcontent > li#removelist"+cnt).remove();
	cnt--;
}