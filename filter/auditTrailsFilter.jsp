<%@ include file="/common/popup.jsp"%>
<script type="text/javascript" language="javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/activityHistoryView.htm'/>";
		document.filterForm.submit();
	}
	
	function resets()
	{
		window.location = "<c:url value='/page/activityHistoryView.htm'/>";
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
		
		var url = "<c:url value='/page/activityHistoryView.htm?page='/>"+page;
		document.filterForm.action = url;
		document.filterForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 58%; height: 230px; left: 300px; display:none;" toggle="explode" bg>
	<form:form id="filterForm" name="filterForm" method="post" modelAttribute="filterCriteria">
    <table width="100%" cellspacing="0" cellpadding="0" align="right">
    <tr>
        <td align="right" style="WIDTH:130px;">Menu&nbsp;&nbsp;</td>
        <td width="7">:&nbsp;</td>
        <td width="316" height="28"><form:input id="menu" path="menu"/></td>
    </tr>
    <tr>
        <td align="right">ID&nbsp;&nbsp;</td>
        <td width="7">:&nbsp;</td>
        <td width="316" height="28"><form:input id="id" path="id"/></td>
    </tr>
    <tr>
        <td align="right">Action&nbsp;&nbsp;</td>
        <td width="7">:&nbsp;</td>
        <td width="316" height="28">
            <form:select path="action" id="action" cssClass="combobox">
                <form:option value='' label=''/>
                <form:option value="CREATE" label='CREATE'/>
                <form:option value="UPDATE" label='UPDATE'/>
                <form:option value="DELETE" label='DELETE'/>
            </form:select>
        </td>
    </tr>
    <%-- <tr>
        <td align="right">Person in Charge &nbsp;&nbsp;</td>
        <td width="7">:&nbsp;</td>
        <td width="316" height="28">
        	<form:select path="person" id="person" cssClass="combobox-ext">
        	</form:select>
            &nbsp;
            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppersonview.htm?target=person'/>');" style="CURSOR:pointer;" title="Person" />
        </td>
    </tr> --%>
    <tr>
        <td align="right" style="WIDTH:130px;">Person in Charge &nbsp;&nbsp;</td>
        <td width="7">:&nbsp;</td>
        <td width="316" height="28"><form:input id="personName" path="personName"/></td>
    </tr>
    <tr>
        <td align="right">Date From &nbsp;&nbsp;</td>
        <td>:&nbsp;</td>
        <td>
            <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
            &nbsp;Date To &nbsp;:&nbsp;
            <input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="<fmt:formatDate value='${filterCriteria.dateTo}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
	</form:form>
</div>
