<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Acknowledgement >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Acknowledgement > Add</td>
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
							<form:form name="addForm" method="post" modelAttribute="loan_add">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="22%" align="right">ID :</td>
                                  <td width="78%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Organization :</td>
                      				<td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        	<c:if test='${not empty loan_add.organization}'>
                                            	<option value="${loan_add.organization.id}"><c:out value='${loan_add.organization.firstName} ${loan_add.organization.middleName} ${loan_add.organization.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payer :</td>
                      				<td>
                                        <form:select id="payer" path="payer" cssClass="combobox-ext">
                                        	<c:if test='${not empty loan_add.payer}'>
                                            	<option value="${loan_add.payer.id}"><c:out value='${loan_add.payer.firstName} ${loan_add.payer.middleName} ${loan_add.payer.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=payer'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payee :</td>
                      				<td>
                                        <form:select id="payee" path="payee" cssClass="combobox-ext" disabled='true'>
                                        	<c:if test='${not empty loan_add.payee}'>
                                            	<option value="${loan_add.payee.id}"><c:out value='${loan_add.payee.firstName} ${loan_add.payee.middleName} ${loan_add.payee.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
									<td width="22%" align="right">Request Amount :</td>
								  <td width="78%"><input size="20" disabled class="input-disabled" value="<fmt:formatNumber value='${loan_add.requisition.amount}' pattern=',##0.00'/>"/></td>
								</tr>
                                <tr>
									<td width="22%" align="right">Loan Amount :</td>
								  	<td width="78%"><input name='information.amount' size="20" value="<fmt:formatNumber value='${loan_add.information.amount}' pattern=',##0.00'/>"/></td>
								</tr>
                                <tr>
									<td width="22%" align="right">Interest/Month(%) :</td>
								  <td width="78%"><form:input path='interest' size="6"/></td>
								</tr>
                                <tr>
									<td width="22%" align="right">Duration (Month) :</td>
								  <td width="78%"><form:input path='approvedDuration' size="6"/></td>
								</tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                    <td>
                                        <form:select id='currency' path='requisition.currency' disabled='true'>
                                        	<form:option value='${loan_add.requisition.currency.id}' label='${loan_add.requisition.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                        &nbsp;
                                        <input class="input-disabled" disabled size='15' value="<fmt:formatNumber value='${loan_add.requisition.exchange.rate}' pattern=',##0.00'/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="22%" align="right">Payment Type : </td>
                              		<td width="78%">
                      					<form:select id='methodType' path='requisition.paymentMethodType' disabled='true'>
                                            <form:option value='CASH' label='CASH'/>
                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                            <form:option value='CLEARING' label='CLEARING'/>
                                        </form:select>
                                    </td>
                                </tr>
								<tr>
									<td align="right">Payee Account : </td>
									<td>
										<form:select id='pay' path='requisition.bankAccount' cssClass='combobox' disabled='true'>
											<c:if test='${not empty loan_add.requisition.bankAccount}'>
												<form:option value='${loan_add.requisition.bankAccount.id}' label='${loan_add.requisition.bankAccount.code}' />
											</c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
                                    <td width="22%" align="right">Transfer/Clearing No : </td>
                               	  	<td width="78%">
                                    	<c:if test="${loan_add.requisition.paymentMethodType == 'CASH'}">
                                        	<form:input path='information.reference' size='35' cssClass='input-disabled' disabled='true'/>
                                        </c:if>
                                        <c:if test="${loan_add.requisition.paymentMethodType != 'CASH'}">
                                        	<form:input path='information.reference' size='35'/>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
									<td align="right">Payer Account : </td>
									<td>
										<form:select id='account' path='information.bankAccount' cssClass='combobox'>
											<c:if test='${not empty loan_add.information.bankAccount}'>
												<form:option value='${loan_add.information.bankAccount.id}' label='${loan_add.information.bankAccount.code}' />
											</c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
									</td>
								</tr>
                                <tr>
                                    <td width="22%" align="right" nowrap="nowrap">Due Date :</td>
                                  	<td width="78%">
                                    	<c:if test="${loan_add.requisition.paymentMethodType == 'CASH'}">
                                        	<input id="date" disabled="disabled" name="information.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        </c:if>
                                        <c:if test="${loan_add.requisition.paymentMethodType != 'CASH'}">
                                        	<input id="date" name="information.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        </c:if>
                                    </td>
                                </tr>
								<tr>
									<td width="22%" align="right">Note :</td>
								  <td width="78%"><form:textarea path='note' cols='45' rows='6'/></td>
								</tr>
								</table>
							</form:form>
						</div>
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
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/loanacknowledgementadd.htm'/>";
		document.addForm.submit();
	}
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuploanapproverview.htm?target=approver&organization='/>"+org.value);
	}
	
	function openaccount()
	{
		var org = document.getElementById('payer');
		if(org.value == '')
		{
			alert('Please select Borrowed From Company first!');
			return;
		}

		var type = 'BANK';

		if('${loan_add.requisition.paymentMethodType}' == 'CASH')
			type='CASH';

		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+"&type="+type);
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>