<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/shipmentview.htm'/>";
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/shipmentview.htm'/>"
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
			
		document.filterForm.action = "<c:url value='/page/shipmentview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 50%; height: 280px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">ID&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Company&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="orgto" name="organization" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=orgto'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Vehicle&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input name="vehicle" value="${filterCriteria.vehicle}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Note&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input name="note" value="${filterCriteria.note}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Status&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="locked" name="locked" class="combobox">
					<option value=''>&nbsp;</option>
					<option value='true'>Locked</option>
					<option value='false'>Unlocked</option>
				</select>
			</td>
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
