<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Sales Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/consignmentsalesorderedit.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Sales > Consignment > Consignment Sales Order > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S14 - Consignment Sales Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentsalesorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${salesOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.organization}'>
                                                        <form:option value='${salesOrder_edit.organization.id}' label='${salesOrder_edit.organization.firstName} ${salesOrder_edit.organization.lastName} ${salesOrder_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.salesPerson}'>
                                                        <form:option value='${salesOrder_edit.salesPerson.id}' label='${salesOrder_edit.salesPerson.firstName} ${salesOrder_edit.salesPerson.lastName} ${salesOrder_edit.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                	<form:option value='${salesOrder_edit.currency.id}' label='${salesOrder_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' />
                                                    <form:option value='MIDDLE' label='MIDDLE' />
                                                    <form:option value='TAX' label='TAX' />
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" size="10" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="60%">&nbsp;</th>
                                                      	<th width="20%"><div id="trx">Amount</div></th>
                                                      	<th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total Transaction : </strong></td>
                                                        <td><input id="_trx" value="<fmt:formatNumber value='${total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="trxdef" value="<fmt:formatNumber value='${total*salesOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                		</table>
                           	  	  	</td>
                                </tr>
                                </table>
                                <br/>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="37%">Product</th>
                                    <th width="14%">Consignment Qty</th>
                                  	<th width="12%">Sales Qty</th>
                                  	<th width="11%">UoM</th>
                                    <th width="14%">Unit Price</th>                                    
                                    <th width="12%">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${salesOrder_edit.items}' var='item' varStatus='status'>
                                <tr>
                                	<td><c:out value='${item.productPrice.product.code} - ${item.productPrice.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.registry.quantity-item.registry.used}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.uom.measureId}'/></td>
                                    <td><input id='item[${item.productPrice.id}]' value="<fmt:formatNumber value='${item.productPrice.money.amount*item.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                    <td><input id='total[${item.productPrice.id}]' value="<fmt:formatNumber value='${item.quantity*item.productPrice.money.amount*item.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>