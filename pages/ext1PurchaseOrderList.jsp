<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Pertamina Purchase Order >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/ext1PurchaseOrderFilter.jsp"%>
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
				<td width="60%">Procurement > Pertamina Procurement > Pertamina Purchase Order</td>
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
						<h1 class="page-title">P23 - Pertamina Purchase Order</h1>
						<div id="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="57%" height="30" align="left" valign="middle">
								<div class="toolbar-clean">
									<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/ext1purchaseorderpreadd.htm'/>"><span>New Pertamina Purchase Order</span></a>
																				</c:if>
											<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="43%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page
									<c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
							</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="7%"><div style="width:40px"></div></th>
							<th width="20%">ID</th>
							<th width="11%">Date</th>
							<th width="20%">Purchaser</th>
							<th width="10%">Amount</th>
							<th width="6%">Currency</th>
							<th width="10%">Cost-Amount</th>
							<th width="15%">Note</th>
						</tr>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
									<a class="item-button-edit" href="<c:url value='/page/ext1purchaseorderpreedit.htm?id=${order.ext1PurchaseOrder.id}'/>" title="Edit"><span>Edit</span></a>
								</c:if>
								<c:if test='${access.delete and !order.ext1PurchaseOrder.verificated and empty order.ext1PurchaseOrder.loadings and empty order.ext1PurchaseOrder.components}'>
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/ext1purchaseorderdelete.htm?id=${order.ext1PurchaseOrder.id}'/>');" title="Delete"><span>Delete</span></a>
								</c:if>
							</td>
							<td><c:out value='${order.ext1PurchaseOrder.code}'/></td>
							<td><fmt:formatDate value="${order.ext1PurchaseOrder.date}" pattern='dd-MM-yyyy'/></td>
							<td><c:out value="${order.ext1PurchaseOrder.purchaser.firstName} ${order.ext1PurchaseOrder.purchaser.middleName} ${order.ext1PurchaseOrder.purchaser.lastName}"/></td>
							<td><fmt:formatNumber value="${order.total}" pattern=",##0.00"/></td>
							<td><c:out value='${order.ext1PurchaseOrder.currency.symbol}'/></td>
							<td><fmt:formatNumber value="${order.component}" pattern=",##0.00"/></td>
							<td><c:out value='${order.ext1PurchaseOrder.note}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
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

	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
