/**
 * 
 */

$(function() {
	var editables = aloha.dom.query('#content', document).map(aloha);
	for (var command in aloha.ui.commands) {
	    $('.action-' + command + '-' + editable.id).on(
	        'click',
	        aloha.ui.command(aloha.ui.commands[command])
	    );
	}
});
