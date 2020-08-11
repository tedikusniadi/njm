<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
			<td width="60%">Procurement > Purchase Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P21 - Purchase Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/purchaseorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="purchaseOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="50%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${purchaseOrder_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
	                                                <option><c:out value='${purchaseOrder_add.requisition.organization.firstName} ${purchaseOrder_add.requisition.organization.lastName} ${purchaseOrder_add.requisition.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Doc ID :</td>
                                            <td><input value="${purchaseOrder_add.requisition.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisition.requisitionType" cssClass="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='PURCHASE TO STOCK'/>
                                                    <form:option value='ASSET' label='FIXED ASSET ITEM'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                               		<form:option value='${purchaseOrder_add.requisition.currency.id}' label='${purchaseOrder_add.requisition.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" style="text-align:right;" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.exchange.rate}' pattern=',##0.0000'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                                <form:select id='tax' path='requisition.tax' disabled='true' cssStyle='width:100px;'>
                                                	<form:option value='${purchaseOrder_add.requisition.tax.id}' label='${purchaseOrder_add.requisition.tax.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" style="text-align:right;" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.tax.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='requisition.extTax1' disabled='true' cssStyle='width:100px;'>
                                                	<form:option value='${purchaseOrder_add.requisition.extTax1.id}' label='${purchaseOrder_add.requisition.extTax1.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" style="text-align:right;" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.extTax1.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='requisition.extTax2' disabled='true' cssStyle='width:100px;'>
                                                	<form:option value='${purchaseOrder_add.requisition.extTax2.id}' label='${purchaseOrder_add.requisition.extTax2.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" style="text-align:right;" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.extTax2.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rounding :</td>
                                            <td><input id='rounding' name='rounding' value="0.00" onchange='display(this.value);' size="10"/></td>
                                        </tr>
										<tr>
                                            <td align="right">Payment Method Type : </td>
                                            <td >
                                                <form:select id='methodType' path='paymentMethodType' disabled='true' cssStyle='width:100px;'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Term :</td>
                                            <td><input class="input-disabled" disabled size="5" value="${purchaseOrder_add.creditTerm.term}"/>&nbsp;Day(s)</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                              		<td width="50%" valign="top">
			  							<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                              <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      <th width="60%">&nbsp;</th>
                                                      <th width="20%">Amount (<c:out value='${purchaseOrder_add.requisition.exchange.from.symbol}'/>)</th>
                                                      <th width="20%">Amount (<c:out value='${purchaseOrder_add.requisition.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="<fmt:formatNumber value='${adapter.purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.defPurchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 2 : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.tax1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defTax1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 3 : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.tax2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defTax2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="round" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="rounddef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="suppinfo" dojoType="ContentPane" label="Suplier Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                	<option><c:out value='${purchaseOrder_add.requisition.supplier.firstName} ${purchaseOrder_add.requisition.supplier.lastName} ${purchaseOrder_add.requisition.supplier.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Address : </td>
                                            <td width="35%">
                                            	 <form:select id="supplierAddress" path="supplierAddress" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.supplierAddress}'>
                                                        <form:option value='${purchaseOrder_add.supplierAddress.id}' label='${purchaseOrder_add.supplierAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Phone : </td>
                                          	<td width="35%">
                               	      			<form:select id="supplierPhone" path="supplierPhone" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.supplierPhone}'>
                                                        <form:option value='${purchaseOrder_add.supplierPhone.id}' label='${purchaseOrder_add.supplierPhone.contact}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Fax : </td>
                                          	<td width="35%">
                               	      			<form:select id="supplierFax" path="supplierFax" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.supplierFax}'>
                                                        <form:option value='${purchaseOrder_add.supplierFax.id}' label='${purchaseOrder_add.supplierFax.contact}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                                <form:select id="contactPerson" path="contactPerson" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.contactPerson}'>
                                                        <form:option value='${purchaseOrder_add.contactPerson.id}' label='${purchaseOrder_add.contactPerson.firstName} ${purchaseOrder_add.contactPerson.middleName} ${purchaseOrder_add.contactPerson.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="requisition.billTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.requisition.billTo}'>
                                                        <form:option value='${purchaseOrder_add.requisition.billTo.id}' label='${purchaseOrder_add.requisition.billTo.party.firstName} ${purchaseOrder_add.requisition.billTo.party.middleName} ${purchaseOrder_add.requisition.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="requisition.shipTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.requisition.shipTo}'>
                                                        <form:option value='${purchaseOrder_add.requisition.shipTo.id}' label='${purchaseOrder_add.requisition.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="32%">Product</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="12%">Std Price</th>                                    
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_add.requisition.items}' var='line'>
                                        <tr>
                                        	<td><c:out value='${line.productPrice.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.productPrice.money.amount*line.exchange.rate}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatDate value='${line.deliveryDate}' pattern='dd-MM-yyyy'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save(_forward)
	{		
		document.addForm.action = "<c:url value='/page/purchaseorderadd.htm?new='/>"+_forward;
		document.addForm.submit();
	}
	
	function display(rounding)
	{
		if(rounding != null && rounding != '')
		{
			document.getElementById('round').value = parseFloat(rounding).numberFormat('#,#.00');
			document.getElementById('rounddef').value = parseFloat(rounding).numberFormat('#,#.00');
		
			document.getElementById('total').value = (parseFloat('${adapter.total}')+parseFloat(rounding)).numberFormat('#,#.00');
			document.getElementById('totalDef').value = (parseFloat('${adapter.defTotal}')+parseFloat(rounding)).numberFormat('#,#.00');
		}
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>