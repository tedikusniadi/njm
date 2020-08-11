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
	<%@ include file="/filter/platAddFilter.jsp"%>
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
						  	<th nowrap="nowrap" width="12%">No SPK</th>
						  	<th nowrap="nowrap" width="8%">Date</th>
						  	<th nowrap="nowrap" width="15%">Customer</th>
						  	<th nowrap="nowrap" width="15%">Nama STNK</th>
						  	<th nowrap="nowrap" width="10%">Tipe</th>
						  	<th nowrap="nowrap" width="10%">Nama Tipe</th>
						  	<th nowrap="nowrap" width="10%">No Mesin</th>
						  	<th nowrap="nowrap" width="10%">No Rangka</th>
						  	<th nowrap="nowrap" width="8%">No Plat</th>
						  	<th nowrap="nowrap" width="14%">Pengurus BBN</th>
						</tr>
						<c:forEach items="${sales}" var="item">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/platpreaddtwo.htm?id=${item.unitSalesOrder.id}'/>" title="Edit"><span>Edit</span></a>
							</td>
							<td><c:out value='${item.unitSalesOrder.code}'/></td>
							<td><fmt:formatDate value="${item.unitSalesOrder.date}" pattern='dd-MM-yyyy'/></td>
							<td><c:out value="${item.unitSalesOrder.customer.name}"/></td>
							<td><c:out value="${item.unitSalesOrder.customerUnit.name}"/></td>
							<td><c:out value='${item.price.product.types}'/></td>
							<td><c:out value='${item.price.product.typeNames}'/></td>
							<td><c:out value='${item.price.serial}'/></td>
							<td><c:out value='${item.price.serialExt1}'/></td>
							<td>
								<c:forEach items="${item.price.details}" var="detail">
									<c:if test="${detail.referenceType == 'STNK'}">
										<c:out value='${detail.referenceNoExt}'/>
									</c:if>
								</c:forEach>
							</td>
							<td><c:out value='${item.unitSalesOrder.bbnDetail.bbn.bbnService.name}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="11">&nbsp;</td></tr>
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
