<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterDiscountForm.action = "<c:url value='/page/productsparepartdiscountview.htm'/>";
		document.filterDiscountForm.submit();
	}

	function resets()
	{	
		var url = "<c:url value='/page/productsparepartdiscountview.htm'/>";
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

		var url = "<c:url value='/page/productsparepartdiscountview.htm?page='/>"+page;

		document.filterDiscountForm.action = url;
		document.filterDiscountForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 250px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterDiscountForm" name="filterDiscountForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Discount Type</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<form:select path="filterCriteria.type">
				<form:option value="AGP" label="AGP"/>
				<form:option value="HGP" label="HGP"/>
				<form:option value="NON_HGP" label="NON HGP"/>
				<form:option value="OLI" label="OLI"/>
			</form:select>
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