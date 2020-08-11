<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Pertamina Purchase Order >> Edit</title>
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
			<td width="60%">Procurement > Pertamina Procurement > Pertamina Purchase Order > Edit</td>
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
								<a class="item-button-copy" href="<c:url value='/page/ext1purchaseorderprecopy.htm?id=${purchaseOrder_edit.id}'/>"><span>Copy</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/ext1purchaseorderprint.htm?id=${purchaseOrder_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="purchaseOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="52%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${purchaseOrder_edit.code}" disabled class='input-disabled' size='35'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" size="15" disabled value="<fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
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
                                                    <form:option value='ASSET' label='ASSET'/>
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
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_edit.approver}'>
                                                        <form:option value='${purchaseOrder_edit.approver.id}' label='${purchaseOrder_edit.approver.firstName} ${purchaseOrder_edit.approver.lastName} ${purchaseOrder_edit.approver.middleName}' />
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
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" size="7" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.tax.id}' label='${purchaseOrder_edit.tax.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" value="<fmt:formatNumber value='${purchaseOrder_edit.tax.taxRate}' pattern=',##0.00'/>" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='extTax1' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.extTax1.id}' label='${purchaseOrder_edit.extTax1.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.extTax1.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='extTax2' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.extTax2.id}' label='${purchaseOrder_edit.extTax2.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.extTax2.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rounding :</td>
                                            <td><input value="<fmt:formatNumber value='${purchaseOrder_edit.rounding}' pattern=',##0.00'/>" disabled class="input-disabled" size="10"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  </td>
                       		  <td width="48%" valign="top">
						  <table width="100%" style="border:none">
                                      	<tr>
                                      		<td>
                                            	<fieldset>
                                                	<legend><strong>Transaction Reference</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="46%" align="right">Invoice Verification :</td>
                                                        <td width="54%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.verifications}' var='verify'>
                                                            	<a href="<c:url value='/page/directinvoiceverificationpreedit.htm?id=${verify.id}'/>"><c:out value='${verify.code}'/></a><br/>
                                                            </c:forEach>
                                                   	  	</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="46%" align="right">Payment :</td>
                                                        <td width="54%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.verifications}' var='verify'>
                                                            	<c:forEach items='${verify.applications}' var='application'>
                                                            		<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a><br/>
                                                            	</c:forEach>
                                                            </c:forEach>
                                                   	  	</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="46%" align="right">SO Pertamina :</td>
                                                        <td width="54%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.loadings}' var='load'>
                                                            	<a href="<c:url value='/page/loadingorderpreedit.htm?id=${load.id}'/>"><c:out value='${load.code}'/></a><br/>
                                                            </c:forEach>
                                                   	  	</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="46%" align="right">Collecting Order :</td>
                                                        <td width="54%" align="right">
                                                        	<c:forEach items='${purchaseOrder_edit.loadings}' var='load'>
                                                            	<c:forEach items='${load.plans}' var='plan'>
                                                                	<c:if test='${plan.collectingOrder != null}'>
                                                            			<a href="<c:url value='/page/collectingorderpreedit.htm?id=${plan.collectingOrder.id}'/>"><c:out value='${plan.collectingOrder.code}'/></a><br/>
                                                                    </c:if>
                                                            	</c:forEach>
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
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.currency.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="<fmt:formatNumber value='${amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="<fmt:formatNumber value='${defAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_edit.tax.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_edit.tax.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_edit.extTax1.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_edit.extTax1.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${amount*purchaseOrder_edit.extTax2.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${defAmount*purchaseOrder_edit.extTax2.taxRate/100}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="round" value="<fmt:formatNumber value='${purchaseOrder_edit.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="rounddef" value="<fmt:formatNumber value='${purchaseOrder_edit.rounding*purchaseOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${amount+(amount*purchaseOrder_edit.tax.taxRate/100)+(amount*purchaseOrder_edit.extTax1.taxRate/100)+(amount*purchaseOrder_edit.extTax2.taxRate/100)+purchaseOrder_edit.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${defAmount+(defAmount*purchaseOrder_edit.tax.taxRate/100)+(defAmount*purchaseOrder_edit.extTax1.taxRate/100)+(defAmount*purchaseOrder_edit.extTax2.taxRate/100)+purchaseOrder_edit.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                                <fieldset>
                                                    <legend><strong>Cost Component</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.currency.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Cost Component : </td>
                                                        <td><input id="component" value="<fmt:formatNumber value='${component}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="componentDef" value="<fmt:formatNumber value='${defcomponent}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Cost Component Tax: </td>
                                                        <td><input id="component" value="<fmt:formatNumber value='${componenttax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="componentDef" value="<fmt:formatNumber value='${defcomponenttax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total cost Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${component+componenttax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${defcomponent+defcomponenttax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><%@ include file="/common/approval-history.jsp" %></td>
                                        </tr>
                                        <tr>
                                            <td><%@ include file="/common/approval.jsp" %></td>
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
                                                    <c:if test='${not empty purchaseOrder_edit.billTo}'>
                                                        <form:option value='${purchaseOrder_edit.billTo.id}' label='${purchaseOrder_edit.billTo.party.firstName} ${purchaseOrder_edit.billTo.party.middleName} ${purchaseOrder_edit.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.shipTo}'>
                                                        <form:option value='${purchaseOrder_edit.shipTo.id}' label='${purchaseOrder_edit.shipTo.name}' />
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
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_edit.items}' var='item'>
                                        <tr>
                                        	<td><c:out value='${item.productPrice.product.code} - ${item.productPrice.product.name}'/></td>
                                        	<td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.buyingPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.quantity*item.buyingPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="costcomponent" dojoType="ContentPane" label="Cost Component" class="tab-pages" refreshOnShow="true" selected='true'>
                                    	<div class="toolbar-clean">
                                            <c:if test="${access.edit and !purchaseOrder_edit.locked and purchaseOrder_edit.approvable.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
                                            	<a class="item-button-new" href="<c:url value='/page/purchaseordercostcomponentpreadd.htm?source=ext1purchaseorderpreedit.htm&id=${purchaseOrder_edit.id}'/>"><span>New Component</span></a>
                                            </c:if>
                                        </div>
                                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="6%"><div style="width:44px;"></div></th>
                                       	  	<th width="17%">ID</th>
                                   	  	  	<th width="21%">Cost Name</th>
                                       	  	<th width="10%">Amount</th>
                                       	  	<th width="9%">Tax</th>
                                       	  	<th width="16%">Verification</th>
                                            <th width="14%">Payment</th>
                                       	  <th width="7%">Event Gr</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${purchaseOrder_edit.components}" var="com">
                                        <tr>
                                            <td class="tools">
                                                <a class="item-button-edit" href="<c:url value='/page/purchaseordercostcomponentpreedit.htm?source=ext1purchaseorderpreedit.htm&id=${com.id}'/>" title="Edit"><span>Edit</span></a>
                                                <c:if test='${access.edit and empty purchaseOrder_edit.receipts}'>
                                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/purchaseordercostcomponentdelete.htm?source=ext1purchaseorderpreedit.htm&id=${com.id}'/>');" title="Delete"><span>Delete</span></a>
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
						<div class="info">Created by : <c:out value='${purchaseOrder_edit.createdBy.firstName} ${purchaseOrder_edit.createdBy.middleName} ${purchaseOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${purchaseOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${purchaseOrder_edit.updatedBy.firstName} ${purchaseOrder_edit.updatedBy.middleName} ${purchaseOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${purchaseOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
<%@ include file="/common/dialog.jsp"%>
<script type="text/javascript" src="assets/dialog.js"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save()
	{		
		document.editForm.action = "<c:url value='/page/ext1purchaseorderedit.htm'/>";
		document.editForm.submit();
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>