<script type="text/javascript">
			function searchs()
			{
				document.filterForm.action = "<c:url value='/page/accountingschemaview.htm?mode=search'/>";
				document.filterForm.submit();
			}
			
			function resets()
			{
				window.location = "<c:url value='/page/accountingschemaview.htm'/>";
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
				
				var url = "<c:url value='/page/accountingschemaview.htm?mode=${mode}&page='/>"+page;
				
				document.filterForm.action = url;
				document.filterForm.submit();
			}			
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 47%; height: 210px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Schema ID&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input name="code" id="code" class="inputbox" value="${filterCriteria.code}"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Schema Name&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input type="text" id="name" name="name" class="inputbox" value="${filterCriteria.name}"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Organization</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<select id="org" name="organization" class="combobox-ext">
			</select>
            &nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
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
