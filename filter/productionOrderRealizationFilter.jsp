<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">		
		function searchs()
		{
			var url = "<c:url value='/page/productionorderrealizationview'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
		
		function resets()
		{
			window.location = "<c:url value='/page/productionorderrealizationview'/>";
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
			
			document.filterForm.action = "<c:url value='/page/productionorderrealizationview?page='/>"+page;
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
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<button onClick="searchs();" style='width:85px;'>Search</button>
				<button onClick="resets();" style='width:85px;'>Reset</button>
			</td>
		</tr>
		</table>
	</form>
</div>
