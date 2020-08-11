<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/serialsview.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}

	function resets()
	{
		window.location = "<c:url value='/page/serialsview.htm'/>";
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

		document.filterForm.action = "<c:url value='/page/serialsview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 260px; left: 200px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Product Code&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Product Name&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="100" height="28"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/>
			&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Product Category&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28"><input type="text" id="category" name="category" value="${filterCriteria.category}" size="35" class="inputbox"/>
			&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">No Mesin&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serial" name="serial" value="${filterCriteria.serial}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">NO Rangka&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serialExt1" name="serialExt1" value="${filterCriteria.serialExt1}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Year&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="year" name="year" value="${filterCriteria.year}" size="15" class="inputbox"/></td>
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
