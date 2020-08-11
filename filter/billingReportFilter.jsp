<script type="text/javascript">
	function step(action,url)
	{
		var page="1";

		if(action == "next")
			page="${filterCriteria.nextPage}";
		else if(action == "prev")
			page="${filterCriteria.prevPage}";
		else if(action == "last")
			page="${filterCriteria.totalPage}";
		
		document.filterForm.action = url+"?page="+page;
		document.filterForm.submit();
	}	
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 48%; height: 230px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
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
		<tr>
			<td align="right" style="WIDTH:130px;">Organization&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="orgto" name="organization" class="combobox-ext">
				</select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=orgto'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		</table>
	</form>
</div>
