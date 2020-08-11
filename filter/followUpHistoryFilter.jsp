<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchsFilter()
	{
		document.formPanel.action = "<c:url value='/page/followuphistoryview.htm'/>";
		document.formPanel.submit();
	}

	function resetsFilter()
	{
		var url = "<c:url value='/page/followuphistoryview.htm'/>";
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

		var url = "<c:url value='/page/followuphistoryview.htm?page='/>"+page;

		document.formPanel.action = url;
		document.formPanel.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 47%; height: 250px; left: 400px; display:none;" toggle="explode" bg>
	<form id="formPanel" name="formPanel" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right" style="WIDTH:130px;">Customer &nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="customer" name="customer" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openCustomer('customer');" style="CURSOR:pointer;" title="Customer" />
			</td>
		</tr>
		<tr>
			<td align="right">Sales Person &nbsp;</td>
			<td>:&nbsp;</td>
			<td height="28">
				<select id="salesPerson" name="salesPerson" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openSalesman('salesPerson');" style="CURSOR:pointer;" title="Sales Person" />
			</td>
		</tr>
		<tr>
			<td align="right">Follow Up Date &nbsp;</td>
			<td>:&nbsp;</td>
			<td height="28">
				<input id="prevdate" name="prevDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.prevDate}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
			</td>
		</tr>
		<tr>
			<td align="right">Next Follow Up Date &nbsp;</td>
			<td>:&nbsp;</td>
			<td height="28">
				<input id="nextdate" name="nextDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.nextDate}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
			</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchsFilter();" class="btn"/>
				<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetsFilter();" class="btn"/>
			</td>
		</tr>
		</table>
	</form>
</div>
