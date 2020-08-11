<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
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
						<h1 class="page-title">${pageTitle}</h1>
						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/paymentleasingview.htm'/>"><span>List</span></a>
						</div>
                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Kode SPK :</td>
                                       	  	<td width="73%"><input value="${leasingGroup.unitSalesOrder.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input value="<fmt:formatDate value='${leasingGroup.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>" size="10" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                            <thead>
	                            <tr>
		                            <th width="1%"><div style="width:25px"></div></th>
		                          	<th width="18%">Nama Pemesan</th>
		                          	<th width="18%">Nama STNK</th>
		                          	<th width="15%">Tipe</th>
		                          	<th width="15%">Nama Tipe</th>
		                          	<th width="15%">Warna</th>
		                          	<th width="10%">Leasing</th>
		                          	<th width="9%">Status</th>
		                        </tr>
	                            <c:forEach items="${leasings}" var="leas">
								<tr>
	                        		<td class="tools">
		                        		<a class="item-button-edit" href="<c:url value='/page/paymentleasingpreedittwo.htm?id=${leas.id}'/>" title="Edit"><span>Edit</span></a>
		                        	</td>
		                        	<td>${leas.unitSalesOrder.customer.name}</td>
		                        	<td>${leas.unitSalesOrder.customerUnit.name}</td>
		                        	<td><c:forEach items="${leas.unitSalesOrder.items}" var="item">${item.product.types}</c:forEach></td>
		                        	<td><c:forEach items="${leas.unitSalesOrder.items}" var="item">${item.product.typeNames}</c:forEach></td>
		                        	<td><c:forEach items="${leas.unitSalesOrder.items}" var="item">${item.product.colors}</c:forEach></td>
		                        	<td>${leas.partyLeasing.name}</td>
		                        	<td>${leas.status}</td>
								</tr>
								</c:forEach>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${leasingGroup.createdBy.firstName} ${leasingGroup.createdBy.middleName} ${leasingGroup.createdBy.lastName}'/> (<fmt:formatDate value='${leasingGroup.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${leasingGroup.updatedBy.firstName} ${leasingGroup.updatedBy.middleName} ${leasingGroup.updatedBy.lastName}'/> (<fmt:formatDate value='${leasingGroup.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>