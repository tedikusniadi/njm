<script type="text/javascript" language="javascript">
	function searchTransferOrder()
	{
		var url = "<c:url value='/page/newsView.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resetTransferOrder()
	{
		document.getElementById("postBy").value = "";
		document.getElementById("title").value = "";
		document.getElementById("dateFrom").value = "";
		document.getElementById("dateTo").value = "";
				
		var url = "<c:url value='/page/newsView.htm'/>";
				
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function step(action)
	{
		var page="1";
				
		if(action == "next")
			page="<c:out value='${data.filterCriteria.nextPage}'/>";
		else if(action == "prev")
			page="<c:out value='${data.filterCriteria.prevPage}'/>";
		else if(action == "last")
			page="<c:out value='${data.filterCriteria.totalPage}'/>";					
				
		var url = "<c:url value='/page/newsView.htm?mode=${data.mode}&page='/>"+page;
		document.filterForm.action = url;
		document.filterForm.submit();
	}
	</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true"
						 	 style="width: 55%; height: 230px; left: 250px; display:none;" toggle="explode" bg>
<form id="filterForm" name="filterForm" method="post">
					<table width="100%" cellspacing="0" cellpadding="0" align="right">
					<tr>
						<td align="right">Date From&nbsp;&nbsp;</td>
						<td width="7">:&nbsp;</td>
						<td width="364" height="28">
							<input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us"  displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
							&nbsp;Date To&nbsp;:&nbsp;
							<input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us"  displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
						</td>
					</tr>
					<tr>
						<td width="220" align="right">Title &nbsp;&nbsp;</td>
						<td width="7">:&nbsp;</td>
						<td width="364" height="28"><input type="text" id="title" name="title" value="<c:out value='${data.filterCriteria.title}'/>" size="50"/></td>
					</tr>
					<tr>
						<td align="right">Post By&nbsp;&nbsp;</td>
						<td>:&nbsp;</td>
						<td width="364" height="28"><input type="text" id="postBy" name="postBy" value="<c:out value='${data.filterCriteria.postBy}'/>" size="30"/></td>
					</tr>
					<tr><td colspan="3">&nbsp;</td></tr>
					<tr>
						<td colspan="2">&nbsp;</td>
						<td align="left">
							<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchTransferOrder();" class="btn"/>
							<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetTransferOrder();" class="btn"/>
						</td>
					</tr>
					</table>
					</form>
</div>
