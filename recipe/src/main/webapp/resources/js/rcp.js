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
// 셀렉트 박스 자동 완성 기능    
    
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
        //$( "#unit" ).combobox();
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
// 재료 자동 완성 기능

$(function() {	
	$( "ul#wcontent" ).sortable({
	      revert: true,
	      cancel: "div.content-table-div-right"
	    });
	// 본문 내용 이동 가능
	
	$("#send").click(function() {	
		if($("input#title").val()==null || $("input#title").val()=="") {
			alert("요리명을 입력해주세요.");
			$("input#title").focus();
			return false;
		}
		
		if($("#ul-material > li").length==0) {
			alert("재료는 최소 한개 이상은 입력되어야합니다.");
			$("input#material").focus();
			return false;
		}
		
		for (var i=0; i<$("#wcontent > li").length; i++) {
			$("#wcontent > li").eq(i).find("#image").attr("name", "image"+i);
			// 이미지 전송 전 작업
			
			$("#sendText").append(function() {		
				var text = $("#wcontent > li").eq(i).find("div").parent().next().find("div").html();
				var sendText = "<input type='hidden' name='sendText value= '" + text+ "'>";			
				return sendText;
			});			
			// 텍스트 모아서 전송
		}	
		
		for(var i=0; i<$("#ul-material > li").length; i++) {
			$("#ul-material > li").eq(i).find("#Mmain").attr("name", "Mmain"+i);
			$("#ul-material > li").eq(i).find("#Munit").attr("name", "Munit"+i);
			$("#ul-material > li").eq(i).find("#Mamount").attr("name", "Mamount"+i);			
		}
		// 재료 전송 전 작업
		
		$("#sendLi").append(function() {		
			var numLi = $("#ul-material > li").length;
			var sendLi = "<input type='hidden' name='sendLi' value= '" + numLi+ "'>";			
			return sendLi;
		});		
		// 재료가 몇개 들어갔는지 확인
		
		$("#imageLi").append(function() {		
			var numLi = $("#wcontent > li").length;
			var imageLi = "<input type='hidden' name='imageLi' value= '" + numLi+ "'>";			
			return imageLi;
		});
		// 이미지가 몇번 들어갔는지 확인
		$("#frm").submit();
	});
		
	$("#submit").click(function () {
		$("#frm").submit(); 
	});
	// 업로드 창
	
	$("#cancel").click(function() {	
		window.close();
	});
	// 업로드 창
	
	$( "div#div-content" ).on("click", ".removelist", (function( event ) {			
		$(this).parent().parent().parent().parent().parent().remove();
		// 본문 li 제거
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
		// 본문 li 추가
		
		var position = $(this).offset();
	    $('html, body').animate({scrollTop : position.top}, 1000);
	    // 본문 li 추가 하면 스크롤 이동
	}));	
	
	$( "div#div-content" ).on("click", ".upload-btn", (function( event ) {		
		cnt = $(this).parent().parent().parent().parent().parent().index("li");
		window.open("upload.html", "search",
		"width=385,height=370,scrollbars=yes,resizeable=no,left=300,top=150");
		// 업로드 창 생성
	}));
});

var cnt;
function cntplus(path, name) {
	$("li").eq(cnt).find("div#image").html("<input type='hidden' name='image0' id='image' value='"+name+"'><img src="+path+"/"+name+" alt='업로드 이미지' width='200px'>");
}
// 이미지명 전송 전 작업 및 li에 이미지 추가