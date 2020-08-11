<script type="text/javascript">
		function searchs()
		{
			var url = "<c:url value='/page/counterregisterview.htm'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
			
		function resets()
		{
			var url = "<c:url value='/page/counterregisterview.htm'/>";
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
				
			var url = "<c:url value='/page/counterregisterview.htm?&page='/>"+page;
			document.filterForm.action = url;
			document.filterForm.submit();
		}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 200px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="3" align="right">
		<tr>
			<td  align="right" style="WIDTH:130px;">Code</td>
			<td width="1">:</td>
			<td width="411"><input id="code" name="counterCode" value="${filterCriteria.counterCode}" size="35" /></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchs();" class="btn"/>
				<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resets();" class="btn"/>
			</td>
		</tr>
		</table>
	</form>
</div>
