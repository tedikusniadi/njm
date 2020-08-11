<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cross Deposit >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/crossdepositedit.htm'/>";
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Cross Deposit > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F40 - Cross Deposit</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/crossdepositview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<table style="border:none" width="100%">
                            <tr>
                            	<td width="61%" valign="top">
                               		<form:form name="addForm" method="post" modelAttribute="deposit_edit">
                                        <table style="border:none" width="100%">
                                        <tr>
                                            <td width="30%" align="right">ID :</td>
                                          <td width="70%"><input disabled size="30" class="input-disabled" value="${deposit_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled value="<fmt:formatDate value='${deposit_edit.date}' pattern='dd-MM-yyyy'/>" size="15"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty deposit_edit.organization}'>
                                                        <option value="${deposit_edit.organization.id}"><c:out value='${deposit_edit.organization.firstName} ${deposit_edit.organization.middleName} ${deposit_edit.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payer :</td>
                                            <td>
                                                <form:select id="payer" path="payer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty deposit_edit.payer}'>
                                                        <option value="${deposit_edit.payer.id}"><c:out value='${deposit_edit.payer.firstName} ${deposit_edit.payer.middleName} ${deposit_edit.payer.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee :</td>
                                            <td>
                                                <form:select id="payee" path="payee" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty deposit_edit.payee}'>
                                                        <option value="${deposit_edit.payee.id}"><c:out value='${deposit_edit.payee.firstName} ${deposit_edit.payee.middleName} ${deposit_edit.payee.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td width="30%" align="right">Loan Amount :</td>
                                          <td width="70%"><input class="input-disabled" disabled="disabled" size="20" value="<fmt:formatNumber value='${deposit_edit.information.amount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" align="right">Interest/Month(%) :</td>
                                          <td width="70%"><input class="input-disabled" disabled value="<fmt:formatNumber value='${adjustment.interest}'/>" size="6"/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" align="right">Duration (Month) :</td>
                                          <td width="70%"><input class="input-disabled" disabled value="<fmt:formatNumber value='${adjustment.approvedDuration}'/>" size="6"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <select id='currency' disabled>
                                                    <option><c:out value='${deposit_edit.payment.payable.currency.symbol}'/></option>
                                                </select>
                                                &nbsp;
                                                <form:select id='type' path='payment.payable.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input class="input-disabled" disabled size='15' value="<fmt:formatNumber value='${deposit_edit.payment.payable.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="30%" align="right">Payment Type : </td>
                                          <td width="70%">
                                                <form:select id='methodType' path='information.paymentMethodType' disabled='true'>
                                                    <form:option value='CASH' label='CASH' onclick='closeinfo()'/>
                                                    <form:option value='TRANSFER' label='TRANSFER' onclick='openinfo()'/>
                                                    <form:option value='CLEARING' label='CLEARING' onclick='openinfo()'/>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td width="30%" align="right">Transfer/Clearing No : </td>
                                          <td width="70%"><form:input id='clearing' path='information.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Pay From Account : </td>
                                            <td>
                                                <form:select id='account' path='information.bankAccount' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty deposit_edit.information.bankAccount}'>
                                                        <form:option value='${deposit_edit.information.bankAccount.id}' label='${deposit_edit.information.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Pay To Account : </td>
                                            <td>
                                                <form:select id='pay' path='payTo' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty deposit_edit.payTo}'>
                                                        <form:option value='${deposit_edit.payTo.id}' label='${deposit_edit.payTo.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                              <td width="30%" align="right" nowrap="nowrap">Due Date :</td>
                                          <td width="70%"><input class="input-disabled" disabled value="<fmt:formatDate value='${deposit_edit.information.dueDate}' pattern='dd-MM-yyyy'/>" size="15"/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" align="right">Note :</td>
                                          <td width="70%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                	</form:form>
                              	</td>
                                <td width="39%" valign="top">
                                	<fieldset>
                                    	<legend><strong>Reference</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                        	<td width="40%">Loan Acknowledgement</td>
                                       	  	<td width="1%">:</td>
                                          	<td width="58%"><a href="<c:url value='/page/loanacknowledgementpreedit.htm?id=${adjustment.id}'/>"><c:out value='${adjustment.code}'/></a></td>
                                        </tr>
                                        <tr>
                                        	<td>Loan Payment</td>
                                           	<td>:</td>
                                            <td><a href="<c:url value='/page/interfacilitypaymentpreedit.htm?id=${deposit_edit.payment.id}'/>"><c:out value='${deposit_edit.payment.code}'/></a></td>
                                        </tr>
                                        </table>
                                    </fieldset>
                              </td>
                            </tr>
                            </table>
						</div>
							<div class="info">Created by : ${deposit_edit.createdBy.firstName} ${deposit_edit.createdBy.middleName} ${deposit_edit.createdBy.lastName} (<fmt:formatDate value='${deposit_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${deposit_edit.updatedBy.firstName} ${deposit_edit.updatedBy.middleName} ${deposit_edit.updatedBy.lastName} (<fmt:formatDate value='${deposit_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
