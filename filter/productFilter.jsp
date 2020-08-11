<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterFormProduct.action = "<c:url value='/page/productview.htm?categoryId=${filterCriteria.categoryId}&mode=search'/>";
		document.filterFormProduct.submit();
	}
	
	function resets()
	{
		document.getElementById("code").value = "";
		document.getElementById("name").value = "";
		document.getElementById("category").value = "";
		
		var url = "<c:url value='/page/productview.htm?categoryId=${filterCriteria.categoryId}'/>";
		
		window.location = url;
		
		//document.filterForm.action = "<c:url value='/page/productview.htm'/>";
		//document.filterForm.submit();
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
		
		var url = "<c:url value='/page/productview.htm?categoryId=${filterCriteria.categoryId}&page="+page+"'/>";
		
		document.filterFormProduct.action = url;
		document.filterFormProduct.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 250px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterFormProduct" name="filterFormProduct" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Product ID&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input name="code" id="code" class="inputbox" value="${filterCriteria.code}"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Product Name&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28"><input type="text" id="name" name="name" class="inputbox" value="${filterCriteria.name}"/></td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Category Name&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<input type="text" id="category" name="category" class="inputbox" value="${filterCriteria.category}"/>&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=cat'/>');" style="CURSOR:pointer;" title="Product Category" />
		</td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Product Type&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<input type="text" id="types" name="types" class="inputbox" value="${filterCriteria.types}"/>&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=types&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
		</td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Warna&nbsp;&nbsp;</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<input type="text" id="color" name="color" class="inputbox" value="${filterCriteria.color}"/>&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=color&feature=3'/>');" style="CURSOR:pointer;" title="Product Colors" />
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
