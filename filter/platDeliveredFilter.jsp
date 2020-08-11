<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/platdeliveredview.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/platdeliveredview.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/platdeliveredview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 38%; height: 300px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" style='border:none;'>
		<tr>
			<td align="right">Company&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="organizationName" name="organizationName" value="${filterCriteria.organizationName}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Nama / Tipe&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">No Mesin&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serial" name="serial" value="${filterCriteria.serial}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">No Rangka&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serialExt1" name="serialExt1" value="${filterCriteria.serialExt1}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">No Plat&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="referenceNo" name="referenceNo" value="${filterCriteria.referenceNo}" size="35" class="inputbox"/></td>
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
