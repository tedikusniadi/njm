<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>
	<style type="text/css" media="screen,print">.table-desc{width: 80% !important;}</style>
	<style type="text/css" media="screen,print">
		@import url("<c:url value='/assets/css/report-normal.css'/>");
	</style>
	<style type="text/css">
	#apDiv1 {
		position:absolute;
		width:50%;
		height:auto;
		z-index:1;
		float:right;
		left: 50%;
	
	}
	#apDiv2 {
		position:absolute;
		width:50%;
		height:auto;
		z-index:2;
		position:fixed;
	}
</style>
</head>
<body>
	<%@ include file="/common/sirius-header.jsp"%>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
				  		<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/stockopnameview.htm'/>"><span>List</span></a>
							<a class="item-button-back" href="<c:url value='/page/stockopnamepreedit.htm?id=${opname_edit.id}'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
				  		</div>
						<div class="main-box">
							<div class="main_container">
								<div dojoType="Container">
									<table width="100%" style="border:none">
									<tr>
										<td width="20%" nowrap="nowrap" align="right">ID :</td>
									  	<td width="80%"><c:out value="${opname_edit.code}"/></td>
									</tr>
	                                <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><fmt:formatDate value='${opname_edit.date}' pattern='dd-MM-yyyy'/></td>
									</tr>
	                                <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td><c:out value="${opname_edit.organization.name}"/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Facility :</td>
										<td><c:out value="${opname_edit.facility.name}"/></td>
									</tr>
	                                <tr>
	 									<td align="right">Product Category :</td>
										<td><c:out value="${opname_edit.productCategory.name}"/></td>
		 							</tr>
	                                <tr>
										<td nowrap="nowrap" align="right">Reason :</td>
										<td><c:out value="${opname_edit.reason}"/></td>
									</tr>
									</table>
		                            <br/>
									<table width="99%" align="center" cellpadding="2" cellspacing="0">
									<tr>
				    					<th width="1%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;border-left:solid 1px #000000;">No</th>
				    					<th width="15%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="center">Grid</th>
				    					<th width="15%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Product</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">On Hand</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Re-Count</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">UoM</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Discre</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Amount</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Total</th>
				    					<th width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Note</th>
									</tr>
									<c:set var="no" value="0"/>
									<c:set var="total" value="0"/>
									<c:forEach items="${opname_edit.items}" var="item">
									<c:set var="no" value="${no+1}"/>
									<c:set var="total" value="${total+((item.opnamed - item.onHand)*item.amount)}"/>
									<tr>
										<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-left:solid 1px #000000;">&nbsp;<fmt:formatNumber value="${no}" pattern="#,###"/>.</td>
										<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center">${item.inventoryItem.grid.name}</td>
										<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center">${item.inventoryItem.product.code} ${item.inventoryItem.product.name}</td>
		       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value='${item.onHand}' pattern="#,###"/></td>
		       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value="${item.opnamed}" pattern="#,###"/></td>
										<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center">${item.inventoryItem.product.unitOfMeasure.measureId}</td>
		       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value='${item.opnamed - item.onHand}' pattern="#,###"/></td>
		       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value="${item.amount}" pattern="#,###"/></td>
		       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value='${(item.opnamed - item.onHand)*item.amount}' pattern="#,###"/></td>
										<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;">${item.note}</td>
									</tr>
									</c:forEach>
									<tr>
										<th colspan="8" align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-left:solid 1px #000000;">Total</th>
										<th align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value="${total}" pattern="#,###"/></th>
									</tr>
									</table>
									<div>&nbsp;</div>
									<table width="60%" border="0" cellspacing="0" cellpadding="2">
									  <tr>
									    <td width="20%" align="center">Counter Part</td>
									    <td width="20%" align="center">ADH</td>
									    <td width="20%" align="center">Accounting</td>
									  </tr>
									  <tr>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr>
									    <td align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
									    <td align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
									    <td align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
									  </tr>
									  <tr>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>