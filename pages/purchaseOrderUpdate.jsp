<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
			<td width="60%">Procurement > Purchase Order > Edit</td>
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
                            <c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.edit and !purchaseOrder_edit.locked}'>
								<a class="item-button-lock" href="javascript:lock(true);"><span>Lock</span></a>
                            </c:if>
                            <c:if test='${access.edit and purchaseOrder_edit.locked}'>
								<a class="item-button-unlock" href="javascript:lock(false);"><span>Unlock</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/purchaseorderprint.htm?id=${purchaseOrder_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="purchaseOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="50%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${purchaseOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" size="15" disabled value="<fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
	                                                <option><c:out value='${purchaseOrder_edit.requisition.organization.firstName} ${purchaseOrder_edit.requisition.organization.lastName} ${purchaseOrder_edit.requisition.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisition.requisitionType" cssClass="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                                    <form:option value='ASSET' label='ASSET'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                               		<form:option value='${purchaseOrder_edit.requisition.currency.id}' label='${purchaseOrder_edit.requisition.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.requisition.exchange.rate}' pattern=',##0.0000'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                                <form:select id='tax' path='requisition.tax' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.requisition.tax.id}' label='${purchaseOrder_edit.requisition.tax.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${purchaseOrder_edit.requisition.tax.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='requisition.extTax1' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.requisition.extTax1.id}' label='${purchaseOrder_edit.requisition.extTax1.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${purchaseOrder_edit.requisition.extTax1.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='requisition.extTax2' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.requisition.extTax2.id}' label='${purchaseOrder_edit.requisition.extTax2.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${purchaseOrder_edit.requisition.extTax2.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rounding :</td>
                                            <td><input id='rounding' name='rounding' value="<fmt:formatNumber value='${purchaseOrder_edit.rounding}' pattern=',##0.00'/>" disabled class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payment Method Type : </td>
                                            <td >
                                                <form:select id='methodType' path='paymentMethodType'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
					<tr>
                                            <td align="right">Shipping Method Type : </td>
                                            <td >
							<form:select id='shipMethodType' path='shippingMethodType'>
								<c:if test='${!purchaseOrder.requisition.supplier.local}'>
								    <form:option value='SEA' label='SEA'/>
								    <form:option value='AIR' label='AIR'/>
								</c:if>
							</form:select>
                                          	</td>
                                        </tr>
					<tr>
                                            <td align="right">Insurance Cover By : </td>
                                            <td >
						<form:select id='insurance' path='insuranceType'>
							<c:if test='${!purchaseOrder.requisition.supplier.local}'>
							    <form:option value='BUYER' label='BUYER'/>
							    <form:option value='SELLER' label='SELLER'/>
							</c:if>
						</form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Term :</td>
                                            <td><input class="input-disabled" disabled size="5" value="${purchaseOrder_edit.creditTerm.term}"/>&nbsp;Day(s)</td>
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
                                        	<td valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Reference</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="29%" align="right">Purchase Requisition :</td>
                                                        <td width="71%" align="right"><a href="<c:url value='/page/purchaserequisitionpreedit.htm?id=${purchaseOrder_edit.requisition.id}'/>"><c:out value='${purchaseOrder_edit.requisition.code}'/></a></td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="29%" align="right">Goods Receipt :</td>
                                                        <td width="71%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.receipts}' var='good'>
                                                            	<a href="<c:url value='/page/goodsreceiptpreedit.htm?id=${good.id}'/>"><c:out value='${good.code}'/></a><br/>
                                                            </c:forEach>
                                                    	</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="29%" align="right">Invoice Verification :</td>
                                                        <td width="71%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.verifications}' var='verify'>
                                                            	<a href="<c:url value='/page/invoiceverificationpreedit.htm?id=${verify.id}'/>"><c:out value='${verify.code}'/></a><br/>
                                                            </c:forEach>
                                                    	</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                              <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      	<th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.to.symbol}'/>)</th>
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
                                                      	<td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                              		</table>
                                                </fieldset>
                                                <fieldset>
                                                	<legend><strong>Cost Component</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      	<th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Cost Component : </td>
                                                        <td><input id="component" value="<fmt:formatNumber value='${adapter.component}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="componentDef" value="<fmt:formatNumber value='${adapter.defComponent}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Cost Component Tax: </td>
                                                        <td><input id="component" value="<fmt:formatNumber value='${adapter.componentTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="componentDef" value="<fmt:formatNumber value='${adapter.defComponentTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right"><strong>Total cost Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${adapter.component+adapter.componentTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        	<td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defComponent+adapter.defComponentTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                                	<option><c:out value='${purchaseOrder_edit.requisition.supplier.firstName} ${purchaseOrder_edit.requisition.supplier.lastName} ${purchaseOrder_edit.requisition.supplier.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Address : </td>
                                            <td width="35%">
                                            	 <form:select id="supplierAddress" path="supplierAddress" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.supplierAddress}'>
                                                        <form:option value='${purchaseOrder_edit.supplierAddress.id}' label='${purchaseOrder_edit.supplierAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Phone : </td>
                                          	<td width="35%">
                               	      			<form:select id="supplierPhone" path="supplierPhone" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.supplierPhone}'>
                                                        <form:option value='${purchaseOrder_edit.supplierPhone.id}' label='${purchaseOrder_edit.supplierPhone.contact}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Fax : </td>
                                          	<td width="35%">
                               	      			<form:select id="supplierFax" path="supplierFax" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.supplierFax}'>
                                                        <form:option value='${purchaseOrder_edit.supplierFax.id}' label='${purchaseOrder_edit.supplierFax.contact}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                                <form:select id="contactPerson" path="contactPerson" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.contactPerson}'>
                                                        <form:option value='${purchaseOrder_edit.contactPerson.id}' label='${purchaseOrder_edit.contactPerson.firstName} ${purchaseOrder_edit.contactPerson.middleName} ${purchaseOrder_edit.contactPerson.lastName}' />
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
                                                    <c:if test='${not empty purchaseOrder_edit.requisition.billTo}'>
                                                        <form:option value='${purchaseOrder_edit.requisition.billTo.id}' label='${purchaseOrder_edit.requisition.billTo.party.firstName} ${purchaseOrder_edit.requisition.billTo.party.middleName} ${purchaseOrder_edit.requisition.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="requisition.shipTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.requisition.shipTo}'>
                                                        <form:option value='${purchaseOrder_edit.requisition.shipTo.id}' label='${purchaseOrder_edit.requisition.shipTo.name}' />
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
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                            <th width="9%">Received</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_edit.requisition.items}' var='line'>
                                        <tr>
                                        	<td><c:out value='${line.productPrice.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatDate value='${line.deliveryDate}' pattern='dd-MM-yyyy'/></td>
                                            <td><fmt:formatNumber value='${line.receipted}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="8">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="costcomponent" dojoType="ContentPane" label="Cost Component" class="tab-pages" refreshOnShow="true" selected='true'>
                                    	<div class="toolbar-clean">
                                            <c:if test='${access.edit and !purchaseOrder_edit.locked}'>
                                            	<a class="item-button-new" href="<c:url value='/page/purchaseordercostcomponentpreadd.htm?source=purchaseorderpreedit.htm&id=${purchaseOrder_edit.id}'/>"><span>New Component</span></a>
                                            </c:if>
                                        </div>
                                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="6%"><div style="width:44px;"></div></th>
                                       	  	<th width="15%">ID</th>
                                   	  	  	<th width="16%">Cost Name</th>
                                       	  	<th width="9%">Amount</th>
                                       	  	<th width="9%">Tax</th>
                                       	  	<th width="15%">Verification</th>
                                            <th width="17%">Payment</th>
                                          	<th width="13%">Event Gr</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${purchaseOrder_edit.components}" var="com">
                                        <tr>
                                            <td class="tools">
                                                <a class="item-button-edit" href="<c:url value='/page/purchaseordercostcomponentpreedit.htm?source=purchaseorderpreedit.htm&id=${com.id}'/>" title="Edit"><span>Edit</span></a>
                                                <c:if test='${access.delete and empty purchaseOrder_edit.receipts and empty com.verification}'>
                                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/purchaseordercostcomponentdelete.htm?source=purchaseorderpreedit.htm&id=${com.id}'/>');" title="Delete"><span>Delete</span></a>
                                                </c:if>
                                            </td>
                                            <td><c:out value='${com.code}'/></td>
                                            <td><c:out value='${com.cost.name}'/></td>
                                            <td><fmt:formatNumber value='${com.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${com.amount*com.tax.taxRate/100}' pattern=',##0.00'/></td>
                                            <td><a href="<c:url value='/page/purchaseordercostcomponentverificationpreedit.htm?id=${com.verification.id}'/>"><c:out value='${com.verification.code}'/></a></td>
                                            <td>
                                            	<c:forEach items='${com.verification.applications}' var='application'>
                                                	<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a>,&nbsp;
                                                </c:forEach>
                                            </td>
                                            <td><c:out value='${com.time}'/></td>     
                                        </tr>
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
<script type="text/javascript" src="assets/dialog.js"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save()
	{		
		document.editForm.action = "<c:url value='/page/purchaseorderedit.htm'/>";
		document.editForm.submit();
	}
	
	function lock(lock)
	{
		window.location = "<c:url value='/page/purchaseorderlock.htm?id=${purchaseOrder_edit.id}&lock='/>"+lock;
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
<%@ include file="/common/dialog.jsp"%>