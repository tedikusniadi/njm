<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/unitinvoicemaindealerpreaddone.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/unitinvoicemaindealerpreaddone.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/unitinvoicemaindealerpreaddone.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 38%; height: 280px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" style='border:none;'>
		<tr>
			<td align="right">Code&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
        <tr>
			<td align="right">Customer Name&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="customer" name="customer" value="${filterCriteria.customer}" size="35" class="inputbox"/></td>
		</tr>
        <tr>
			<td align="right">STNK Name&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="customerUnit" name="customerUnit" value="${filterCriteria.customerUnit}" size="35" class="inputbox"/></td>
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
