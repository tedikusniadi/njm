<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/unitsalesordersubdictionextraview.htm'/>";
		document.filterForm.submit();
	}

	function resets()
	{	
		var url = "<c:url value='/page/unitsalesordersubdictionextraview.htm'/>";
		window.location = url;
	}

	function step(action)
	{
		var page="1";

		if(action == "next")
			page="${filterCriteria.nextPage}";
		else if(action == "prev")
			page="${filterCriteria.prevPage}";
		else if(action == "last")
			page="${filterCriteria.totalPage}";

		var url = "<c:url value='/page/unitsalesordersubdictionextraview.htm?page='/>"+page;

		window.location = url;
	}
</script>
