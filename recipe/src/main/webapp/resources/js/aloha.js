
$(function() {
	aloha(document.querySelector('#content'));
	editables.forEach(editable) {
	    for (var command in aloha.ui.commands) {
	        $('.action-' + command + '-' + editable.id).on(
	            'click',
	            aloha.ui.command(editable, aloha.ui.commands[command])
	        );
	    }
	}
});
