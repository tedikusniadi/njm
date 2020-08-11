<%@ include file="/common/popup.jsp"%>
<script type="text/javascript">
	function searchs()
	{
		document.filterPriceForm.action = "<c:url value='/page/noticeandserviceview.htm'/>";
		document.filterPriceForm.submit();
	}

	function resets()
	{	
		var url = "<c:url value='/page/noticeandserviceview.htm'/>";
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

		var url = "<c:url value='/page/noticeandserviceview.htm?page='/>"+page;

		document.filterPriceForm.action = url;
		document.filterPriceForm.submit();
	}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 250px; left: 350px; display:none;" toggle="explode" bg>
	<form id="filterPriceForm" name="filterPriceForm" method="post">
	<table width="100%" cellspacing="0" cellpadding="0" align="right">
	<tr>
		<td align="right" style="WIDTH:130px;">Tipe Unit</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
			<input type="text" id="unitType" name="unitType" class="inputbox" value="${filterCriteria.unitType}"/>&nbsp;
			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
		</td>
	</tr>
	<tr>
		<td align="right" style="WIDTH:130px;">Price Type</td>
		<td width="4">:&nbsp;</td>
		<td width="310" height="28">
	  		<form:select id="type" path="filterCriteria.type" class="combobox-medium">
	  			<c:set var="typeLabel" value=""/>
	  			<c:forEach items="${types}" var="type">
	  			<c:if test="${type eq 'CITY'}">
	  				<c:set var="typeLabel" value="JASA KOTA"/>
				</c:if>
				<c:if test="${type eq 'REGION'}">
	  				<c:set var="typeLabel" value="JASA KABUPATEN"/>
				</c:if>
				<c:if test="${type eq 'NOTICE'}">
	  				<c:set var="typeLabel" value="NOTICE"/>
				</c:if>
				<c:if test="${type eq 'NOTICEASTRA'}">
	  				<c:set var="typeLabel" value="BBN ASTRA"/>
				</c:if>
	  			<c:if test="${type eq filterCriteria.type}">
	  				<form:option value="${type}" label='${typeLabel}' selected="true"/>
  				</c:if>
	  			<c:if test="${type ne filterCriteria.type}">
	  				<form:option value="${type}" label='${typeLabel}'/>
  				</c:if>
	  			</c:forEach>
	  			<c:remove var="typeLabel"/>
			</form:select>
		</td>
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
