<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Order from Sales >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Procurement > Pertamina Procurement > Purchase Order from Sales > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P28 - Purchase Order from Sales</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/pofromsalesview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.edit and empty purchaseOrder_edit.verifications}'>
	                            <a class="item-button-add-gl-child" href="<c:url value='/page/directinvoiceverificationpreadd2.htm?id=${purchaseOrder_edit.id}'/>"><span>Create Verification</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="purchaseOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${purchaseOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled value="<fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd-MM-yyyy'/>" size='15'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.organization}'>
                                                        <form:option value='${purchaseOrder_edit.organization.id}' label='${purchaseOrder_edit.organization.firstName} ${purchaseOrder_edit.organization.lastName} ${purchaseOrder_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                              	<form:select path="goodsType" cssClass="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                              	</form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchaser :</td>
                                            <td>
                                                <form:select id="purchaser" path="purchaser" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.purchaser}'>
                                                        <form:option value='${purchaseOrder_edit.purchaser.id}' label='${purchaseOrder_edit.purchaser.firstName} ${purchaseOrder_edit.purchaser.lastName} ${purchaseOrder_edit.purchaser.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.supplier}'>
                                                        <form:option value='${purchaseOrder_edit.supplier.id}' label='${purchaseOrder_edit.supplier.firstName} ${purchaseOrder_edit.supplier.lastName} ${purchaseOrder_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                              <form:select id="contact" path="contactPerson" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty purchaseOrder_edit.contactPerson}'>
                                                  <form:option value='${purchaseOrder_edit.contactPerson.id}' label='${purchaseOrder_edit.contactPerson.firstName} ${purchaseOrder_edit.contactPerson.lastName} ${requisition.contactPerson.middleName}' />
                                                </c:if>
                                              </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.currency.id}' label='${purchaseOrder_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.tax.id}' label='${purchaseOrder_edit.tax.taxId}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" class="input-disabled" value="${purchaseOrder_edit.tax.taxRate}" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='extTax1' path='extTax1' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.extTax1.id}' label='${purchaseOrder_edit.extTax1.taxId}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" class="input-disabled" value="${purchaseOrder_edit.extTax1.taxRate}" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='extTax2' path='extTax2' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.extTax2.id}' label='${purchaseOrder_edit.extTax2.taxId}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" class="input-disabled" value="${purchaseOrder_edit.extTax2.taxRate}" disabled/>
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
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.currency.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="<fmt:formatNumber value='${purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="<fmt:formatNumber value='${purchase*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${tax*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${tax2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${tax2*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input value="<fmt:formatNumber value='${tax3}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input value="<fmt:formatNumber value='${tax3*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${tax+tax2+tax3+purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${(tax+tax2+tax3+purchase)*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                	<div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_edit.billTo}'>
                                                        <form:option value='${purchaseOrder_edit.billTo.id}' label='${purchaseOrder_edit.billTo.party.firstName} ${purchaseOrder_edit.billTo.party.middleName} ${purchaseOrder_edit.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_edit.shipTo}'>
                                                        <form:option value='${purchaseOrder_edit.shipTo.id}' label='${purchaseOrder_edit.shipTo.name}' />
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
                                        <c:forEach items='${purchaseOrder_edit.items}' var='item' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${item.product.code} ${item.product.name}'/></td>
                                            <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.unitPrice}' pattern=',#00.00'/></td>
                                            <td><fmt:formatNumber value='${item.price}' pattern=',#00.00'/></td>
                                            <td><fmt:formatNumber value='${item.price*item.quantity}' pattern=',#00.00'/></td>
                                            <td><fmt:formatDate value='${item.deliveryDate}' pattern='dd-MM-yyyy'/></td>
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
	function save()
	{
		document.editForm.action = "<c:url value='/page/pofromsalesedit.htm'/>";
		document.editForm.submit();
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>