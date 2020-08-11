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
	<%@ include file="/filter/unitInvoiceMainDealerAddFilter.jsp"%>
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
						<br/>

						<div class="item-navigator">
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="30%" height="30" align="left" valign="middle">
								<div class="toolbar-clean">
									<strong>Referensi :</strong>
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
                            <th width="10%">No.SPK</th>
                          	<th width="8%">Tanggal</th>
                          	<th width="10%">Nama Pemesan</th>
                          	<th width="10%">Nama STNK</th>
                          	<th width="10%">Tipe</th>
                          	<th width="10%">Nama Tipe</th>
                          	<th width="10%">No Mesin</th>
                          	<th width="10%">No Rangka</th>
                          	<th width="10%">Referensi</th>
                        </tr>
                        <c:forEach items="${sales}" var="order">
	                       	<c:forEach items="${order.unitSalesOrder.items}" var="item">
	                        	<tr>
									<td class="tools">
										<a class="item-button-edit" href="<c:url value='/page/unitinvoicemaindealerpreaddtwo.htm?id=${order.unitSalesOrder.id}'/>" title="Edit"><span>Edit</span></a>
									</td>
	                        		<td nowrap="nowrap">${order.unitSalesOrder.code}</td>
	                        		<td nowrap="nowrap"><fmt:formatDate value="${order.unitSalesOrder.date}" pattern="dd-MM-yyyy"/></td>
	                        		<td nowrap="nowrap">${order.unitSalesOrder.customer.name}</td>
	                        		<td nowrap="nowrap">${order.unitSalesOrder.customerUnit.name}</td>
	                        		<td nowrap="nowrap">${item.product.types}</td>
	                        		<td nowrap="nowrap">${item.product.typeNames}</td>
	                        		<td nowrap="nowrap">${item.price.serial}</td>
	                        		<td nowrap="nowrap">${item.price.serialExt1}</td>
	                        		<c:if test="${order.unitSalesOrder.unitSalesType == 'UNIT'}">
	                        			<td>Main Dealer</td>
	                        		</c:if>
	                        		<c:if test="${order.unitSalesOrder.unitSalesType != 'UNIT'}">
	                        			<td>Cabang</td>
	                        		</c:if>
	                        	</tr>
	                       	</c:forEach>
                        </c:forEach>
                        <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
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
</html>
