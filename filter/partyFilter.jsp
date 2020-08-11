<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/partyview.htm?mode=search'/>";
		document.filterForm.submit();
	}
	
	function resets()
	{
		window.location = "<c:url value='/page/partyview.htm'/>";
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
		
		document.filterForm.action = "<c:url value='/page/partyview.htm?mode=${mode}&page='/>"+page;
		document.filterForm.submit();
	}			
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 55%; height: 200px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Party ID&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input type="text" name="code" id="code" class="inputbox" value="<c:out value='${filterCriteria.code}'/>"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Party Name&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input type="text" id="name" name="name" class="inputbox" value="<c:out value='${filterCriteria.name}'/>"/></td>
	</tr>
    <tr>
		<td align="right" style="WIDTH:130px;">Party Role&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
        	<select name="partyRole" class="combobox">
            	<option value="" selected>&nbsp;</option>
            	<c:forEach items='${roles}' var='role'>
                	<option value="${role.id}" <c:if test='${role.id == filterCriteria.partyRole}'>selected</c:if>>${role.name}</option>
                </c:forEach>
            </select>
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
