<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/billingcollectingdocumentview.htm'/>";
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/billingcollectingdocumentview.htm'/>";	
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
			
		document.filterForm.action = "<c:url value='/page/billingcollectingdocumentview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 200px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="2" align="right">
		<tr>
			<td align="right">Status</td>
			<td>:</td>
			<td>
				<select name="status">
					<option></option>
					<option value='${filterCriteria.status}'><c:out value='${filterCriteria.status}'/></option>
					<option value='FINANCE'>FINANCE</option>
					<option value='COLLECTOR'>COLLECTOR</option>
					<option value='ACCEPTED'>ACCEPTED</option>
				</select>
			</td>
		</tr>
		<tr>
            <td align="right">Date From</td>
            <td>:</td>
            <td>
                <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                &nbsp;Date To &nbsp;:&nbsp;
                <input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateTo}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
            </td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left"><button onclick="searchs();">Search</button>&nbsp;&nbsp;<button onclick="resets();">Reset&nbsp;</button></td>
		</tr>
		</table>
	</form>
</div>
