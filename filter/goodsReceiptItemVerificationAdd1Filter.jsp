<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function filters()
	{
		var url = "<c:url value='/page/goodsreceiptitemverificationpreadd.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
		window.location = "<c:url value='/page/goodsreceiptitemverificationpreadd.htm'/>";
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
			
		document.filterForm.action = "<c:url value='/page/goodsreceiptitemverificationpreadd.htm?page='/>"+page;
		document.filterForm.submit();
	}
</script>	
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 38%; height: 280px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
		<table width="100%" style='border:none;'>
		<tr>
			<td align="right">Tipe&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td>
				<input type="text" id="type" name="type" class="inputbox" value="${filterCriteria.type}"/>&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=type&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
			</td>
		</tr>
		<tr>
			<td align="right">Nama Tipe&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td>
				<input type="text" id="typeNames" name="typeNames" class="inputbox" value="${filterCriteria.typeNames}"/>&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=typeNames&feature=4'/>');" style="CURSOR:pointer;" title="Product Colors" />
			</td>
		</tr>
		<tr>
			<td align="right">Warna&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td>
				<input type="text" id="color" name="colour" class="inputbox" value="${filterCriteria.colour}"/>&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=color&feature=3'/>');" style="CURSOR:pointer;" title="Product Colors" />
			</td>
		</tr>
		<tr>
			<td align="right">No Mesin&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serial" name="serial" value="${filterCriteria.serial}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">No Rangka&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="serialExt1" name="serialExt1" value="${filterCriteria.serialExt1}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Tahun&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td><input type="text" id="year" name="year" value="${filterCriteria.year}" size="20" class="inputbox"/></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="filters();" class="btn"/>
				<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resets();" class="btn"/>
			</td>
		</tr>
		</table>
	</form>
</div>
