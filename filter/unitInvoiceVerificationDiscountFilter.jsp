<script type="text/javascript">		
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/unitinvoiceverificationdiscountview.htm'/>";
		document.filterForm.submit();
	}
		
	function resets()
	{
		window.location = "<c:url value='/page/unitinvoiceverificationdiscountview.htm'/>";
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
			
		var url = "<c:url value='/page/unitinvoiceverificationdiscountview.htm?page='/>"+page;
		
		document.filterForm.action = url;
		document.filterForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 47%; height: 230px; left: 400px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right" style="WIDTH:130px;">Name &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input id="name" name="name" value="${filterCriteria.name}" size="30" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Date From &nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td>
				<input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
				&nbsp;Date To &nbsp;:&nbsp;
				<input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateTo}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
			</td>
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
