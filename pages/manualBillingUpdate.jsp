<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Manual Billing >> Edit</title>
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
			<td width="60%">Financial Accounting > Account Receivable > Manual Billing > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F19 - Manual Billing</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/manualbillingview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test="${manual_billing_edit.pph == null and manual_billing_edit.status != 'PAID' and not empty manual_billing_edit.journalEntry}">
								<a class="item-button-cancel" href="<c:url value='/page/pphpreadd.htm?id=${manual_billing_edit.id}'/>"><span>PPH</span></a>
                            </c:if>
                             <c:if test='${access.edit}'>
								<a class="item-button-credit-memo" href="<c:url value='/page/creditmemopreadd1.htm?id=${manual_billing_edit.id}'/>"><span>Credit Memo</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/billingprintoption.htm?id=${manual_billing_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="manual_billing_edit">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                	<td width="538" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="30%" nowrap="nowrap" align="right">ID :</td>
                                       	  	<td width="70%"><input value="${manual_billing_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" nowrap="nowrap" align="right">Legend :</td>
                                       	  	<td width="70%"><input value="${manual_billing_edit.legend}" class='input-disabled' size='30'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                   <form:option value='${manual_billing_edit.organization.id}' label='${manual_billing_edit.organization.firstName} ${manual_billing_edit.organization.lastName} ${manual_billing_edit.organization.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Company Tax Address :</td>
                                          <td>
                                                <form:select id="address" path="taxAddress" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${manual_billing_edit.taxAddress.id}' label='${manual_billing_edit.taxAddress.address}' />
                                                </form:select>										  
										  </td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Bank/Cash Account :</td>
                                          <td>
										        <form:select id="accounts" path="bankAccount" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='' label='${manual_billing_edit.bankAccount.code}' />
                                                </form:select>	
										  </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${manual_billing_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${manual_billing_edit.customer.id}' label='${manual_billing_edit.customer.firstName} ${manual_billing_edit.customer.lastName} ${manual_billing_edit.customer.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Credit Term :</td>
                                            <td><input size="7" class="input-disabled" disabled value="${manual_billing_edit.creditTerm.term}"/>&nbsp;Days</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                                <form:select path='tax' disabled='true'>
                                                    <form:option value='${manual_billing_edit.tax.id}' label='${manual_billing_edit.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${manual_billing_edit.tax.taxRate}"/>
                                            </td>
                                        </tr>
                                                                                <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select path='extTax1' disabled='true'>
                                                    <form:option value='${manual_billing_edit.extTax1.id}' label='${manual_billing_edit.extTax1.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${manual_billing_edit.extTax1.taxRate}"/>
                                            </td>
                                        </tr>
                                                                                <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select path='extTax2' disabled='true'>
                                                    <form:option value='${manual_billing_edit.extTax2.id}' label='${manual_billing_edit.extTax2.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${manual_billing_edit.extTax2.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select path='currency' disabled='true'>
                                                    <form:option value='${manual_billing_edit.currency.id}' label='${manual_billing_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Invoice Tax Number :</td>
                                            <td>
                                                <form:input size="7" path='taxNumber.code'/>
                                                &nbsp;
                                                <form:select id="taxcode" path="taxNumber.invoiceTax" cssClass="combobox">
                                                    <c:if test='${not empty manual_billing_edit.taxNumber.invoiceTax}'>
                                                        <form:option value='${manual_billing_edit.taxNumber.invoiceTax.id}' label='${manual_billing_edit.taxNumber.invoiceTax.code}' />
                                                    </c:if>
                                                </form:select>
                                                <c:if test='${manual_billing_edit.taxNumber.invoiceTax == null}'>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupinvoicetaxview.htm?target=taxcode&organization=${manual_billing_edit.organization.id}'/>');" style="CURSOR:pointer;" title="Invoice Tax Code" />
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td><input class='input-disabled' value="<fmt:formatNumber value='${manual_billing_edit.rounding}' pattern=',##0.00'/>" disabled size='10'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Reference Type :</td>
                                            <td>
                                                <form:select path='billingType' disabled='true'>
                                                    <form:option value='${manual_billing_edit.billingType.id}' label='${manual_billing_edit.billingType.name}'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Authorizer :</td>
                                            <td>
                                                <form:select id="signer" path="signer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty manual_billing_edit.signer}'>
                                                        <form:option value='${manual_billing_edit.signer.id}' label='${manual_billing_edit.signer.firstName} ${manual_billing_edit.signer.lastName} ${manual_billing_edit.signer.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="40" rows="7"/></td>
                                        </tr>
                                      </table>
                               	  </td>
                                	<td width="676" valign="top" align="left">
                           	  			<table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                        	<td width="47%" align="left" valign="top">
    					    					<fieldset>
                                                	<legend><strong>Other Reference</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                    	<td width="42%" align="right">Credit Memo :</td>
                                               	  		<td width="58%">
                                   	  					  <c:forEach items='${manual_billing_edit.creditMemos}' var='memo'>
                                                            	<a href="<c:url value='/page/creditmemopreedit.htm?id=${memo.id}'/>"><c:out value='${memo.code}'/></a>,
                                                          </c:forEach>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">PPH :</td>
                                                        <td><a href="<c:url value='/page/pphpreedit.htm?id=${manual_billing_edit.pph.id}'/>"><c:out value='${manual_billing_edit.pph.code}'/></a></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Journal :</td>
                                                        <td><a href="<c:url value='/page/journalentrypreedit.htm?id=${manual_billing_edit.journalEntry.id}'/>"><c:out value='${manual_billing_edit.journalEntry.code}'/></a></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                          	</td>
                                      <td width="53%" align="left" valign="top">
   	    		<fieldset>
                                               	<legend><strong>Receipt Information</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                    	<td width="55%">&nbsp;</td>
                                                        <td width="1%">&nbsp;</td>
                                                      	<td width="45%" align="right"><strong><font size="+1">${manual_billing_edit.status}</font></strong></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Unpaid Amount</td>
                                                        <td width="1%">:</td>
                                                        <td align="right"><input id="lineAmount" value="<fmt:formatNumber value='${adapter.billing.unpaid}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Receipt Reference</td>
                                                        <td width="1%">:</td>
                                                        <td align="left">
                                                        	<c:forEach items='${adapter.billing.payments}' var='application'>
                                                            	<a href="<c:url value='/page/receiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
                                                            </c:forEach>
                                                      </td>
                                                    </tr>
                                                    </table>
                                        </fieldset>
                                          </td>
                                </tr>
                                        <tr>
                                        	<td valign="top" align="left" colspan="2">
                                            	<fieldset>
                                                	<legend><strong>Transaction Amount</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                    	<td>&nbsp;</td>
                                                        <td align="center"><strong>Amount (<c:out value='${manual_billing_edit.currency.symbol}'/>)</strong></td>
                                                        <td align="center"><strong>Amount (${default.symbol})</strong></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Total Line Amount</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.totalLineAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.totalDefLineAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Tax 1</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.taxAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defTaxAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Tax 2</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.tax2Amount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defTax2Amount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Tax 3</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.tax3Amount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defTax3Amount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Total After Tax</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.afterTaxAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defAfterTaxAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Credit Memo Amount</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.totalCreditMemo}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.totalDefCreditMemo}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Returned Memo Tax 1</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.creditMemoTax}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defCreditMemoTax}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Returned Memo Tax 2</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.creditMemoTax2}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defCreditMemoTax2}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Returned Memo Tax 3</td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.creditMemoTax3}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.defCreditMemoTax3}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td>Rounding</td>
                                                        <td><input id="rounding" value="<fmt:formatNumber value='${adapter.billing.rounding}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="roundingDef" value="<fmt:formatNumber value='${adapter.billing.rounding*adapter.billing.exchange.rate}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td><strong>Total Billing Amount</strong></td>
                                                        <td><input id="lineAmount" value="<fmt:formatNumber value='${adapter.totalAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                        <td><input id="lineAmountDef" value="<fmt:formatNumber value='${adapter.totalDefAmount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
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
                            	<div id="mainTab" dojoType="TabContainer" style="width:100%;height:250px;" >
                                	<div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <tr>
                                    	<td width="14%" align="right">Billing Address : </td>
                                        <td width="35%">
			  								<form:select path='customerbillingAddress' cssClass='combobox-ext' disabled='true'>
                                            	<option><c:out value='${manual_billing_edit.customerbillingAddress.address}'/></option>
                                            </form:select>
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td align="right">Tax Invoice Address : </td>
                                        <td>
                                        	<form:select path='customerTaxAddress' cssClass='combobox-ext' disabled='true'>
                                            	<option><c:out value='${manual_billing_edit.customerTaxAddress.address}'/></option>
                                            </form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="13%" align="right">Sales : </td>
                                  		<td width="38%">
						  					<form:select id="sales" path="sales" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty manual_billing_edit.sales}'>
                                                    <form:option value='${manual_billing_edit.sales.id}' label='${manual_billing_edit.sales.firstName} ${manual_billing_edit.sales.lastName} ${manual_billing_edit.sales.middleName}' />
                                                </c:if>
                                            </form:select>
                                      </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Representative : </td>
                                        <td>
                                            <form:select id="representative" path="representative" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty manual_billing_edit.representative}'>
                                                    <form:option value='${manual_billing_edit.representative.id}' label='${manual_billing_edit.representative.firstName} ${manual_billing_edit.representative.lastName} ${manual_billing_edit.representative.middleName}' />
                                                </c:if>
                                            </form:select>
                                        </td>
                                    </tr>
		                            <tr>
                                    	<td nowrap="nowrap" align="right">Contact Person  : </td>
                                        <td>
                                            <form:select id="contactPerson" path="customerContactPerson" cssClass="combobox-ext" disabled='true'>
                                                <form:option value='' label='${manual_billing_edit.customerContactPerson.firstName} ${manual_billing_edit.customerContactPerson.middleName} ${manual_billing_edit.customerContactPerson.lastName}' />
                                            </form:select>	
                                        </td>
                                    </tr>							
                                    </table>
                                </div>
                                <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true" selected='true'>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                                        <th width="33%">Name</th>
                                        <th width="11%">Qty</th>
                                        <th width="9%">UoM</th>
                                        <th width="8%">Unit Price</th>
                                        <th width="9%">Total</th>
                                        <th width="11%">Disc Amount</th>
                                        <th width="10%">Disc(%)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${manual_billing_edit.lineItems}" var="line" varStatus='status'>
                                    <tr>
                                        <td><c:out value='${line.line.name}'/></td>
                                        <td><fmt:formatNumber value='${line.line.quantity}' pattern=',##0.00'/></td> 
                                        <td><c:out value='${line.line.uom.measureId}'/></td>
                                        <td><fmt:formatNumber value='${line.line.unitPrice.amount}' pattern=',##0.00'/></td>
                                        <td><fmt:formatNumber value='${line.line.quantity*line.line.unitPrice.amount}' pattern=',##0.00'/></td>
                                         <td><fmt:formatNumber value='${line.amountDiscount}' pattern=',##0.00'/></td>
                                        <td><fmt:formatNumber value='${line.percentDiscount}' pattern=',##0.00'/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                    </table>
                                </div>
                                <div id="collecting" dojoType="ContentPane" label="Collecting Status" class="tab-pages" refreshOnShow="true">
                                    <table width="100%" style="border:none">
									<tr>
										<td width="41%" nowrap="nowrap" align="right">Collecting Status :</td>
							  	  		<td width="59%">
                                        	<form:select path='collectingStatus.status' cssClass='combobox'>
                                            	<form:option value='true' label='Collected'/>
                                                <form:option value='false' label='Uncollected'/>
                                            </form:select>
                                        </td>
									</tr>
                                    <tr>
										<td width="41%" nowrap="nowrap" align="right">Collecting Date :</td>
							  	  		<td width="59%"><input id="collectingStatus.collectingDate" name="collectingStatus.collectingDate" value="${billing.collectingStatus.collectingDate}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									</tr>
                                    <tr>
										<td width="41%" nowrap="nowrap" align="right">Collector Name :</td>
							  	  		<td width="59%">
                                        	<form:select id="collector" path='collectingStatus.collector' cssClass='combobox-ext'>
                                            	<c:if test='${not empty manual_billing_edit.collectingStatus.collector}'>
                                                	<form:option value='${manual_billing_edit.collectingStatus.collector.id}' label='${manual_billing_edit.collectingStatus.collector.firstName} ${manual_billing_edit.collectingStatus.collector.middleName} ${manual_billing_edit.collectingStatus.collector.lastName}'/>
                                                </c:if>
                                            </form:select>
                                            &nbsp;
											<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcollectorview.htm?target=collector&organization=${manual_billing_edit.organization.id}'/>');" style="CURSOR:pointer;" title="Collector" />
                                        </td>
									</tr>
                                    <tr>
										<td width="41%" nowrap="nowrap" align="right">Billing Acceptance Date :</td>
							  	  		<td width="59%"><input id="collectingStatus.acceptanceDate" name="collectingStatus.acceptanceDate" value="${manual_billing_edit.collectingStatus.acceptanceDate}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									</tr>
                                    <tr>
										<td width="41%" nowrap="nowrap" align="right">Billing Due Date :</td>
							  	  		<td width="59%"><input value="<fmt:formatDate value='${manual_billing_edit.collectingStatus.dueDate}' pattern='dd-MM-yyyy'/>" class='input-disabled' size='20'/></td>
									</tr>
                                    </table>
                                </div>
                                <div id="event" dojoType="ContentPane" label="Collecting Event" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
                                        	<a class="item-button-new" href="<c:url value='/page/billingcollectingeventpreadd.htm?id=${manual_billing_edit.id}'/>"><span>New Event</span></a>
                                        </c:if>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                   	  	<th width="6%"><div style="width:30px"></div></th>
                                        <th width="14%">Date</th>
                                      	<th width="43%">Event</th>
                                      	<th width="28%">Reference</th>
                                      	<th width="9%">Status</th>
                                    </tr>
                                    <c:forEach items="${manual_billing_edit.events}" var="event">
                                    <tr>
                                    	<td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/billingcollectingeventpreedit.htm?id=${event.id}'/>" title="Edit"><span>Edit</span></a>			
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/billingcollectingeventdelete.htm?id=${event.id}'/>');" title="Del"><span>Del</span></a>
										</td>
                                        <td><fmt:formatDate value='${event.date}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${event.event}'/></td> 
                                        <td><c:out value='${event.reference}'/></td>
                                        <td>
                                        	<c:if test='${event.done}'>Done</c:if>
                                            <c:if test='${!event.done}'>Ongoing</c:if>
                                        </td> 
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                            </div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${manual_billing_edit.createdBy.firstName} ${manual_billing_edit.createdBy.middleName} ${manual_billing_edit.createdBy.lastName}'/> (<fmt:formatDate value='${manual_billing_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${manual_billing_edit.updatedBy.firstName} ${manual_billing_edit.updatedBy.middleName} ${manual_billing_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${manual_billing_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" src="assets/dialog.js"></script>
<script type="text/javascript">
	function save()
	{		
		document.editForm.action = "<c:url value='/page/manualbillingedit.htm'/>";
		document.editForm.submit();
	}
					
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>