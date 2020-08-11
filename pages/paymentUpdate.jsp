<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Payment >> Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" language="javascript">	
		function save()
		{
			document.editForm.action="<c:url value='/page/paymentedit.htm'/>";
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
            <td width="60%">Financial Accounting > Accounting Payable > Payment > Edit</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">F27 - Payment</h1>
						
						<div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/paymentview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/paymentprint.htm?id=${payment_edit.id}'/>"><span>Print</span></a>
			    			</c:if>
                        </div>
						
                        <div class="main-box">			
							<form:form id="editForm" name="editForm" method="post" modelAttribute='payment_edit'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${payment_edit.code}" class="input-disabled" disabled/></td>					
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${payment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_edit.organization}'>
                                                        <form:option value='${payment_edit.organization.id}' label='${payment_edit.organization.firstName} ${payment_edit.organization.lastName} ${payment_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>					
                                        </tr>                                
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_edit.supplier}'>
                                                        <form:option value='${payment_edit.supplier.id}' label='${payment_edit.supplier.firstName} ${payment_edit.supplier.lastName} ${payment_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${payment_edit.currency.id}' label='${payment_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                          </td>					
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>					
                                        </tr>
                                        </table>
                                    </td>
                             		<td width="44%" align="center" valign="top">
                   						<table style="border:none" width="100%">
                                        <tr>
                                        	<td align="left" valign="top">
                                            	
												<!-- BEGIN NEW -->
												
												<fieldset>
                                                	<legend><strong>Journal Reference</strong></legend>
                                                    <table style="border:none" width="100%">
 													<tr>
                                                        <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${payment_edit.journalEntry.id}'/>">${payment_edit.journalEntry.code}</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
												
												
												<!-- END NEW -->
												
												<fieldset>
                                                	<legend><strong>Payment Status</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td colspan="3" align="right">
                                                        	<c:if test="${payment_edit.paymentInformation.paymentMethodType == 'CLEARING' && payment_edit.cleared}">
                                                              <strong><font size="+1"> CLEAR</font></strong>
                                                            </c:if>
                                                            <c:if test="${payment_edit.paymentInformation.paymentMethodType == 'CLEARING' && !payment_edit.cleared}">
                                                                <strong><font size="+1">CLEARING</font></strong>
                                                            </c:if>
                                                        </td>
                                                    </tr>
 													<tr>
                                                        <td width="176" align="right">Clearing Reference : </td>
                                                        <td width="374" colspan="2" align="right"><a href="<c:url value='/page/clearpaymentpreedit.htm?id=${payment_edit.clearPayment.id}'/>">
                                                      <c:out value='${payment_edit.clearPayment.code}'/></a></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                            	<fieldset>
                                                    <legend><strong>Payment Information</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="46%">&nbsp;</th>
                                                      <th width="26%">Amount (
                                                      <c:out value='${payment_edit.currency.symbol}'/>)</th>
                                                      <th width="28%">Amount in (
                                                      <c:out value='${payment_edit.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Unapplied : </td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Reversed : </td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Applied : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.paid}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defPaid}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Write Off : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.writeoff}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defWriteoff}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
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
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Payment Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                        	<td width="52%" align="left"  valign="top">
                                           	  <table width="100%">
                                            	<tr>
                                                    <td width="24%" align="right">Type : </td>
                                       	  	  		<td width="76%">
														<form:select id='methodType' path='paymentInformation.paymentMethodType' disabled='true'>
                                                            <form:option value='CASH' label='CASH'/>
                                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                                            <form:option value='CLEARING' label='CLEARING'/>
                                                            <form:option value='NOTADEBET' label='NOTA DEBET'/>
                                                    	</form:select>
                                               	  </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="right">Transfer/Clearing No : </td>
                                                  <td width="76%"><form:input path='paymentInformation.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                                </tr>
                                                <c:if test="${not empty payment_edit.paymentInformation.bankAccount}">
	                                                <tr>
	                                                    <td align="right">Bank Account : </td>
	                                                    <td>
	                                                        <form:select id='account' path='paymentInformation.bankAccount' cssClass='combobox-ext' disabled='true'>
	                                                            <c:if test='${not empty payment_edit.paymentInformation.bankAccount}'>
	                                                                <form:option value='${payment_edit.paymentInformation.bankAccount.id}' label='${payment_edit.paymentInformation.bankAccount.code}' />
	                                                            </c:if>
	                                                        </form:select>
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td nowrap="nowrap" align="right">Account Name : </td>
	                                                    <td><input id='accountName' value="${payment_edit.paymentInformation.bankAccount.accountName}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
	                                                <tr>
	                                                    <td nowrap="nowrap" align="right">Bank Name : </td>
	                                                    <td><input id='bankName' value="${payment_edit.paymentInformation.bankAccount.bankName}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
	                                                <tr>
	                                                    <td nowrap="nowrap" align="right">Bank Branch : </td>
	                                                    <td><input id='bankBranch' value="${payment_edit.paymentInformation.bankAccount.bankBranch}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
	                                                <tr>
	                                                    <td nowrap="nowrap" align="right">Account No : </td>
	                                                    <td><input id='accountNo' value="${payment_edit.paymentInformation.bankAccount.accountNo}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
                                                </c:if>
                                                <c:if test="${not empty payment_edit.paymentInformation.plafon}">
                                                	<tr>
	                                                    <td nowrap="nowrap" align="right">Plafon Account : </td>
	                                                    <td><input id='plafonCode' value="${payment_edit.paymentInformation.plafon.code}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
	                                                <tr>
	                                                    <td nowrap="nowrap" align="right">Plafon Name : </td>
	                                                    <td><input id='plafonName' value="${payment_edit.paymentInformation.plafon.name}" disabled='true' class='input-disabled' size="30"/></td>
	                                                </tr>
                                                </c:if>
                                                </table>
                                            </td>
                                         	<td width="48%" align="left" valign="top">
											<table width="100%">
                                                <tr>
                                                  <td width="39%" align="right" nowrap="nowrap">Due Date :</td>
                                                  <td width="61%"><input size="15" value="<fmt:formatDate value='${payment_edit.paymentInformation.dueDate}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled/></td>
                                            	</tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Payment Amount : </td>
                                                    <td><input disabled class="input-disabled" style="text-align:right;" value="<fmt:formatNumber value='${payment_edit.paymentInformation.amount}' pattern=',##0.00'/>"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Bank Charges : </td>
                                                    <td><input disabled class="input-disabled" style="text-align:right;" value="<fmt:formatNumber value='${payment_edit.paymentInformation.bankCharges}' pattern=',##0.00'/>"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td align="right">Note : </td>
                                                    <td><form:textarea path='paymentInformation.note' cols='40' rows='6'/></td>					
                                                </tr>
                                                </table>
                                          </td>
                                        </tr>
                                        </table>
                                	</div>
                                	<div id="line" dojoType="ContentPane" label="Payment Application" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="19%">Invoice</th>
                                            <th width="20%">Write Off Type</th>
                                            <th width="20%">Write Off</th>
                                            <th width="20%">Paid</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${payment_edit.applications}' var='app'>
                                        <tr>
                                        	<td><c:out value='${app.payable.code}'/></td>
                                            <td><c:out value='${app.writeoffType}'/></td>
                                            <td><fmt:formatNumber value='${app.writeOff}' pattern=',##0.00'/></td>
                                             <td><fmt:formatNumber value='${app.paid}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>    
                                        </tfoot>
                                        </table>
                                	</div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : ${payment_edit.createdBy.firstName} ${payment_edit.createdBy.middleName} ${payment_edit.createdBy.lastName} (<fmt:formatDate value='${payment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${payment_edit.updatedBy.firstName} ${payment_edit.updatedBy.middleName} ${payment_edit.updatedBy.lastName} (<fmt:formatDate value='${payment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
    
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>	
</html>
