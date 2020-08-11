<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		var url = "<c:url value='/page/productcategoryview.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{		
		var url = "<c:url value='/page/productcategoryview.htm'/>";
		window.location = url;	
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
			
		document.filterForm.action = "<c:url value='/page/productcategoryview.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 50%; height: 280px; left: 300px;display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right" style="WIDTH:130px;">ID &nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="30" class="inputbox"/></td>
		</tr>
		<tr>
		  <td align="right" style="WIDTH:130px;">Name&nbsp;</td>
		  <td>:</td>
		  <td height="28"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="30" class="inputbox"/></td>
		  </tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Parent&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28">
				<select id="parent" name="parent" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />			</td>
		</tr>
		<tr>
			<td align="right" style="WIDTH:130px;">Type&nbsp;&nbsp;</td>
			<td width="4">:&nbsp;</td>
			<td width="411" height="28">
				<select id="type" name="type" class="combobox-ext">
					<option value="STOCK">STOCK</option>
					<option value="NONSTOCK">NOT STOCK</option>
				</select>
			</td>
		</tr>
		
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchs();" class="btn"/>
				<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resets();" class="btn"/>			</td>
		</tr>
		</table>
	</form>
</div>
