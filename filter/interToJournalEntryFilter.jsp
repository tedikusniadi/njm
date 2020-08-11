<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">		
		function searchs()
		{
			var url = "<c:url value='/page/interjournaltoview.htm?mode=search'/>";
			document.filterForm.action = url;
			document.filterForm.submit();
		}
		
		function resets()
		{
 		    document.getElementById("orgfrom").selectedIndex = 0;
 		    document.getElementById("orgto").selectedIndex = 0;
			document.getElementById("code").value = "";
			document.getElementById("tocode").value = "";
			document.getElementById("dateFrom").value = "";
			document.getElementById("dateTo").value = "";
			
			var url = "<c:url value='/page/interjournaltoview.htm'/>";
			
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
			
			var url = "<c:url value='/page/interjournaltoview.htm?mode=${mode}&page='/>"+page;
			
			document.filterForm.action = url;
			document.filterForm.submit();
		}
	</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 230px; left: 300px; display:none;" toggle="explode" bg>
<form id="filterForm" name="filterForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Company From</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<select id="orgfrom" name="from" class="combobox-ext">
			</select>
            &nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=orgfrom'/>');" style="CURSOR:pointer;" title="Company Structure" />
		</td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Company To</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<select id="orgto" name="to" class="combobox-ext">
			</select>
            &nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=orgto'/>');" style="CURSOR:pointer;" title="Company Structure" />
		</td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Entry From No &nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="411" height="28"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="30" class="inputbox"/></td>
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
</form>
</div>
