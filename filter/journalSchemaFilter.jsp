<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 39%; height: 255px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
        <table width="100%" cellspacing="0" cellpadding="3" align="right">
        <tr>
            <td align="right" style="WIDTH:130px;">Schema ID</td>
            <td width="4">:</td>
            <td width="310" height="28"><input name="code" value="${filterCriteria.code}"/></td>
        </tr>
        <tr>
            <td align="right" style="WIDTH:130px;">Schema Name</td>
            <td width="4">:</td>
            <td width="310" height="28"><input name="name" value="${filterCriteria.name}"/></td>
        </tr>
        <tr>
            <td align="right" style="WIDTH:130px;">Company</td>
            <td width="4">:</td>
            <td width="310" height="28">
            	<select id="org" name="organization" class="combobox-ext">
            		<option value='${organization.id}'><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
				</select>
				&nbsp;
				<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
            </td>
        </tr>
        <tr><td colspan="3">&nbsp;</td></tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td align="left">
            	<button onclick="searchs();">Search</button>&nbsp;&nbsp;<button onclick="resets();">Reset&nbsp;</button>
            </td>
        </tr>
        </table>
	</form>
</div>
<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/standardjournalschemaview.htm'/>";
		document.filterForm.submit();
	}
	
	function resets()
	{
		window.location = "<c:url value='/page/standardjournalschemaview.htm'/>";
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
		
		var url = "<c:url value='/page/standardjournalschemaview.htm?page='/>"+page;
		
		document.filterForm.action = url;
		document.filterForm.submit();
	}
</script>