$(function() {
	aloha(document.querySelector('#content'));
	var editables = aloha.dom.query('#content', document).map(aloha);​
/*	aloha(document.querySelector('.content'));
	for (var command in aloha.ui.commands) {
	    $('.action-' + command).on(
	        'click',
	        aloha.ui.command(aloha.ui.commands[command])
	    );
	}*/
	editables.forEach(editable) {
	    for (var command in aloha.ui.commands) {
	        $('.action-' + command + '-' + editable.id).on(
	            'click',
	            aloha.ui.command(editable, aloha.ui.commands[command])
	        );
	    }
	}
});

