<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/stnkDeliveredAddFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>

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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
						</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:25px"></div></th>
						  	<th width="10%">Received Date</th>
						  	<th width="15%">Nama Pemesan</th>
						  	<th width="15%">Nama STNK</th>
						  	<th width="12%">Tipe</th>
						  	<th width="12%">Nama Tipe</th>
						  	<th width="12%">No Mesin</th>
						  	<th width="12%">No Rangka</th>
						  	<th width="10%">No STNK</th>
                          	<th width="10%" nowrap="nowrap">Customer</th>
                          	<!-- <th width="10%" nowrap="nowrap">Leasing</th>
                          	<th width="10%" nowrap="nowrap">Sub Leasing</th> -->
						  	<th width="20%">Note</th>
						</tr>
						<c:forEach items="${datas}" var="stnk">
						<c:set var="namaPemesan" value=""/>
						<c:set var="namaSTNK" value=""/>
						<c:forEach items="${stnk.productPriceDetail.price.salesOrderItems}" var="item">
							<c:set var="namaPemesan" value="${item.unitSalesOrder.customer.name}"/>
							<c:set var="namaSTNK" value="${item.unitSalesOrder.customerUnit.name}"/>
						</c:forEach>
						<tr>
							<td class="tools">
								<c:if test='${stnk.canEdit and stnk.paidProgressiveTax}'>
									<a class="item-button-edit" href="<c:url value='/page/stnkdeliveredpreaddtwo.htm?id=${stnk.productPriceDetail.id}'/>" title="Edit"><span>Edit</span></a>
								</c:if>
							</td>
							<td><fmt:formatDate value="${stnk.productPriceDetail.receivedDate}" pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${namaPemesan}'/></td>
							<td><c:out value='${namaSTNK}'/></td>
							<td><c:out value='${stnk.productPriceDetail.price.product.types}'/></td>
							<td><c:out value="${stnk.productPriceDetail.price.product.typeNames}"/></td>
							<td><c:out value='${stnk.productPriceDetail.price.serial}'/></td>
							<td><c:out value='${stnk.productPriceDetail.price.serialExt1}'/></td>
							<td><c:out value='${stnk.productPriceDetail.referenceNo}'/></td>
		                    <td><fmt:formatNumber value='${stnk.unitSalesOrderAdapter.totalAfterPrepayment}' pattern=',##0.00'/></td>
							<%-- <c:if test="${not empty stnk.billingCustomer}">
		                       <td><fmt:formatNumber value='${stnk.billingCustomer.billing.unpaid}' pattern=',##0.00'/></td>
		                    </c:if>
		                    <c:if test="${empty stnk.billingCustomer}">
		                    	<td><fmt:formatNumber value='${stnk.unitSalesOrderAdapter.totalAfterPrepayment}' pattern=',##0.00'/></td>
		                    </c:if>
		                    <c:if test="${not empty stnk.billingLeasing}">
		                    	<td><fmt:formatNumber value='${stnk.billingLeasing.billing.unpaid}' pattern=',##0.00'/></td>
		                    </c:if>
		                    <c:if test="${empty stnk.billingLeasing}">
		                    	<td>&nbsp;</td>
		                    </c:if>
		                    <c:if test="${not empty stnk.billingSubLeasing}">
		                    	<td><fmt:formatNumber value='${stnk.billingSubLeasing.billing.unpaid}' pattern=',##0.00'/></td>
		                    </c:if>
		                    <c:if test="${empty stnk.billingSubLeasing}">
		                    	<td>&nbsp;</td>
		                    </c:if> --%>
							<td><c:out value='${stnk.productPriceDetail.note1}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="13">&nbsp;</td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
							<tr>
								<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file='/common/sirius-footer.jsp' %>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
