<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/productionresourceview.htm'/>";
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/productionresourceview.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/productionresourceview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 25%; height: 180px; left: 360px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="right">Code</td>
			<td>:</td>
			<td width="304" height="28"><input name="code" value="${filterCriteria.code}" size="28" /></td>
		</tr>
		<tr>
			<td align="right">Name</td>
			<td>:</td>
			<td width="304" height="28"><input name="name" value="${filterCriteria.name}" size="28" /></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<button onClick="searchs();">Search</button>
				<button onClick="resets();">Reset&nbsp;</button>
			</td>
		</tr>
		</table>
	</form>
</div>
