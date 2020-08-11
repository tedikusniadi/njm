<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Pertamina Verification >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/directinvoiceverificationedit.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Financial Accounting > Account Payable > Advance Pertamina Verification > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F29 - Advance Pertamina Verification</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/directinvoiceverificationview.htm'/>"><span>List</span></a>
							<c:if test="${access.edit}">
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  		<c:if test="${access.edit and verification_edit.status == 'UNPAID'}">
                           		<a class="item-button-prepayment" href="<c:url value='/page/paymentpreadd.htm?payables=${verification_edit.id}'/>"><span>Create Payment</span></a>
                            </c:if>
                        </div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_edit">
								<table width="100%" style="border:none;">
                                <tr>
                                	<td width="46%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="77%"><input value="${verification_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.organization}'>
                                                        <form:option value='${verification_edit.organization.id}' label='${verification_edit.organization.firstName} ${verification_edit.organization.lastName} ${verification_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                  			<td nowrap="nowrap" align="right">Date :</td>
                                    		<td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${verification_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                		</tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Supplier :</td>
                                          <td width="77%"><input value="${verification_edit.purchaseOrder.supplier.firstName} ${verification_edit.purchaseOrder.supplier.middleName} ${verification_edit.purchaseOrder.supplier.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Pertamina SO :</td>
                                          	<td width="77%"><form:input path='invoice' size='30'/></td>
                                        </tr>
                                        <tr>
                                  			<td nowrap="nowrap" align="right">Due Date :</td>
                                    		<td><input disabled class="input-disabled" size="15" value="<fmt:formatDate value='${verification_edit.dueDate}' pattern='dd-MM-yyyy'/>"/></td>
                                		</tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Currency :</td>
                                      <td width="77%">
                       	<input value="${verification_edit.purchaseOrder.money.currency.symbol}" class='input-disabled' size='6'/>
                                                &nbsp;
                                                <input value="${verification_edit.purchaseOrder.money.exchangeType}" class='input-disabled' size='7'/>
                                                &nbsp;
                                                <input value="<fmt:formatNumber value='${verification_edit.purchaseOrder.money.rate.rate}' groupingUsed='true' maxFractionDigits='5'/>" class='input-disabled' size='7'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Tax 1 :</td>
                                      		<td width="77%">
                       							<input value="${verification_edit.purchaseOrder.tax.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="${verification_edit.purchaseOrder.tax.taxRate}" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Tax 2 :</td>
                                      		<td width="77%">
                       							<input value="${verification_edit.purchaseOrder.extTax1.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="${verification_edit.purchaseOrder.extTax1.taxRate}" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Tax 3 :</td>
                                      		<td width="77%">
                       							<input value="${verification_edit.purchaseOrder.extTax2.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="${verification_edit.purchaseOrder.extTax2.taxRate}" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                          	<td width="74%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input id="taxDate" name="taxDate" formatLength="long" value="<fmt:formatDate value='${verification_edit.taxDate}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Rounding :</td>
                                      		<td width="77%"><input value="<fmt:formatNumber value='${verification_edit.rounding}' pattern=',##0.00'/>" class='input-disabled' size='10'/></td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Note :</td>
                                          <td width="77%"><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                           	    	<td width="54%" align="left" valign="top">
                           	  			<table style="border:none" width="100%">
                                        <tr>
                                        	<td width="51%" align="left" valign="top">
												<fieldset>
                                                	<legend><strong>Reference</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="46%" align="right">PO No :</td>
                                                      	<td width="54%"><a href="<c:url value='/page/${verification_edit.purchaseOrder.uri}?id=${verification_edit.purchaseOrder.id}'/>"><c:out value='${verification_edit.purchaseOrder.code}'/></a></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Debit Memo :</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                   		  <td width="49%" align="left" valign="top">
    <fieldset>
                                                	<legend><strong>Payment</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td colspan="2" align="right"><h2><c:out value='${verification_edit.status}'/></h2></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Unpaid Amount :</td>
                                                        <td align="right"><input size="12" style="text-align:right" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.unpaid}' pattern=',##0.00'/>"/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Payment :</td>
                                                        <td align="right">
                                                        	<c:forEach items='${verification_edit.applications}' var='application'>
                                                    			<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a><br/>
                                                    		</c:forEach>
                                                        </td>
                                                    </tr>
                                                    </table>
                                              </fieldset>
                                            </td>
                                </tr>
                                        <tr>
                                        	<td colspan="2" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Recapitulation</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                        <th width="43%">&nbsp;</th>
                                                        <th width="31%" align="center">Amount (
                                                      	<c:out value='${verification_edit.purchaseOrder.money.currency.symbol}'/>)</th>
                                                        <th width="26%" align="center">Amount (
                                                      <c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Transaction :</td>
                                                        <td><input id="trx" style="text-align:right;" value="<fmt:formatNumber value='${trx}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" style="text-align:right;" value="<fmt:formatNumber value='${deftrx}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 :</td>
                                                        <td><input id="tax" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_edit.purchaseOrder.tax.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_edit.purchaseOrder.tax.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 :</td>
                                                        <td><input id="tax" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_edit.purchaseOrder.extTax1.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_edit.purchaseOrder.extTax1.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 :</td>
                                                        <td><input id="tax" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_edit.purchaseOrder.extTax2.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_edit.purchaseOrder.extTax2.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Debit Memo :</td>
                                                        <td><input id="trx" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Returned Tax :</td>
                                                        <td><input id="trx" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total :</strong></td>
                                                        <td><input id="total" style="text-align:right;" value="<fmt:formatNumber value='${trx+(trx*verification_edit.purchaseOrder.tax.taxRate/100)+(trx*verification_edit.purchaseOrder.extTax1.taxRate/100)+(trx*verification_edit.purchaseOrder.extTax2.taxRate/100)+verification_edit.rounding}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftotal" style="text-align:right;" value="<fmt:formatNumber value='${deftrx+(deftrx*verification_edit.purchaseOrder.tax.taxRate/100)+(deftrx*verification_edit.purchaseOrder.extTax1.taxRate/100)+(deftrx*verification_edit.purchaseOrder.extTax2.taxRate/100)+(verification_edit.rounding*verification_edit.purchaseOrder.exchange.rate)}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
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
                                <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <tr>
                                    <th width="37%">Product</th>
                                  	<th width="10%">Bought Qty</th>
                                  	<th width="10%">Received Qty</th>
                                  	<th width="5%">UoM</th>
                                  	<th width="10%">Price</th>
                                  	<th width="12%">Total</th>
                                  	<th width="8%">Disc (%)</th>
                                    <th width="8%">Disc Amnt</th>
                                </tr>
                                <c:forEach items="${verification_edit.items}" var="item" varStatus='status'>
                                <tr>
                                    <td><c:out value='${item.verificateable.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.quantity}' pattern=',##0.00'/></td> 
                                    <td><fmt:formatNumber value='${item.verificateable.quantity}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.verificateable.product.unitOfMeasure.measureId}'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.unitPrice}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.unitPrice * item.verificateable.quantity}' pattern=',##0.00'/></td> 
                                    <td><fmt:formatNumber value='${item.verificateable.percent}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.discountAmount}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                                </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${verification_edit.createdBy.firstName} ${verification_edit.createdBy.middleName} ${verification_edit.createdBy.lastName}'/> (<fmt:formatDate value='${verification_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${verification_edit.updatedBy.firstName} ${verification_edit.updatedBy.middleName} ${verification_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${verification_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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