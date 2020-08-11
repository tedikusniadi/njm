<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">		
		function searchs()
		{
			document.filterForm.action = "<c:url value='/page/journalBatchingList.htm?mode=filter'/>";
			document.filterForm.submit();
		}
		
		function resets()
		{
			window.location = "<c:url value='/page/journalBatchingList.htm'/>";
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
			
			document.filterForm.action = "<c:url value='/page/journalBatchingList.htm?mode=filter&page='/>"+page;
			document.filterForm.submit();
		}
	</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 550px; height: 330px; left: 400px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="2" align="right">
        <tr>
			<td align="right" style="WIDTH:130px;">Company</td>
			<td width="4">:</td>
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
			<td align="right" style="WIDTH:130px;">Entry No</td>
			<td width="4">:</td>
			<td width="411" height="28"><input name="code" value="${filterCriteria.code}" size="30" /></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Name</td>
			<td width="4">:</td>
			<td width="411" height="28"><input name="name" value="${filterCriteria.name}" size="25"/></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Accounting Period</td>
			<td width="4">:</td>
			<td width="411" height="28"><input name="period" value="${filterCriteria.period}" size="30" /></td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Creator</td>
			<td width="4">:</td>
			<td width="411" height="28"><input name="createdBy" value="${filterCriteria.createdBy}" size="25" /></td>
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
			<td align="left"><button onclick="searchs();">Search</button>&nbsp;<button onclick="resets();">Reset&nbsp;</button></td>
		</tr>
		</table>
	</form>
</div>
