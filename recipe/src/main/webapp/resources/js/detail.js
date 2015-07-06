$(function() {
	var no = $('#recipeNo').val();
	replyLoad(no);
	$('#rating').bind('click', function() {
		var rate = $('#rateSelect').val();
		$.ajax({
			url : './rate.html',
			data : {
				"postNo" : no,
				"rate" : rate
			},
			async : true,
			success : function(result) {
				var data = JSON.parse(result);
				if (data.result < 1)
					return false;
				$('#score').text("평점 : " + data.average);
				$('#count').text("(" + data.count + "명 참여)");
				$('#rating').hide();
			}
		});
	});
});
function replyLoad(postNo) {
	$.ajax({
		url : './reply.html',
		data : {
			"postNo" : postNo
		},
		async : true,
		success : function(result) {
			$('#comment').html(result);
		}
	});
}
function delComment(no, postNo) {
//	var thisLi = $("#commentLi_" + no);
	if (confirm("삭제할까요")) {
		$.ajax({
			url : './delReply.html',
			data : {
				"no" : no
			},
			async : true,
			success : function(result) {
				if (result == 1) {
					replyLoad(postNo);
				}
			}
		});
	}
}
function replyC(no) {
	var email=$('#email').val();
	var thisLi = $('#commentLi_' + no);
	$('#replyDiv').remove();
	$(thisLi).append("<div id='replyDiv'><form name='reply' method='post' action='reply.html'>" +
			"<div><span><input type='text' value='"+email+"' name='email' id='email' readonly='readonly'></span>" +
			"<input type='submit' value='입력'></div>" +
			"<div><input type='text' placeholder='댓글을 입력하세요' name='content' required='required'></div>" +
			"<input type='hidden' value='"+no+"' name='no'></form></div>");
}
function del(no,pageNo) {
	if (confirm("삭제할까요")) {
		location.href="./delete.html?no="+no+"&pageNo="pageNo;
	}
}