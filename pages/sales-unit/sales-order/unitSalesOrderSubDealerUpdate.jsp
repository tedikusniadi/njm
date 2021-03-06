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
	<%@ include file="/common/sirius-header.jsp" %>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/unitsalesordersubdealeredit.htm'/>";
			document.editForm.submit();
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordersubdealerview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="salesOrder_edit">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="61%" valign="top">
                                	<table width="100%" style="border:none">
                                    <tr>
                                      <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                      <td width="74%"><input value="${salesOrder_edit.code}" class='input-disabled' size='25'/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Company :</td>
                                        <td>
                                            <form:select id="org" path="organization" cssClass="combobox-ext">
                                                <c:if test='${not empty salesOrder_edit.organization}'>
                                                    <form:option value='${salesOrder_edit.organization.id}' label='${salesOrder_edit.organization.name}' />
                                                </c:if>
                                            </form:select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Sub Dealer :</td>
                                        <td>
                                            <form:select id="subDealer" path="subDealer" cssClass="combobox-ext">
                                                <c:if test='${not empty salesOrder_edit.subDealer}'>
                                                    <form:option value='${salesOrder_edit.subDealer.id}' label='${salesOrder_edit.subDealer.name}' />
                                                </c:if>
                                            </form:select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Date :</td>
                                        <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Transfer Source :</td>
                                        <td>
                                            <form:select id="source" path="source" cssClass="combobox-ext">
                                                <c:if test='${not empty salesOrder_edit.source}'>
                                                    <form:option value='${salesOrder_edit.source.id}' label='${salesOrder_edit.source.name}' />
                                                </c:if>
                                            </form:select>
                                      </td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Transfer Destination :</td>
                                        <td>
                                            <form:select id="destination" path="destination" cssClass="combobox-ext">
                                                <c:if test='${not empty salesOrder_edit.destination}'>
                                                    <form:option value='${salesOrder_edit.destination.id}' label='${salesOrder_edit.destination.name}' />
                                                </c:if>
                                            </form:select>
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path="note" cols="55" rows="7"/></td>
                                    </tr>
                                	</table>
                              	</td>
                            	<td width="39%" valign="top">
                                	<fieldset>
                                    	<legend>Reference</legend>
                                        <table width="100%" style="border:none">
                                        <tr>
                                        	<td width="30%">Goods Receipt</td>
                                            <td width="2%">:</td>
                                            <td width="68%">
                                            	<c:forEach items='${salesOrder_edit.receipts}' var='receipt'>
                                                	<a href="<c:url value='/page/goodsreceiptfromfilepreedit.htm?id=${receipt.id}'/>">${receipt.code}</a>,
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>Goods Issue</td>
                                            <td>:</td>
                                            <td>
                                            	<c:forEach items='${salesOrder_edit.issueds}' var='issued'>
                                                	<a href="<c:url value='/page/goodsissuepreedit.htm?id=${issued.id}'/>">${issued.code}</a>,
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                            <div id="unit" dojoType="ContentPane" label="Produk" class="tab-pages" refreshOnShow="true">
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="width:100%" align="center">
	                            <thead>
	                            <tr>
	                                <th align="left">Product</th>
	                              	<th width="20%">Tipe</th>
	                              	<th width="20%">Nama Tipe</th>
	                              	<th width="20%">Warna</th>
	                              	<th width="10%">Quantity</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${salesOrder_edit.items}' var='item'>
	                            <c:if test="${item.product.productCategory.id == 1}">
	                            <tr>
	                            	<td>${item.product.name}</td>
	                            	<td>${item.product.types}</td>
	                            	<td>${item.product.typeNames}</td>
	                            	<td>${item.product.colors}</td>
	                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
	                            </tr>
	                            </c:if>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            <div id="acc" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="width:100%" align="center">
	                            <thead>
	                            <tr>
	                                <th width="25%">Product</th>
	                              	<th width="15%">Merk</th>
	                              	<th width="15%">Warna</th>
	                              	<th width="45%">Quantity</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${salesOrder_edit.items}' var='item'>
	                            <c:if test="${item.product.productCategory.id == 3}">
	                            <tr>
	                            	<td>${item.product.name}</td>
	                            	<td>${item.product.brand}</td>
	                            	<td>${item.product.primaryColors}</td>
	                                <td><fmt:formatNumber value='${item.quantity}' pattern='#,###'/></td>
	                            </tr>
	                            </c:if>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            </div>
							</form:form>
						</div>
						<div class="info">Created by : ${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName} (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName} (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>