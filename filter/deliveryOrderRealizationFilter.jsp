<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/unitdeliveryorderrealizationview.htm'/>";
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/unitdeliveryorderrealizationview.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/unitdeliveryorderrealizationview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" style="width: 45%; height: 270px; left: 300px; display:none;" toggle="explode">
	<form id="filterForm" name="filterForm" method="post">
		<table >
		<tr>
			<td align="right">ID&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Delivery Order ID&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input type="text" id="order" name="order" value="${filterCriteria.order}" size="35" class="inputbox"/></td>
		</tr>
        <tr>
			<td align="right">Driver&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="driver" name="driver" value="${filterCriteria.driver}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Vehicle&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="vehicle" name="vehicle" value="${filterCriteria.vehicle}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
            <td align="right">Date From&nbsp;&nbsp;</td>
            <td>:&nbsp;</td>
            <td>
                <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                &nbsp;Date To&nbsp;:&nbsp;
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
