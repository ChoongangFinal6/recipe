var cnt = 0;	// 이미지 아이디에 사용함.
$(function() {
	$("#upload").click(function() {
		if(cnt > 1) {
			alert("사진을 추가할 수 없습니다.");			
		} else {			
			window.open("upload.html?cnt="+cnt, "search",
			"width=385,height=370,scrollbars=yes,resizeable=no,left=300,top=150");		
		}					
	});				
});
// 업로드 버튼

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