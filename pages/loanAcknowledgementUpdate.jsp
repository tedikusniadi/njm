<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Acknowledgement >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/loanacknowledgementedit.htm'/>";
			document.addForm.submit();
		}
		
		function showerror()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Acknowledgement > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F35 - Loan Acknowledgement</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/loanacknowledgementview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<table style="border:none" width="100%">
                            <tr>
                            	<td width="59%" valign="top">
                               		<form:form name="addForm" method="post" modelAttribute="loan_edit">
                              			<table style="border:none" width="100%">
                                        <tr>
                                            <td width="29%" align="right">ID :</td>
                                          <td width="71%"><input disabled size="30" class="input-disabled" value="${loan_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class='input-disabled' disabled size="15" value="<fmt:formatDate value='${loan_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty loan_edit.organization}'>
                                                        <option value="${loan_edit.organization.id}"><c:out value='${loan_edit.organization.firstName} ${loan_edit.organization.middleName} ${loan_edit.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payer :</td>
                                            <td>
                                                <form:select id="payer" path="payer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty loan_edit.payer}'>
                                                        <option value="${loan_edit.payer.id}"><c:out value='${loan_edit.payer.firstName} ${loan_edit.payer.middleName} ${loan_edit.payer.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee :</td>
                                            <td>
                                                <form:select id="payee" path="payee" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty loan_edit.payee}'>
                                                        <option value="${loan_edit.payee.id}"><c:out value='${loan_edit.payee.firstName} ${loan_edit.payee.middleName} ${loan_edit.payee.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Request Amount :</td>
                                          <td width="71%"><input size="20" disabled class="input-disabled" value="<fmt:formatNumber value='${loan_edit.requisition.amount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Loan Amount :</td>
                                          <td width="71%"><input class="input-disabled" name='information.amount' size="20" value="<fmt:formatNumber value='${loan_edit.information.amount}' pattern=',##0.00'/>" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Interest/Month(%) :</td>
                                          <td width="71%"><form:input path='interest' size="6" disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Duration (Month) :</td>
                                          <td width="71%"><form:input path='approvedDuration' size="6" disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                                    <form:option value='${loan_edit.requisition.currency.id}' label='${loan_edit.requisition.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input class="input-disabled" disabled size='15' value="<fmt:formatNumber value='${loan_edit.requisition.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Payment Type : </td>
                                          <td width="71%">
                                                <form:select id='methodType' path='requisition.paymentMethodType' disabled='true'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Pay To Account : </td>
                                            <td>
                                                <form:select id='pay' path='requisition.bankAccount' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty loan_edit.requisition.bankAccount}'>
                                                        <form:option value='${loan_edit.requisition.bankAccount.id}' label='${loan_edit.requisition.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Transfer/Clearing No : </td>
                                          <td width="71%"><form:input path='information.reference' size='35' disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Pay From Account : </td>
                                            <td>
                                                <form:select id='account' path='information.bankAccount' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty loan_edit.information.bankAccount}'>
                                                        <form:option value='${loan_edit.information.bankAccount.id}' label='${loan_edit.information.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right" nowrap="nowrap">Due Date :</td>
                                          <td width="71%"><input class='input-disabled' disabled size="15" value="<fmt:formatDate value='${loan_edit.information.dueDate}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right">Note :</td>
                                          <td width="71%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </form:form>
                              </td>
                                <td width="41%" valign="top">
                                	<table style="border:none" width="100%">
                                    <tr>
                                    	<td>
                                        	<fieldset>
                                            	<legend><strong>Payment Reference</strong></legend>
                                                <table style="border:none" width="100%">
                                                <c:forEach items='${loan_edit.payments}' var='payment'>
                                                <tr>
                                                	<td><a href="<c:url value='/page/interfacilitypaymentpreedit.htm?id=${payment.id}'/>"><c:out value='${payment.code}'/></a></td>
                                                </tr>
                                                </c:forEach>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td>
                                        	<fieldset>
                                            	<legend><strong>Cross Deposit Reference</strong></legend>
                                                <table style="border:none" width="100%">
                                                <c:forEach items='${loan_edit.payments}' var='payment'>
                                                <tr>
                                                	<td><a href="<c:url value='/page/crossdepositpreedit.htm?id=${payment.crossDeposit.id}'/>"><c:out value='${payment.crossDeposit.code}'/></a></td>
                                                </tr>
                                                </c:forEach>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    </table>
                              </td>
                            </tr>
                            </table>
						</div>
							<div class="info">Created by : ${loan_edit.createdBy.firstName} ${loan_edit.createdBy.middleName} ${loan_edit.createdBy.lastName} (<fmt:formatDate value='${loan_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${loan_edit.updatedBy.firstName} ${loan_edit.updatedBy.middleName} ${loan_edit.updatedBy.lastName} (<fmt:formatDate value='${loan_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
