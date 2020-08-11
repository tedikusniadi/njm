<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/productionworkunitview.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		document.getElementById("code").value = "";
		document.getElementById("name").value = "";
				
		var url = "<c:url value='/page/productionworkunitview.htm'/>";
				
		document.filterForm.action = url;
		document.filterForm.submit();
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
			
		document.filterForm.action = "<c:url value='/page/productionworkunitview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 25%; height: 180px; left: 360px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="right">Code&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Name&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
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
