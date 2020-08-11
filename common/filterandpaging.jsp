<script type="text/javascript">
	function search(url)
	{
		$.ajax({
			url:url+"&popupid=${param.popupid}",
			data:$('#filterForm').serialize(),
			type : 'POST',
			cache: false,
			success : function(resp) {
				$("#${param.popupid}").html(resp);
			}
		});
	}
	
	function searchPopup(url)
	{
		$.ajax({
			url:url+"&popupid=${param.popupid}",
			data:$('#filterFormPopup').serialize(),
			type : 'POST',
			cache: false,
			success : function(resp) {
				$("#${param.popupid}").html(resp);
			}
		});
	}
	
	function reset(){
		resetPopup();
	}
	
	function resetPopup(){
		$("#${param.popupid}").load($("#${param.popupid}").attr("url")+"&popupid=${param.popupid}");
	}

	function step(action,url)
	{
		var page="1";
		if(action == "next")
			page="${filterCriteria.nextPage}";
		else if(action == "prev")
			page="${filterCriteria.prevPage}";
		else if(action == "last")
			page="${filterCriteria.totalPage}";
		url+=("&page="+page+"&popupid=${param.popupid}");
		$.post(url,function(data){
			$("#${param.popupid}").html(data);
		});
	}

	//OVERRIDE STANDARD FUNCTION
	var self=new Object();
	self.opener=window;
	window.close=function(){closepopup("${param.popupid}");}
	$("button").bind("click",function(event){
		event.preventDefault();
	});
</script>