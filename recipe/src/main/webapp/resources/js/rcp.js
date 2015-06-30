var cnt;
function cntplus(path, name) {
	//document.getElementById("image"+cnt).innerHTML = "<img src=${path}/${name} alt='업로드 이미지' width='200px'>";
	alert($("li").eq(cnt).find("div").attr("id"));
	$("li").eq(cnt).find("div#image").html("<img src="+path+"/"+name+" alt='업로드 이미지' width='200px'>");
}

$(function() {
	$( "div#div-content" ).on("click", ".removelist", (function( event ) {			
		$(this).parent().parent().parent().parent().parent().fadeOut(2000).remove();
	}));

	$( "div#div-content" ).on("click", ".addlist", (function( event ) {	
		$(this).parent().parent().parent().parent().parent().after("<li id='li-content' style='display:none;'><table class='content-table'>"
				+ "<tr>"
				+		"<td><div id='image' class='content-table-div-left'></div></td>"
				+		"<td style='padding-left: 10px;'><div contenteditable='true' class='content-table-div-right'></div></td>"
				+"</tr>"
				+"<tr>"
				+		"<td style='padding-top: 10px;'><input type='button' value='사진 등록' id='upload' class='upload-btn'></td>"
				+		"<td align='right' style='padding-top: 10px;'><button style='margin-right: 10px;' class='addlist'>추가</button><button class='removelist'>삭제</button></td>"
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

function listRemove( $item ) {		
	alert($item.last().attr("class"));
	$("ul#wcontent > li#removelist"+cnt).remove();
	cnt--;
};

$(function () {
	$("#submit").click(function () {
		$("#frm").submit(); 
	});
});

$(function() {
	$("#cancel").click(function() {	
		window.close();
	});
});
// 업로드 된 이미지 전송