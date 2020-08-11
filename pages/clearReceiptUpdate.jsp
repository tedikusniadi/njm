<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Receipt >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.editForm.action = "<c:url value='/page/clearreceiptedit.htm'/>";
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
			<td width="60%">Financial Accounting > Accounting Receivables > Clear Receipt > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F25 - Clear Receipt</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/clearreceiptview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
							<a class="item-button-print" href="<c:url value='/page/clearreceiptprint.htm?id=${clear_edit.id}'/>"><span>Print</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="clear_edit">
 								<table width="100%" style="border:none">
 								<tr>
 									<td nowrap="nowrap" align="right">ID :</td>
									<td><input class="input-disabled" value="${clear_edit.code}" disabled size="30"/></td>
 									<td width="32%" colspan="10">
                                    	<fieldset>
                                        	<legend>Journal</legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${clear_edit.journalEntry.id}'/>"><c:out value='${clear_edit.journalEntry.code}'/></a>
                                        </fieldset>
                                  </td>
                                </tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${clear_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right"> Company : </td>
                      				<td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty clear_edit.organization}'>
                                                <form:option value='${clear_edit.organization.id}' label='${clear_edit.organization.firstName} ${clear_edit.organization.lastName} ${clear_edit.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                  	</td>					
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer :</td>
                                    <td>
                                        <select id="customer" class="combobox-ext" disabled>
                                            <c:if test='${not empty clear_edit.receipt.customer}'>
                                                <option value='${clear_edit.receipt.customer.id}'>
                                                	<c:out value='${clear_edit.receipt.customer.firstName} ${clear_edit.receipt.customer.lastName} ${clear_edit.receipt.customer.middleName}'/>
                                                </option>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right">Receipt No : </td>
                      				<td>
                                        <form:select id="receipt" path="receipt" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty clear_edit.receipt}'>
                                                <form:option value='${clear_edit.receipt.id}' label='${clear_edit.receipt.code}' />
                                            </c:if>
                                        </form:select>
                                  	</td>					
                                </tr>  
                                <tr>
 									<td nowrap="nowrap" align="right">Transfer/Clearing No :</td>
									<td><input id="reference" size="35" class="input-disabled" disabled value="${clear_edit.receipt.receiptInformation.reference}"/></td>
 								</tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Bank Name :</td>
									<td><input id="reference" size="35" class="input-disabled" disabled value="${clear_edit.receipt.receiptInformation.bankAccount.bankName}"/></td>
 								</tr>
                                                                <tr>
 									<td nowrap="nowrap" align="right">Account No :</td>
									<td><input id="reference" size="25" class="input-disabled" disabled value="${clear_edit.receipt.receiptInformation.bankAccount.accountNo}"/></td>
 								</tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Amount :</td>
									<td>
                                    	<input id="amount" size="25" class="input-disabled" disabled value="<fmt:formatNumber value='${clear_edit.receipt.receiptInformation.amount}' pattern=',##0.00'/>"/>
                                        &nbsp;
                                        <input id="currency" size="7" class="input-disabled" disabled value="${clear_edit.receipt.currency.symbol}"/>
                                    </td>
 								</tr>
 								<tr>
 									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
 								</tr> 
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<div style="clear_edit:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear_edit:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
