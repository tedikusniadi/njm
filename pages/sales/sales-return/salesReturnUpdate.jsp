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
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onload="showerror();">

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
							<a class="item-button-list" href="<c:url value='/page/salesreturnview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="return_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="21%" align="right">ID :</td>
                                          	<td width="79%"><input disabled size="30" class="input-disabled" value="${return_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${return_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext input-disabled" disabled='true'>
                                                    <c:if test='${not empty return_edit.organization}'>
                                                        <form:option value='${return_edit.organization.id}' label='${return_edit.organization.firstName} ${return_edit.organization.lastName} ${return_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext input-disabled" disabled='true'>
                                                    <c:if test='${not empty return_edit.returable.customer}'>
                                                        <form:option value='${return_edit.returable.customer.id}' label='${return_edit.returable.customer.firstName} ${return_edit.returable.customer.middleName} ${return_edit.returable.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Reference :</td>
                                            <td><input class="input-disabled" disabled size="35" value="${return_edit.returable.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Return Destination : </td>
                                            <td>
                                            	<form:select id="warehouse" path="destination" cssClass="combobox-ext input-disabled">
                                                    <c:if test='${not empty return_edit.destination}'>
                                                        <form:option value='${return_edit.destination.id}' label='${return_edit.destination.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="6"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                    		<legend><strong>Journal Reference</strong></legend>
                                    		<table style="border:none" width="100%">
                                    			<tr>
                                    				<td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
													<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${return_edit.journalEntry.id}'/>">${return_edit.journalEntry.code}</td>
												</tr>
											</table>
                                    	</fieldset>
                                    	<fieldset>
                                            <legend><strong>Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="29%">&nbsp;</td>
                                                <td width="37%" align="center"><strong>Amount (<c:out value='${return_edit.returable.currency.symbol}'/>)</strong></td>
                                                <td width="34%" align="center"><strong>Amount (<c:out value='${default.symbol}'/>)</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><strong>Total</strong></td>
                                                <td><input value="<fmt:formatNumber value='${amount}' pattern=',##0.00'/>" id="total" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                                <td><input value="<fmt:formatNumber value='${amount*return_edit.returable.exchange.rate}' pattern=',##0.00'/>" id="totaldef" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                    <div id="item" dojoType="ContentPane" label="item" class="tab-pages" refreshOnShow="true">
                                    	<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="31%">Product</th>
                                       	  	<th width="12%">Delivered</th>
                                       	  	<th width="12%">Returned</th>
                                            <th width="11%">UoM/Qty</th>
                                            <th width="13%">Unit Price/Serial</th>
                                            <th width="16%">Currency/Serial Ext1</th>
                                       	  	<th width="14%">Amount/Year</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${return_edit.items}" var="item" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${item.returableItem.product.code} - ${item.returableItem.product.name}'/></td>
                                            <td><fmt:formatNumber value='${item.returableItem.accepted}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.returableItem.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.returableItem.unitPrice.amount}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.returableItem.unitPrice.currency.symbol}'/></td>
                                            <td><fmt:formatNumber value='${item.returableItem.unitPrice.amount*item.quantity}' pattern=',##0.00'/></td>
                                        </tr>
	                                         <c:forEach items="${item.details}" varStatus="sDetail" var="detail">
	                                        	    <tr>
			                                            <td colspan="3"></td>
			                                            <td><fmt:formatNumber value='${detail.quantity}'/></td>
			                                            <td>${detail.serial}</td>
			                                            <td>${detail.serialExt1}</td>
			                                            <td>${detail.year}</td>
			                                        </tr>
	                                        </c:forEach>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                </div>
							</form:form>
						</div>
						<div class="info">Created by : ${salesOrder.createdBy.firstName} ${salesOrder.createdBy.middleName} ${salesOrder.createdBy.lastName} (<fmt:formatDate value='${salesOrder.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${salesOrder.updatedBy.firstName} ${salesOrder.updatedBy.middleName} ${salesOrder.updatedBy.lastName} (<fmt:formatDate value='${salesOrder.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/salesreturnedit.htm'/>";
		document.addForm.submit();
	}

	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>