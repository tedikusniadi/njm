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
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script language="javascript" type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/manualinvoiceverificationedit.htm'/>";
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
							<a class="item-button-list" href="<c:url value='/page/manualinvoiceverificationview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="53%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="73%"><input value="${verification_edit.code}" class='input-disabled' size='25'/></td>
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
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${verification_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.supplier}'>
                                                        <form:option value='${verification_edit.supplier.id}' label='${verification_edit.supplier.firstName} ${verification_edit.supplier.lastName} ${verification_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                            	<c:set var="paymentType" value=""/>
                                            	<c:if test="${verification_edit.paymentMethodType == 'CASH'}">
                                            		<c:set var="paymentType" value="CASH"/>
                                            	</c:if>
                                            	<c:if test="${verification_edit.paymentMethodType == 'TRANSFER'}">
                                            		<c:set var="paymentType" value="TRANSFER"/>
                                            	</c:if>
                                            	<c:if test="${verification_edit.paymentMethodType == 'NOTADEBET'}">
                                            		<c:set var="paymentType" value="NOTA DEBET"/>
                                            	</c:if>
                                            	<input id='paymentMethodType' value="${paymentType}" size='20' disabled='true'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier Invoice :</td>
                                            <td><form:input path='invoice' size='20' disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Receive Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${verification_edit.receivedDate}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Due Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${verification_edit.dueDate}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${verification_edit.currency.id}' label='${verification_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='tax' path='tax' disabled='true'>
                                                    <form:option value='${verification_edit.tax.id}' label='${verification_edit.tax.taxId}'/>                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.tax.taxRate}' pattern=',#00.00'/>"/>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='extTax1' disabled='true'>
                                                    <form:option value='${verification_edit.extTax1.id}' label='${verification_edit.extTax1.taxId}'/>                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${verification_edit.extTax1.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='extTax2' disabled='true'>
                                                    <form:option value='${verification_edit.extTax2.id}' label='${verification_edit.extTax2.taxId}'/>                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${verification_edit.extTax2.taxRate}"/>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                          	<td width="74%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input name='taxDate' value="<fmt:formatDate value='${verification_edit.taxDate}' pattern='MM/dd/yyyy'/>" size="15" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td><input id="rounding" name="rounding" value="<fmt:formatNumber value='${verification_edit.rounding}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Verification Type :</td>
                                            <td>
                                                <form:select id='verificationType' path='verificationType' disabled='true'>
                                                    <form:option value='STD_VERIFICATION' label='STANDARD VERIFICATION'/> 
                                                    <%-- <form:option value='GAS_VERIFICATION' label='GAS VERIFICATION'/> --%>                                                
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Gas Distribution Point : </td>
                                            <td>
                                            	<form:select id="location" path="location" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.location}'>
                                                        <form:option value='${verification_edit.location.id}' label='${verification_edit.location.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path='note' cols='55' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                  <td width="47%" valign="top">
                               	  		<table style="border:none" width="100%">
                                        <tr>
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
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      <th width="60%">&nbsp;</th>
                                                        <th width="20%"><div id="trx">Amount</div></th>
                                                        <th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Transaction : </td>
                                                        <td><input id="transaction" value="<fmt:formatNumber value='${adapter.transaction}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="transactionDef" value="<fmt:formatNumber value='${adapter.transaction*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Discount : </td>
                                                        <td><input id="discount" value="<fmt:formatNumber value='${adapter.discount}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="discountDef" value="<fmt:formatNumber value='${adapter.discount*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Transaction Before Tax: </td>
                                                        <td><input id="beforetax" value="<fmt:formatNumber value='${adapter.transactionBeforeTax}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="beforetaxDef" value="<fmt:formatNumber value='${adapter.transactionBeforeTax*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Tax : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.tax*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <%-- <tr>
                                                      <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax2}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.tax2*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Tax 3 : </td>
                                                        <td><input id="tax3amount" value="<fmt:formatNumber value='${adapter.tax3}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="tax3amountDef" value="<fmt:formatNumber value='${adapter.tax3*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr> --%>
                                                    <tr>
                                                      <td align="right">Rounding : </td>
                                                        <td><input id="round" value="<fmt:formatNumber value='${verification_edit.rounding}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="roundDef" value="<fmt:formatNumber value='${verification_edit.rounding*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.total*verification_edit.exchange.rate}' pattern=',#00.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                  	<th>Product</th>
                                    <th width="11%">Bought</th>                                   
                                    <th width="10%">Received</th>
                                    <th width="7%">UoM</th>
                                    <th width="11%">Unit Price</th>                                    
                                    <th width="10%">Total</th>
                                    <th width="9%">Disc(%)</th>
                                    <th width="12%">Disc Amt</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${verification_edit.items}' var='item'>
                                <tr>
                                	<td><c:out value='${item.product.code} - ${item.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.bought}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.received}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.product.unitOfMeasure.measureId}'/></td>
                                    <td><fmt:formatNumber value='${item.unitPrice}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.unitPrice*item.received}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.percentDiscount}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.amountDiscount}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                                </tfoot>
                                </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${verification_edit.createdBy.firstName} ${verification_edit.createdBy.middleName} ${verification_edit.createdBy.lastName}'/> (<fmt:formatDate value='${verification_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${verification_edit.updatedBy.firstName} ${verification_edit.updatedBy.middleName} ${verification_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${verification_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>