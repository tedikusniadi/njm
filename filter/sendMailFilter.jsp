<div dojoType="FloatingPane" id="filter" title='Filter' constrainToContainer="true" style="width: 30%; height: 200px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="1" align="right">
	<tr>
		<td align="right">Mail To</td>
		<td align="center">:&nbsp;</td>
		<td><input name="mailTo" class="inputbox" value="${filterCriteria.mailTo}"/></td>
	</tr>
	<tr>
		<td align="right">Subject</td>
		<td align="center">:&nbsp;</td>
		<td ><input name="subject" class="inputbox" value="${filterCriteria.subject}"/></td>
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
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/sendmailview.htm'/>";
		document.filterForm.submit();
	}

	function resets()
	{
		var url = "<c:url value='/page/sendmailview.htm'/>";
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

		var url = "<c:url value='/page/sendmailview.htm?page='/>"+page;

		document.filterForm.action = url;
		document.filterForm.submit();
	}
</script>