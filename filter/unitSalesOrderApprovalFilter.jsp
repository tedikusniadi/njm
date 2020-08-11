<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/unitsalesorderapproval.htm'/>";
		document.filterFormApproval.action = url;
		document.filterFormApproval.submit();
	}

	function resets()
	{
		window.location = "<c:url value='/page/unitsalesorderapproval.htm'/>";
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

		document.filterFormApproval.action = "<c:url value='/page/unitsalesorderapproval.htm?page='/>"+page;
		document.filterFormApproval.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 28%; height: 240px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterFormApproval" name="filterFormApproval" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Kode&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Nama&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="400" height="28"><input type="text" id="customerName" name="customerName" value="${filterCriteria.customerName}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" nowrap="nowrap">Nama STNK&nbsp;&nbsp;</td>
			<td>:</td>
			<td><input type="text" id="customerUnitName" name="customerUnitName" value="${filterCriteria.customerUnitName}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
            <td align="right">Dari Tgl &nbsp;&nbsp;</td>
            <td>:</td>
            <td>
                <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
            </td>
		</tr>
		<tr>
            <td align="right">Sampai Tgl &nbsp;&nbsp;</td>
            <td>:</td>
            <td>
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
