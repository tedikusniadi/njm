<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterFormPlatFilter.action = "<c:url value='/page/platpreaddone.htm'/>";
		document.filterFormPlatFilter.submit();
	}

	function resets()
	{	
		var url = "<c:url value='/page/platpreaddone.htm'/>";
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

		var url = "<c:url value='/page/platpreaddone.htm?page='/>"+page;

		document.filterFormPlatFilter.action = url;
		document.filterFormPlatFilter.submit();
	}

	function opensalesperson()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsalespersonview.htm?target=salesPerson&organization='/>"+org.value);
	}
	
	function opensalescustomer()
	{
		/* var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		} */

		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer'/>");
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 36%; height: 250px; left: 400px; display:none;" toggle="explode" bg>
	<form id="filterFormPlatFilter" name="filterFormPlatFilter" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Company&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="organizationName" name="organizationName" value="${filterCriteria.organizationName}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Code &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input type="text" id="entryNo" name="code" value="${filterCriteria.code}" size="30" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Customer&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="customer" name="customer" class="combobox-ext">
				</select>
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opensalescustomer();" style="CURSOR:pointer;" title="Customer" />
			</td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">No Plat &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input type="text" id="noPlat" name="noPlat" value="${filterCriteria.noPlat}" size="30" class="inputbox"/></td>
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
