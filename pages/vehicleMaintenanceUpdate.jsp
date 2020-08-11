<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Maintenance >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{			
			document.editForm.action = "<c:url value='/page/vehiclemaintenanceedit.htm'/>";
			document.editForm.submit();
		}
	</script>
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
			<td width="60%">ransport Outsource > Transport Management > Vehicle Maintenance > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D11 - Vehicle Maintenance</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/vehiclepreedit.htm?id=${maintenance.vehicle.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="maintenance">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">ID :</td>
							  	  	<td width="45%"><input size="25" class="input-disabled" value="${maintenance.code}" disabled/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size='10' value="<fmt:formatDate value='${maintenance.date}' pattern='dd-MM-yyyy'/>"/></td>
                                   	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Company :</td>
									<td>
                                    	<select class="combobox-ext" disabled>
                                        	<option><c:out value='${maintenance.organization.firstName} ${maintenance.organization.middleName} ${maintenance.organization.lastName}'/></option>
                                        </select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Vehicle :</td>
									<td>
                                    	<select class="combobox" disabled>
                                        	<option>${maintenance.vehicle.name}</option>
                                        </select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">Total Kilometer :</td>
							  	  	<td width="45%"><input size="15" value="<fmt:formatNumber value='${maintenance.kilometer}' pattern=',##0.00'/>" disabled class="input-disabled"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Maintenance Type :</td>
									<td>
                                        <form:select path='type' disabled='true'>
                                        	<form:option value='SERVICE' label='SERVICE MAINTENANCE'/>
                                            <form:option value='PART' label='SPARE PART MAINTENANCE'/>
                                        </form:select>
                                  	</td>
									<td width="35%">&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Vendor :</td>
									<td>
                                    	<form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                        	<form:option value='${maintenance.supplier.id}' label='${maintenance.supplier.firstName} ${maintenance.supplier.middleName} ${maintenance.supplier.lastName}' />
                                        </form:select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Currency :</td>
                                    <td>
                                        <form:select id="currency" path="currency">
                                            <form:option label='${maintenance.currency.symbol}' value='${maintenance.currency.id}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id="exchangeType" path="exchangeType">
                                            <form:option value='SPOT'>SPOT</form:option>
                                            <form:option value='MIDDLE'>MIDDLE</form:option>
                                            <form:option value='TAX'>TAX</form:option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payment Method Type : </td>
                                    <td >
                                        <form:select id='methodType' path='paymentMethodType' disabled='true'>
                                            <form:option value='CASH' label='CASH'/>
                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                            <form:option value='CLEARING' label='CLEARING'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Tax :</td>
                                    <td>
                                        <form:select id='tax' path='tax' disabled='true'>
                                        	<form:option value='${maintenance.tax.id}' label='${maintenance.tax.taxId}'/>
                                        </form:select>
                                        &nbsp;
                                        <input size="7" id="taxRate" class="input-disabled" value="${maintenance.tax.taxRate}" disabled/>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" value="${maintenance.validTo}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path='note' cols='55' rows='6'/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
 								</table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="address" dojoType="ContentPane" label="Shipping & Billing" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty maintenance.billTo}'>
                                                        <form:option value='${maintenance.billTo.id}' label='${maintenance.billTo.party.firstName} ${maintenance.billTo.party.middleName} ${maintenance.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty maintenance.shipTo}'>
                                                        <form:option value='${maintenance.shipTo.id}' label='${maintenance.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Issued from Address : </td>
                                            <td>
                                            	<form:select id="source" path="source" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty maintenance.source}'>
                                                        <form:option value='${maintenance.source.id}' label='${maintenance.source.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="30%" >Product/Service</th>
                                            <th width="17%">Quantity</th>
                                            <th width="18%">Std Price</th>
                                          	<th width="17%">Price</th>
                                          	<th width="16%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${maintenance.items}' var='item'>
                                        <tr>
                                        	<td><c:out value='${item.product.code} - ${item.product.name}'/></td>
                                            <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.productPrice.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatDate value='${item.deliveryDate}' pattern='dd-MM-yyyy'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                            	</div>
 							</form:form>
						</div>
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