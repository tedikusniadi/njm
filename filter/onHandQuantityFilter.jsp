<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchsOnhand()
	{
		var url = "<c:url value='/page/onhandquantityview.htm?cat=${filterCriteria.cat}&headOffice=${filterCriteria.headOffice}'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}

	function resetsOnhand()
	{
		window.location = "<c:url value='/page/onhandquantityview.htm?cat=${filterCriteria.cat}&headOffice=${filterCriteria.headOffice}'/>";
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

		document.filterForm.action = "<c:url value='/page/onhandquantityview.htm?cat=${filterCriteria.cat}&headOffice=${filterCriteria.headOffice}&page="+page+"'/>";
		document.filterForm.submit();
	}
	
	function openfacility(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?organization='/>"+org.value+"&target="+target);
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 40%; height: 270px; left: 150px; display:none;" toggle="explode" bg>
	<form id="filterFormOnhand" name="filterForm" method="post">
		<input type="hidden" name="cat" value="${filterCriteria.cat}"/>
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">Product ID&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td width="350" height="25"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Company&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td width="350" height="25">
				<select id="org" name="organization" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Facility&nbsp;&nbsp;</td>
			<td>:&nbsp;</td>
			<td width="350" height="25">
				<select id="facility" name="facility" class="combobox-ext">
				</select>
            	&nbsp;
				<img src="assets/icons/list_extensions.gif" onclick="openfacility('facility');" style="CURSOR:pointer;" title="Facility" />
			</td>
		</tr>
		<tr>
			<td align="right">Product Name&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="350" height="25"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/>
			&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductview.htm?target=parent&categoryId=${category}&active=true'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Product Category&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="350" height="25"><input type="text" id="category" name="category" value="${filterCriteria.category}" size="35" class="inputbox"/>
			&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td align="right">Product Type&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="350" height="25">
				<select id="productType" name="productType" class="combobox">
					<c:if test='${not empty filterCriteria.productType}'>
						<option value="${filterCriteria.productType}"><c:out value='${filterCriteria.productType}'/></option>
					</c:if>
				</select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=productType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
			</td>
		</tr>
		<%-- <tr>
			<td align="right">Company&nbsp;&nbsp;</td>
			<td>:</td>
			<td width="304" height="28">
				<input type="text" id="company" name="company" value="${filterCriteria.company}" size="35" class="inputbox"/>
				&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr> --%>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="2">&nbsp;</td>
			<td align="left">
				<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchsOnhand();" class="btn"/>
				<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetsOnhand();" class="btn"/>
			</td>
		</tr>
		</table>
	</form>
</div>
