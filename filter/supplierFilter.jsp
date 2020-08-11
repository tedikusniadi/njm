	<script type="text/javascript">
		function searchs()
		{
			var url = "<c:url value='/page/supplierview.htm'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
			
		function resets()
		{
			window.location = "<c:url value='/page/supplierview.htm'/>";
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
				
			var url = "<c:url value='/page/supplierview.htm?&page='/>"+page;
			document.filterForm.action = url;
			document.filterForm.submit();
		}
	</script>
	
	<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 175px; left: 350px; display:none;" toggle="explode" bg>
		<form id="filterForm" name="filterForm" method="post">
			<table width="100%" cellspacing="0" cellpadding="0" align="right">
            <tr>
                <td align="right" style="WIDTH:130px;">ID&nbsp;&nbsp;</td>
                <td width="4">:&nbsp;</td>
                <td width="310" height="28"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
            </tr>
            <tr>
                <td align="right" style="WIDTH:130px;">Name&nbsp;&nbsp;</td>
                <td>:</td>
                <td width="310" height="28"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
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
