<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">		
	function searchs()
	{
		var url = "<c:url value='/page/recurringjournalentryview.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
		
	function resets()
	{
		window.location = "<c:url value='/page/recurringjournalentryview.htm'/>";
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
		
		var url = "<c:url value='/page/recurringjournalentryview.htm?mode=${mode}&page='/>"+page;
			
		document.filterForm.action = url;
		document.filterForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 48%; height: 200px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
        <tr>
			<td align="right" style="WIDTH:130px;">Company&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="310" height="28">
				<select id="orgto" name="organization" class="combobox-ext">
                	<c:if test='${not empty organization}'>
                    	<option value="${organization.id}">${organization.firstName} ${organization.middleName} ${organization.lastName}</option>
                    </c:if>
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=orgto'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">ID &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="30" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Name&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input type="text" id="name" name="name" maxlength="50" value="${filterCriteria.name}" size="25" class="inputbox"/></td>
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
