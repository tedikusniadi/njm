/**
 * @author Muhammad Khairullah
 * Sirius Indonesia, PT
 * www.siriuserp.com
 */

//create some variables
var $confirmDialog, $dialog;

//import widget dojo
dojo.require("dojo.widget.*");

//jquery function for key binding
$(document).ready(function() {

	$ctrl = function(key, callback, args) {
	    $(document).keydown(function(e) {
	        if(!args) args=[]; // IE barks when args is null
	        if(e.keyCode == key.charCodeAt(0) && e.ctrlKey) {
	            callback.apply(this, args);
	            return false;
	        }
	    });
	};

	//bind hotkey on document
	$(document).keydown(function(e){if(e.which==20)warning('CAPSLOCK has been switch');});
	$ctrl("S",function(){
		if($(".item-button-save").length>0){
			$(".item-button-save").click();
			save();
		}
		if($(".item-button-update").length>0){
			$(".item-button-update").click();
			save();
		}
	});

	$(".datepicker").datepicker({
		showOn: "button",
		buttonImage: "assets/icons/calendar.png",
		buttonImageOnly:true,
		dateFormat: 'dd-mm-yy'
	});

	//bind click Top link
	$('#se-top-link').click(function(event) {
		event.preventDefault();
		$('body,html').animate({
			scrollTop : 0
		}, 800);
	}).attr("title","Click for auto-scroll to top");

	//bind top search box
	$('#searchMenu').bind({
		keydown : function() {
			if (this.value == "Menu...") {
				$(this).val("");
				$(this).css("color", "black");
				$(this).css("font-style", "normal");
			}
		},
		blur : function() {
			if (this.value == "") {
				$(this).val("Menu...");
				$(this).css("color", "#cdcdcd");
				$(this).css("font-style", "italic");
			}
		}
	});

	/**bind input-number class
	*190=.
	*188=,
	*/
	$(".input-number").bind({
		keydown : function(event) {
            if (((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) &&
            	!(event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 188 || event.keyCode == 190)){
                event.preventDefault();
            }
		},
		keyup : function(event) {
			if(event.keyCode==188){
				if(!$(this).val().indexOf(".")===1)
					$(this).val(Number.parse($(this).val()).numberFormat("#,###.00"));
			}else if(event.keyCode==190){}
			else
				if(!$(this).val().indexOf(".")===1)
					$(this).val(Number.parse($(this).val()).numberFormat("#,###.00"));
		},
		blur : function() {
			if($(this).val()!=""){
				$(this).val(Number.parse($(this).val()).numberFormat("#,###.00"));
			}else{
				$(this).val(0);
			}
		}
	});

	$(".input-number-noformat").bind({
		keydown : function(event) {
            if (((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) &&
            	!(event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 188 || event.keyCode == 190)){
                event.preventDefault();
            }
		}
	});
	//initialize tab component
	$("#tabs").tabs();

	//create information dialog
	$dialog = $('<div></div>').dialog({
		autoOpen : false,
		title : 'Information',
		modal : true,
		buttons : {
			Close : function() {
				$(this).dialog('close');
			}
		}
	});

	//resize the content body
	resizeContent();
});
function showDialog(html){
	$dialog.empty();
	$dialog.html(html);
	$dialog.dialog('open');
}

function warning(text){
	if($(".ui-notification").length>0)
		setTimeout(function(){$(".ui-notification").fadeOut('slow');$(".ui-notification").remove();},3000);
	$warn=$("<div class='ui-notification'></div>");
	$warn.html(text);
	$("body").append($warn);
	$warn.click(function(){$warn.remove();});
	setTimeout(function(){$(".ui-notification").fadeOut('slow');$warn.remove();},3000);
}

function alert(text){
	$dialog.empty();
	$dialog.html(text);
	$dialog.dialog('open');
}

//show dialog function and go to url after
function deleteDialog(url,message){
	if(message==null)
		message="Delete data ?";
	else
		message="Delete data "+message+" ?";
	$confirmDialog = $("<div><span>"+message+"</span></div>").dialog({
		title : 'Information',
		modal : true,
		buttons : {
			"Delete" :{
				text:"Delete",
				id:"btn-dialog-delete",
				click:function() {
					$(this).dialog("close");
					window.location = url;
				}
			},
			"Cancel" :{
				text:"Cancel",
				id:"btn-dialog-cancel",
				click:function() {
					$(this).dialog("close");
				}
			}
		}
	});
	$confirmDialog.dialog("open");
}

//set value to title
function emptyValue(elem) {
	elem.value = "";
	elem.onblur = function() {
		if (elem.value == "")
			elem.value = elem.getAttribute("title");
	}
}

//go to with location
function go_to(url) {
	window.location = url;
}

//resize the content body
function resizeContent() {
	var subtractHeight = 180;
	var size = $(window).height() - subtractHeight;
	var height = $('#se-contents').css('height');
	var width = $('#se-contents').css('width');
	if($('#se-contents').length>0)
	{
		height = height.substring(0, height.length - 2);
		width = width.substring(0, width.length - 2);

		// Check if the predefined height less than window size
		if (height < size) {
			$('#se-contents').css('min-height', ($(window).height() - subtractHeight) + 'px');
			$('#se-contents').css('height', '100%');
			var height = $('#se-contents').css('height');
			height = height.substring(0, height.length - 2);
			$('.main-box').css('min-height', (height - 50) + 'px');
			$('.main-box').css('height', '100%');
		}

		// uncomment this line if the resolution doesn't set maximum and comment the
		// 3 line bellow
		// $('#se-top').css('width', (parseInt(width)+62)+'px');
		$('#se-top-container').css('width', '100%');
		$('#se-containers').css('width', '100%');
		$('#footer').css('width', '100%');
	}
}

// PURPOSE FOR TESTING SIMPLE QUERY
/*
 * $(".home").click(function(){ var
 * url="http://192.168.0.146:8080/siriuserp/page/partyremote.getdetail.json?jsoncallback=?";
 * var data={id:"1841"}; $.getJSON(url,data,function(resp){ alert(resp.region);
 * }); window.location="<c:url value='/page/start.htm' />"; });
 */