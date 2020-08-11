<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/facilityview.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		
		document.getElementById("name").value = "";
				
		var url = "<c:url value='/page/facilityview.htm'/>";
				
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
			
		document.filterForm.action = "<c:url value='/page/facilityview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 30%; height: 130px; left: 200px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Name&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
		</tr>
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
