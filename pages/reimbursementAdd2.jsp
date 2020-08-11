<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement >> Add</title>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Reimbursements > Reimbursement > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F32 - Reimbursement</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/reimbursementview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="reimbursement_add">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
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
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <option value="${reimbursement_add.organization.id}"><c:out value='${reimbursement_add.organization.firstName} ${reimbursement_add.organization.middleName} ${reimbursement_add.organization.lastName}'/></option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisition.requisitioner" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty reimbursement_add.requisition.requisitioner}'>
                                                        <form:option value='${reimbursement_add.requisition.requisitioner.id}' label='${reimbursement_add.requisition.requisitioner.firstName} ${reimbursement_add.requisition.requisitioner.lastName} ${reimbursement_add.requisition.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Payee :</td>
                                            <td>
                                                <form:select id="payee" path="payee" cssClass="combobox-ext">
                                                	<form:option value='${reimbursement_add.payee.id}' label='${reimbursement_add.payee.firstName} ${reimbursement_add.payee.middleName} ${reimbursement_add.payee.lastName}'/>
                                                </form:select>
                                                &nbsp;
                                        		<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=payee'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Cashier :</td>
                                            <td>
                                                <form:select path="createdBy" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty reimbursement_add.createdBy}'>
                                                        <form:option value='${reimbursement_add.createdBy.id}' label='${reimbursement_add.createdBy.firstName} ${reimbursement_add.createdBy.lastName} ${reimbursement_add.createdBy.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <select id='currency'  disabled>
                                                    <option><c:out value='${reimbursement_add.requisition.currency.symbol}'/></option>
                                                </select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" size="10" disabled value="<fmt:formatNumber value='${reimbursement_add.requisition.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path="requisition.note" cols="55" rows="6"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                            <legend><strong>Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="29%">&nbsp;</td>
                                                <td width="37%" align="center"><strong>Amount (<c:out value='${reimbursement_add.requisition.currency.symbol}'/>)</strong></td>
                                                <td width="34%" align="center"><strong>Amount (<c:out value='${reimbursement_add.requisition.exchange.to.symbol}'/>)</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><strong>Total</strong></td>
                                                <td><input value="<fmt:formatNumber value='${reimbursement_add.information.amount}' pattern=',##0.00'/>" id="total" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                                <td><input value="<fmt:formatNumber value='${reimbursement_add.information.amount}' pattern=',##0.00'/>" id="totaldef" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                        	<td width="56%" align="left"  valign="top">
                                           	  <table width="100%">
                                            	<tr>
                                                    <td width="27%" align="right">Type : </td>
                               	  	  		  		<td width="73%">
									  					<form:select id='methodType' path='information.paymentMethodType' disabled='true'>
                                                            <form:option value='CASH' label='CASH'/>
                                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                                            <form:option value='CLEARING' label='CLEARING'/>
                                                    	</form:select>
                                               	  </td>
                                                </tr>
                                                <tr>
                                                    <td width="27%" align="right">Transfer/Clearing No : </td>
                                                  	<td width="73%">
                                                    	<c:if test="${reimbursement_add.information.paymentMethodType != 'CASH'}">
                                                        	<form:input id='clearing' path='information.reference' size='35'/>
                                                        </c:if>
                                                        <c:if test="${reimbursement_add.information.paymentMethodType == 'CASH'}">
                                                        	<form:input id='clearing' path='information.reference' size='35' disabled='true' cssClass='input-disabled'/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Bank Account : </td>
                                                    <td>
                                                        <form:select id='account' path='information.bankAccount' cssClass='combobox-ext'>
                                                            <c:if test='${not empty reimbursement_add.information.bankAccount}'>
                                                                <form:option value='${reimbursement_add.information.bankAccount.id}' label='${reimbursement_add.information.bankAccount.code}' />
                                                            </c:if>
                                                        </form:select>
                                                        &nbsp;
                                                        <img src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Account Name : </td>
                                                    <td><input id='accountName' disabled='true' class='input-disabled' size="30" value="${reimbursement_add.information.bankAccount.accountName}"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Bank Name : </td>
                                                    <td><input id='bankName' disabled='true' class='input-disabled' size="30"  value="${reimbursement_add.information.bankAccount.bankName}"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Bank Branch : </td>
                                                    <td><input id='bankBranch' disabled='true' class='input-disabled' size="30"  value="${reimbursement_add.information.bankAccount.bankBranch}"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Account No : </td>
                                                    <td><input id='accountNo' disabled='true' class='input-disabled' size="30"  value="${reimbursement_add.information.bankAccount.accountNo}"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Account Holder : </td>
                                                    <td><input disabled='true' class='input-disabled' size="30"  value="${reimbursement_add.requisition.accountHolder}"/></td>
                                                </tr>
                                              </table>
                                          </td>
                                          	<td width="44%" align="left" valign="top">
												<table width="100%">
                                                <tr>
                                                  	<td width="39%" align="right" nowrap="nowrap">Due Date :</td>
                                                  	<td width="61%">
                                                    	<c:if test="${reimbursement_add.information.paymentMethodType != 'CASH'}">
                                                    		<input id="date" name="information.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                                        </c:if>
                                                        &nbsp;
                                                    </td>
                                            	</tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Payment Amount : </td>
                                                    <td><input class="input-disabled" size="15" disabled value="<fmt:formatNumber value='${reimbursement_add.information.amount}' pattern=',##0.00'/>"/></td>
                                                </tr>
                                                </table>
                                          </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="item" dojoType="ContentPane" label="item" class="tab-pages" refreshOnShow="true">
                                    	<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="15%">Description</th>
                                          <th width="24%">Account</th>
                                          <th width="26%">Company</th>
                                          <th width="16%">Amount</th>
                                            <th width="19%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reimbursement_add.requisition.items}" var="item" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${item.journalSchema.name}'/></td>
                                            <td><c:out value='${item.journalSchema.account.code} ${item.journalSchema.account.name}'/></td>
                                            <td><c:out value='${item.organization.firstName} ${item.organization.middleName} ${item.organization.lastName}'/></td>
                                            <td><fmt:formatNumber value='${item.amount}' pattern=',#00.00'/></td>
                                            <td><c:out value='${item.note}'/></td>
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
		document.addForm.action = "<c:url value='/page/reimbursementadd.htm'/>";
		document.addForm.submit();
	}
	
	function openinfo()
	{
		dojo.byId('clearing').setAttribute('class','inputbox');
		dojo.byId('clearing').disabled = false;
		dojo.widget.byId('date').enable();
	}
	
	function closeinfo()
	{
		dojo.byId('clearing').setAttribute('class','input-disabled');
		dojo.byId('clearing').setAttribute('disabled','true');
		dojo.widget.byId('date').disable();
	}
	
	function openpayee()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppayeeview.htm?target=payee&organization='/>"+org.value);
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
	
	function openaccount()
	{
		var org = dojo.byId('org').value;
		if(org == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		var methodType = document.getElementById('methodType');
		
		var method = 'CASH';
		
		if(methodType.value != 'CASH')
			method = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org+'&type='+method);
	}
</script>