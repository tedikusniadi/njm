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
</head>
<!-- BEGIN OF BODY -->
<body onload="error();">


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						
						<h1 class="page-title">${pageTitle}</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/cashbanktransactionexpenseview.htm'/>"><span>List</span></a>
							<a class="item-button-edit" href="javascript:save();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="cashBankExpense_edit">
                                <table width="100%" border="0">
                                <tr>
                                	<td width="60%">
                                	<table width="100%" style="border:none">
	   				  				<tr>
	                                    <td width="15%" nowrap="nowrap" align="right">ID :</td>
	       								<td width="45%"><input  value="${cashBankExpense_edit.code}" size="30" disabled/></td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Date :</td>
	                                    <td><input disabled size="15" class="input-disabled" value="<fmt:formatDate value='${cashBankExpense_edit.date}' pattern='dd-MM-yyyy'/>" /></td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Company :</td>
	                                    <td>
	                                        <form:select id="org" path="organization" class="combobox-ext" disabled='true'>
	                                            <c:if test='${not empty cashBankExpense_edit.organization}'>
	                                                <form:option value='${cashBankExpense_edit.organization.id}' label='${cashBankExpense_edit.organization.firstName} ${cashBankExpense_edit.organization.lastName} ${cashBankExpense_edit.organization.middleName}' />
	                                            </c:if>
	                                        </form:select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Cash/Bank Account :</td>
	                                    <td>
	                                        <form:select id='bankAccount' path="bankAccount" disabled='true' class="combobox-ext">
	                                            <c:if test='${not empty cashBankExpense_edit.bankAccount}'>
	                                                <form:option value='${cashBankExpense_edit.bankAccount.id}' label='${cashBankExpense_edit.bankAccount.code} ${cashBankExpense_edit.bankAccount.accountName}' />
	                                            </c:if>
	                                        </form:select>
	                                    </td>
	                                    <%-- <td rowspan="10" valign="top">
	                                    	<c:if test='${not empty cashBankExpense_edit.indexes}'>
	                                        	<fieldset>
	                                                <legend><strong>Index</strong></legend>
	                                                <table width="100%" style="border:none;" cellpadding="3">
	                                                <tbody>
	                                                <c:forEach items='${cashBankExpense_edit.indexes}' var='index'>
	                                                <tr>
	                                                    <td align="right"><c:out value='${index.indexType.name}'/></td>
	                                                    <td align="left"><input class="input-disabled" size="20" value="${index.content}" disabled/></td>
	                                                </tr>
	                                                </c:forEach>
	                                                </tbody>
	                                                </table>
	                                            </fieldset>
	                                        </c:if>
	                                    </td> --%>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Cash/Bank GL Account :</td>
	                                    <td><input id="glAccount" disabled size="57" class="input-disabled" value="${cashBankExpense_edit.bankAccount.account.name}"/></td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Journal Schema :</td>
	                                    <td>
	                                        <form:select id='journalSchema' path="journalSchema" disabled='true' class="combobox-ext">
	                                            <c:if test='${not empty cashBankExpense_edit.journalSchema}'>
	                                                <form:option value='${cashBankExpense_edit.journalSchema.id}' label='${cashBankExpense_edit.journalSchema.code} ${cashBankExpense_edit.journalSchema.name}' />
	                                            </c:if>
	                                        </form:select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Approver :</td>
	                                    <td>
	                                        <form:select id='approver' path="approver" disabled='true' class="combobox-ext">
	                                            <c:if test='${not empty cashBankExpense_edit.approver}'>
	                                                <form:option value='${cashBankExpense_edit.approver.id}' label='${cashBankExpense_edit.approver.name}' />
	                                            </c:if>
	                                        </form:select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Amount :</td>
	                                    <td><input id="t_credit" name='amount' value="<fmt:formatNumber value='${cashBankExpense_edit.amount}' pattern=',##0.00'/>" size="20" class="input-disabled"/></td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Currency :</td>
	                                    <td>
	                                        <form:select path="currency" disabled='true'>
	                                            <form:option value='${cashBankExpense_edit.currency.id}' label='${cashBankExpense_edit.currency.symbol}'/>
	                                        </form:select>
	                                        &nbsp;
	                                        <form:select path="exchangeType" disabled='true'>
	                                            <form:option value='SPOT'>SPOT</form:option>
	                                            <form:option value='MIDDLE'>MIDDLE</form:option>
	                                            <form:option value='TAX'>TAX</form:option>
	                                        </form:select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td nowrap="nowrap" align="right">Note :</td>
	                                    <td><form:textarea path="note" cols="55" rows="7"/></td>
	                                </tr>
	                                </table>
	                                </td>
	                                <td width="40%" valign="top">
			  							<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  	<fieldset>
	                                        	<legend><strong>Recapitulation</strong></legend>
	                                            <table cellspacing="2" style="border:none;" width="100%">
	                                            <thead>
	                                            <tr>
	                                            	<th height="25">&nbsp;</th>
	                                              	<th bgcolor="#B7C9E3">Debet</th>
	                                                <th bgcolor="#B7C9E3">Credit</th>
	                                            </tr>
	                                            </thead>
	                                            <tbody>
	                                            <tr>
	                                            	<td>Total:</td>
	                                                <td><input disabled id='debet' class="input-disabled" size="17" style="text-align:right" value="<fmt:formatNumber value='${cashBankExpense_edit.amount}' pattern=',##0.00'/>" /></td>
	                                                <td><input disabled id='credit' class="input-disabled" size="17" style="text-align:right" value="<fmt:formatNumber value='${cashBankExpense_edit.amount}' pattern=',##0.00'/>" /></td>
	                                            </tr>
	                                            </tbody>
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
                                <div class="clears">&nbsp;</div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                  <th width="18%">Account</th>
                                  <th width="33%">Company</th>
                                    <th width="14%">Amount</th>
                                  <th width="20%">Note</th>
                                  <th width="15%">Journal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${cashBankExpense_edit.accounts}' var='account'>
                                <tr>
                                	<td><c:out value='${account.account.code} - ${account.account.name}'/></td>
                                    <td><c:out value='${account.organization.firstName} ${account.organization.middleName} ${account.organization.lastName}'/></td>
                                	<td><fmt:formatNumber value='${account.amount}' pattern=',##0.00'/></td>
                                    <td><c:out value='${account.note}'/></td>
                                    <td><a href="<c:url value='/page/journalentrypreedit.htm?id=${account.journalEntry.id}'/>"><c:out value='${account.journalEntry.code}'/></a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table">
                                    <td colspan="7">&nbsp;</td>
                                </tr>    
                                </tfoot>
                                </table>
							</form:form>
                        </div>
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
<script type="text/javascript">
	function save(_forward)
	{	
		document.editForm.action = "<c:url value='/page/cashbanktransactionexpenseedit.htm'/>";
		document.editForm.submit();
	}
</script>