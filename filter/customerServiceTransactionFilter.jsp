<script type="text/javascript">
		function searchs()
		{
			var url = "<c:url value='/page/customertransactionview.htm'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
			
		function resets()
		{
			document.getElementById("code").value = "";
			document.getElementById("name").value = "";
			document.getElementById("plate").value = "";
			document.getElementById("unitType").value = "";
			document.getElementById("serialExt1").value = "";
			var url = "<c:url value='/page/customertransactionview.htm'/>";
				
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
				
			var url = "<c:url value='/page/customertransactionview.htm?&page='/>"+page;
			document.filterForm.action = url;
			document.filterForm.submit();
		}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 250px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="1" align="right">
		<tr>
			<td align="right">Kode</td>
			<td>:</td>
			<td><input id="code" name="code" value="${filterCriteria.code}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Nama</td>
			<td>:</td>
			<td width="304" height="28"><input id="name" name="name" value="${filterCriteria.name}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Nomor Plat</td>
			<td>:</td>
			<td width="304" height="28"><input id="plate" name="plate" value="${filterCriteria.plate}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Type Unit</td>
			<td>:</td>
			<td width="304" height="28"><input id="unitType" name="unitType" value="${filterCriteria.unitType}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">No Rangka</td>
			<td>:</td>
			<td width="304" height="28"><input id="serialExt1" name="serialExt1" value="${filterCriteria.serialExt1}" size="35" /></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<button onclick="searchs();">Search</button>&nbsp;
				<button onclick="resets();">Reset&nbsp;</button>
			</td>
		</tr>
		</table>
	</form>
</div>
