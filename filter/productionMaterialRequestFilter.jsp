<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">		
		function searchs()
		{
			var url = "<c:url value='/page/productionmaterialrequestview.htm'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
		
		function resets()
		{
			window.location = "<c:url value='/page/productionmaterialrequestview.htm'/>";
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
			
			document.filterForm.action = "<c:url value='/page/productionmaterialrequestview.htm?page='/>"+page;
			document.filterForm.submit();
		}
	</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 500px; height: 175px; left: 400px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right" style="WIDTH:130px;">ID &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input name="code" value="${filterCriteria.code}" size="30" /></td>
		</tr>
		<tr>
			<td align="right">Date From &nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td>
				<input id="dateFrom" name="dateFrom" dojoType="dropdowndatepicker" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
				&nbsp;Date To &nbsp;:&nbsp;
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
