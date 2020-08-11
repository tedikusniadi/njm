<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Pertamina Purchase Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{		
			if(document.getElementById('billTo').value == null || document.getElementById('billTo').value == '')
			{
				alert('Please select Bill To first!');
				return;
			}
			
			if(document.getElementById('shipTo').value == null || document.getElementById('shipTo').value == '')
			{
				alert('Please select Ship To first!');
				return;
			}
		
			document.addForm.action = "<c:url value='/page/ext1purchaseordercopy.htm'/>";
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
			<td width="60%">Procurement > Pertamina Procurement > Pertamina Purchase Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P23 - Pertamina Purchase Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/ext1purchaseorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="purchaseOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Generated" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${purchaseOrder_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.organization}'>
                                                        <form:option value='${purchaseOrder_add.organization.id}' label='${purchaseOrder_add.organization.firstName} ${purchaseOrder_add.organization.lastName} ${purchaseOrder_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                              <form:select path="goodsType" cssClass="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                                    <form:option value='ASSET' label='ASSET'/>
                                              </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchaser :</td>
                                            <td>
                                                <form:select id="purchaser" path="purchaser" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.purchaser}'>
                                                        <form:option value='${purchaseOrder_add.purchaser.id}' label='${purchaseOrder_add.purchaser.firstName} ${purchaseOrder_add.purchaser.lastName} ${purchaseOrder_add.purchaser.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.supplier}'>
                                                        <form:option value='${purchaseOrder_add.supplier.id}' label='${purchaseOrder_add.supplier.firstName} ${purchaseOrder_add.supplier.lastName} ${purchaseOrder_add.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                              <form:select id="contact" path="contactPerson" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty purchaseOrder_add.contactPerson}'>
                                                  <form:option value='${purchaseOrder_add.contactPerson.id}' label='${purchaseOrder_add.contactPerson.firstName} ${purchaseOrder_add.contactPerson.lastName} ${requisition.contactPerson.middleName}' />
                                                </c:if>
                                              </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                	<form:option value='${purchaseOrder_add.currency.id}' label='${purchaseOrder_add.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" size="7" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_add.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax' disabled='true'>
                                                	<form:option value='${purchaseOrder_add.tax.id}' label='${purchaseOrder_add.tax.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" value="${purchaseOrder_add.tax.taxRate}" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='tax2' path='extTax1' disabled='true'>
                                                	<form:option value='${purchaseOrder_add.extTax1.id}' label='${purchaseOrder_add.extTax1.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" value="${purchaseOrder_add.extTax1.taxRate}" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='tax3' path='extTax2' disabled='true'>
                                                	<form:option value='${purchaseOrder_add.extTax2.id}' label='${purchaseOrder_add.extTax2.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" value="${purchaseOrder_add.extTax2.taxRate}" class="input-disabled" disabled/>
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
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_add.currency.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="<fmt:formatNumber value='${amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="<fmt:formatNumber value='${defAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_add.tax.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_add.tax.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_add.extTax1.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_add.extTax1.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_add.extTax2.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_add.extTax2.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${amount+(amount*purchaseOrder_add.tax.taxRate/100)}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${defAmount+(defAmount*purchaseOrder_add.tax.taxRate/100)}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.billTo}'>
                                                        <form:option value='${purchaseOrder_add.billTo.id}' label='${purchaseOrder_add.billTo.party.firstName} ${purchaseOrder_add.billTo.party.middleName} ${purchaseOrder_add.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.shipTo}'>
                                                        <form:option value='${purchaseOrder_add.shipTo.id}' label='${purchaseOrder_add.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true" selected='true'>
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
                                        <c:forEach items='${purchaseOrder_add.items}' var='item' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${item.productPrice.product.code} - ${item.productPrice.product.name}'/></td>
                                        	<td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.productPrice.product.buyingPrice.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.buyingPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.quantity*item.buyingPrice}' pattern=',##0.00'/></td>
                                            <td><input id="date[${status.index}]" name="items[${status.index}].date" value="<fmt:formatDate value='${salesOrder.date}' pattern='yyyy MM dd hh:mm:ss'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>