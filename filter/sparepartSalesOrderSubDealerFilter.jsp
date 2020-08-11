<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/sparepartsalesordersubdealerview.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/sparepartsalesordersubdealerview.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/sparepartsalesordersubdealerview.htm?page='/>"+page;
		document.filterForm.submit();
	}
	
	function openfacility(target)
	{		
		openpopup("<c:url value='/page/popupfacilityview.htm?'/>target="+target);
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 230px; left: 425px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">ID&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Source&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28">
			<select id="source" name="source" cssClass="combobox-ext">
				<option value=''>---Choose Source---</option>
			</select>
			&nbsp;
			<img src="assets/icons/list_extensions.gif" onclick="openfacility('source');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Destination&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28">
			<select id="destination" name="destination" cssClass="combobox-ext">
				<option value=''>---Choose Source---</option>
			</select>
			&nbsp;
			<img src="assets/icons/list_extensions.gif" onclick="openfacility('destination');" style="CURSOR:pointer;" title="Company Structure" />
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
