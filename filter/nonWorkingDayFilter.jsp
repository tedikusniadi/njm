<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/nonworkingdayview.htm'/>";
		document.filterForm.submit();
	}

	function resets()
	{	
		var url = "<c:url value='/page/nonworkingdayview.htm'/>";
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

		var url = "<c:url value='/page/nonworkingdayview.htm?page='/>"+page;

		window.location = url;
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 47%; height: 160px; left: 200px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right" style="WIDTH:130px;">Date</td>
			<td width="310" height="28">: <input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.date}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Note</td>
			<td width="310" height="28">: <input id="note" name="note" value="${filterCriteria.note}" size="50"/></td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
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