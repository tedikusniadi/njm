<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/plafondebitview.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}

	function resets()
	{
		window.location = "<c:url value='/page/plafondebitview.htm'/>";
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

		document.filterForm.action = "<c:url value='/page/plafondebitview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 250px; left: 100px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<%-- <input type="hidden" name="cat" value="${filterCriteria.cat}"/> --%>
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Plafon ID&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		
		<tr>
			<td align="right">Plafon Facility&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input type="text" id="facility" name="facility" value="${filterCriteria.facility}" size="35" class="inputbox"/>
			&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popuppartyrelationshipview.htm?target=relation&type=5'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Currency&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28">
				<input type="text" id="curr" name="currency" value="${filterCriteria.currency}" size="35" class="inputbox"/>
				&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/currencypopupView.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Bank Account&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28">
				<input type="text" id="bankaccount" name="bankaccount" value="${filterCriteria.bankaccount}" size="35" class="inputbox"/>
				&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountallview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
            <td align="right">Date From&nbsp;&nbsp;</td>
            <td>:&nbsp;</td>
            <td>
                <input id="dateFrom" name="dateFrom" dojoType="dropdowndatepicker" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                &nbsp;Date To&nbsp;:&nbsp;
                <input id="dateTo" name="dateTo" dojoType="dropdowndatepicker" value="<fmt:formatDate value='${filterCriteria.dateTo}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
