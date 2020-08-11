<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var receiptFrom = "${filterCriteria.receiptFrom}";
		var url = "";
		if(receiptFrom == "UNIT")
			url = "<c:url value='/page/receiptview.htm'/>";
		else if(receiptFrom == "SPAREPART")
			url = "<c:url value='/page/sparepartreceiptview.htm'/>";
		else 
			url = "<c:url value='/page/unitservicetransactionreceiptview.htm'/>";
		
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		var receiptFrom = "${filterCriteria.receiptFrom}";
		if(receiptFrom == "UNIT")
			window.location = "<c:url value='/page/receiptview.htm'/>";
		else if(receiptFrom == "SPAREPART")
			window.location = "<c:url value='/page/sparepartreceiptview.htm'/>";
		else
			window.location = "<c:url value='/page/unitservicetransactionreceiptview.htm'/>";
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
			
		var receiptFrom = "${filterCriteria.receiptFrom}";
		if(receiptFrom == "UNIT")
			document.filterForm.action = "<c:url value='/page/receiptview.htm?page='/>"+page;
		else if(receiptFrom == "SPAREPART")
			document.filterForm.action = "<c:url value='/page/sparepartreceiptview.htm?page='/>"+page;
		else
			document.filterForm.action = "<c:url value='/page/unitservicetransactionreceiptview.htm?page='/>"+page;
			
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 48%; height: 200px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" style='border:none;'>
		<tr>
			<td align="right">Receipt Number&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
        <tr>
			<td align="right">Customer Name&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="customer" name="customer" value="${filterCriteria.customer}" size="35" class="inputbox"/></td>
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
