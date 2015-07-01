(function( $ ) {
    $.widget( "custom.combobox", {
        _create: function() {
          this.wrapper = $( "<span>" )
            .addClass( "custom-combobox" )
            .insertAfter( this.element );
   
          this.element.hide();
          this._createAutocomplete();
          this._createShowAllButton();
        },
   
        _createAutocomplete: function() {
          var selected = this.element.children( ":selected" ),
            value = selected.val() ? selected.text() : "";
   
          this.input = $( "<input>" )
            .appendTo( this.wrapper )
            .val( value )
            .attr( "title", "" )
            .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
            .autocomplete({
              delay: 0,
              minLength: 0,
              source: $.proxy( this, "_source" )
            })
            .tooltip({
              tooltipClass: "ui-state-highlight"
            });
   
          this._on( this.input, {
            autocompleteselect: function( event, ui ) {
              ui.item.option.selected = true;
              this._trigger( "select", event, {
                item: ui.item.option
              });
            },
   
            autocompletechange: "_removeIfInvalid"
          });
        },
   
        _createShowAllButton: function() {
          var input = this.input,
            wasOpen = false;
   
          $( "<a>" )
            .attr( "tabIndex", -1 )
            .attr( "title", "Show All Items" )
            .tooltip()
            .appendTo( this.wrapper )
            .button({
              icons: {
                primary: "ui-icon-triangle-1-s"
              },
              text: false
            })
            .removeClass( "ui-corner-all" )
            .addClass( "custom-combobox-toggle ui-corner-right" )
            .mousedown(function() {
              wasOpen = input.autocomplete( "widget" ).is( ":visible" );
            })
            .click(function() {
              input.focus();
   
              // Close if already visible
              if ( wasOpen ) {
                return;
              }
   
              // Pass empty string as value to search for, displaying all results
              input.autocomplete( "search", "" );
            });
        },
   
        _source: function( request, response ) {
          var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
          response( this.element.children( "option" ).map(function() {
            var text = $( this ).text();
            if ( this.value && ( !request.term || matcher.test(text) ) )
              return {
                label: text,
                value: text,
                option: this
              };
          }) );
        },
   
        _removeIfInvalid: function( event, ui ) {
   
          // Selected an item, nothing to do
          if ( ui.item ) {
            return;
          }
   
          // Search for a match (case-insensitive)
          var value = this.input.val(),
            valueLowerCase = value.toLowerCase(),
            valid = false;
          this.element.children( "option" ).each(function() {
            if ( $( this ).text().toLowerCase() === valueLowerCase ) {
              this.selected = valid = true;
              return false;
            }
          });
   
          // Found a match, nothing to do
          if ( valid ) {
            return;
          }
   
          // Remove invalid value
          this.input
            .val( "" )
            .attr( "title", value + " didn't match any item" )
            .tooltip( "open" );
          this.element.val( "" );
          this._delay(function() {
            this.input.tooltip( "close" ).attr( "title", "" );
          }, 2500 );
          this.input.autocomplete( "instance" ).term = "";
        },
   
        _destroy: function() {
          this.wrapper.remove();
          this.element.show();
        }
      });
    })( jQuery );
   
    $(function() {
      $( ".selectbox" ).combobox();
      $( "#toggle" ).click(function() {
        $( "#unit" ).toggle();
      });
    });



/////////////////////////////////////////////////////////////////////////////////////
    
    
    
$(function() {
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
    function log( message ) {
        $( "<li><div>" ).html( "<input type='text' id='Mmain' value='"+message+"'style='width:100px; border: none;' readonly='readonly'>  / 단위 : <select class='selectbox' id='Munit'><option value='spoon'>spoon</option>"
    + "<option value='ActionScript'>ActionScript</option></select> /  양 : <input type='text' id='Mamount'>").prependTo( "#ul-material" );
        $( "#ul-material" ).scrollTop( 0 );
        $( "#unit" ).combobox();
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
          $.getJSON( "material.html", {
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
          this.value =  "" ;          
          log( ui.item ? ui.item.value : "Nothing selected, input was " + this.value );          
          return false;
        }
      });
  });

$(function() {	
	$( "ul#wcontent" ).sortable({
	      revert: true,
	      cancel: "div.content-table-div-right"
	    });	 
	
	$("#send").click(function() {
		for (var i=0; i<$("#wcontent > li").length; i++) {
			$("#sendImage").append(function() {		
				var img = $("#wcontent > li").eq(i).find("input#sendImage").val();
				var sendImage = "<input type='hidden' name='image' value= '" + img+ "'>";			
				return sendImage;
			});				
			
			$("#sendText").append(function() {		
				var text = $("#wcontent > li").eq(i).find("div").parent().next().find("div").html();
				var sendText = "<input type='hidden' name='sendText' value= '" + text+ "'>";			
				return sendText;
			});			
		}
		
		for(var i=0; i<$("#ul-material > li").length; i++) {
			$("#ul-material > li").eq(i).find("#Mmain").attr("name", "Mmain"+i);
			$("#ul-material > li").eq(i).find("#Munit").attr("name", "Munit"+i);
			$("#ul-material > li").eq(i).find("#Mamount").attr("name", "Mamount"+i);			
		}		
		
		$("#sendLi").append(function() {		
			var numLi = $("#ul-material > li").length;
			var sendLi = "<input type='hidden' name='sendLi' value= '" + numLi+ "'>";			
			return sendLi;
		});			
		$("#frm").submit();
	});
		
	$("#submit").click(function () {
		$("#frm").submit(); 
	});
	
	$("#cancel").click(function() {	
		window.close();
	});
	
	$( "div#div-content" ).on("click", ".removelist", (function( event ) {			
		$(this).parent().parent().parent().parent().parent().remove();
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
	$("li").eq(cnt).find("div#image").html("<input type='hidden' id='sendImage' value='"+name+"'><img src="+path+"/"+name+" alt='업로드 이미지' width='200px'>");
}

function listRemove( $item ) {		
	alert($item.last().attr("class"));
	$("ul#wcontent > li#removelist"+cnt).remove();
	cnt--;
}