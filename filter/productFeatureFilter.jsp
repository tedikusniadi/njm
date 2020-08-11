<script type="text/javascript">
	function searchs()
	{
		document.filterForm.action = "<c:url value='/page/productfeatureview.htm'/>";
		document.filterForm.submit();
	}
	
	function resets()
	{
		document.getElementById("content").value = "";
		window.location = "<c:url value='/page/productfeatureview.htm'/>";
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
		
		document.filterForm.action = "<c:url value='/page/productfeatureview.htm?page='/>"+page;
		document.filterForm.submit();
	}			
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 30%; height: 170px; left: 400px; display:none;" toggle="explode">
	<form id="filterForm" name="filterForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Name&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input type="text" name="content" id="content" class="inputbox" value="${filterCriteria.content}"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Type&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
        	<select id='type' name='type' class='combobx'>
            	<option value=''>---type---</option>
                <c:forEach items='${types}' var='type'>
                	<option value='${type.id}'>${type.name}</option>
                </c:forEach>
            </select>
        </td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		<td align="left">
		<input type="submit" style="width: 70px" value="Search" alt="Search" onclick="searchs();" class="btn" />
		<input type="submit" style="width: 70px" value="reset" alt="reset" onclick="resets();" class="btn" />
			<!-- <button onclick="searchs();">Search</button>
			<button onclick="resets();">Reset&nbsp;</button> -->
		</td>
	</tr>
	</table>
	</form>
</div>
