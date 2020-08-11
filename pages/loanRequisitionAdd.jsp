<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Requisition >> Add</title>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Requisition > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F34 - Loan Requisition</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/loanrequisitionview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="requisition_add">
                                <table style="border:none" width="100%">
                                        <tr>
                                            <td width="21%" align="right">ID :</td>
                                          	<td width="79%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                        </tr>
                                        <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Organization :</td>
                      				<td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        	<c:if test='${not empty requisition_add.organization}'>
                                            	<option value="${requisition_add.organization.id}"><c:out value='${requisition_add.organization.firstName} ${requisition_add.organization.middleName} ${requisition_add.organization.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Approver :</td>
                                    <td>
                                        <form:select id="approver" path="approver" cssClass="combobox-ext">
                                            <c:if test='${not empty requisition_add.approver}'>
                                                <form:option value='${requisition_add.approver.id}' label='${requisition_add.approver.firstName} ${requisition_add.approver.lastName} ${requisition_add.approver.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                    </td>
                                </tr>
                                <tr>
									<td width="21%" align="right">Amount :</td>
									<td width="79%"><form:input path='amount' size="20"/></td>
								</tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                    <td>
                                        <form:select id='currency' path='currency'>
                                        <c:forEach items='${currencys}' var='currency'>
                                            <form:option value='${currency.id}' label='${currency.symbol}'/>
                                        </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                        &nbsp;
                                        <input id="trxrate" class="input-disabled" disabled value="1" size='15'/>
                                    </td>
                                </tr>
                                <tr>
									<td width="21%" align="right">Duration (Month) :</td>
									<td width="79%"><form:input path='duration' size="6"/></td>
								</tr>
                                <tr>
                                    <td width="27%" align="right">Type : </td>
                                    <td width="73%">
                                        <form:select id='methodType' path='paymentMethodType'>
                                            <form:option value='CASH' label='CASH'/>
                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                            <form:option value='CLEARING' label='CLEARING'/>
                                        </form:select>
                                    </td>
                                </tr>
								<tr>
									<td align="right">Bank Account : </td>
									<td>
										<form:select id='account' path='bankAccount' cssClass='combobox'>
											<c:if test='${not empty requisition_add.bankAccount}'>
												<form:option value='${requisition_add.bankAccount.id}' label='${requisition_add.bankAccount.code}' />
											</c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Account Name : </td>
									<td><input id='accountName' disabled='true' class='input-disabled' size="30"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Bank Name : </td>
									<td><input id='bankName' disabled='true' class='input-disabled' size="30"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Bank Branch : </td>
									<td><input id='bankBranch' disabled='true' class='input-disabled' size="30"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Account No : </td>
									<td><input id='accountNo' disabled='true' class='input-disabled' size="30"/></td>
								</tr>
								<tr>
									<td width="21%" align="right">Note :</td>
									<td width="79%"><form:textarea path='note' cols='45' rows='6'/></td>
								</tr>
								<tr>
									<td width="21%" align="right">Payment Plan :</td>
									<td width="79%"><form:textarea path='paymentNote' cols='45' rows='6'/></td>
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
		document.addForm.action = "<c:url value='/page/loanrequisitionadd.htm'/>";
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
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		var methodType = document.getElementById('methodType');
		
		var method = 'CASH';
		
		if(methodType.value != 'CASH')
			method = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+'&type='+method);
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>