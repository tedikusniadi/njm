<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/productionplanningview.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/productionplanningview.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/productionplanningview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 38%; height: 220px; left: 360px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="1" align="center">
		<tr>
			<td width="82" align="right">Code&nbsp;&nbsp;</td>
		  <td width="3">:</td>
		  <td width="343" height="28"><input name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Name&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="343" height="28"><input name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Company&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="343" height="28">
  <select id="org" name="organization" class="combobox-ext">
                    <c:if test='${not empty filterCriteria.organization}'>
                        <option value='${organization.id}'><c:out value='${organization.firstName} ${organization.lastName} ${organization.middleName}'/></option>
                    </c:if>
                </select>
                &nbsp;
                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<button onclick="searchs();">Search</button>
				<button onclick="resets();">Reset</button>
			</td>
		</tr>
		</table>
	</form>
</div>
