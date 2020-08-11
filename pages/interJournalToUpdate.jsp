<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter To Journal >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>
<!-- BEGIN OF BODY -->
<body>


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
			<td width="60%">Financial Accounting > Journal Entrys > Inter To Journal Entry > Edit</td>
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
						
						<h1 class="page-title">F44 - Inter To Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/interjournaltoview.htm'/>"><span>List</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="interJournal_edit">
                            <table width="100%" border="0" cellpadding="0" cellspacing="5" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="25%" nowrap="nowrap" align="right">Entry Number :</td>
									  <td width="75%"><input  value="${interJournal_edit.code}" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input value="${interJournal_edit.entryFrom.entryDate}"/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company From:</td>
										<td>
											<select class="combobox-ext">
                                            	<option><c:out value='${interJournal_edit.entryFrom.organization.firstName} ${interJournal_edit.entryFrom.organization.middleName} ${interJournal_edit.entryFrom.organization.lastName}'/></option>
											</select>
										</td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <tr>
										<td width="19%" align="right" nowrap="nowrap">Amount :</td>
									  	<td width="81%"><input value="<fmt:formatNumber value='${interJournal_edit.amount}'/>" size="20"/></td>
									</tr>
                                    <tr>
                                    	<td width="19%" align="right" nowrap="nowrap">Inter Type :</td>
                                    	<td>
                                        	<form:select path="postingType">
												<form:option value="DEBET">DEBET</form:option>
                                                <form:option value="CREDIT">CREDIT</form:option>
											</form:select>
                                        </td>
                                    </tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company To :</td>
										<td>
											<form:select id="orgto" path="organizationTo" cssClass="combobox-ext">
                                            	<form:option value='${interJournal_edit.organizationTo.id}'><c:out value='${interJournal_edit.organizationTo.firstName} ${interJournal_edit.organizationTo.middleName} ${interJournal_edit.organizationTo.lastName}'/></form:option>
											</form:select>
										</td>
									</tr>
                                    </table>
								</td>
							</tr>
							</table>
							<table width="100%" border="0" cellpadding="0" cellspacing="20" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><form:input path="entryFrom.name" size="50"/> </td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryFrom.entryType">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="entryFrom.currency">
                                            	<option selected><c:out value='${interJournal_edit.entryFrom.currency.symbol}'/></option>
											</form:select>
                                            &nbsp;
                                            <form:select path="entryFrom.exchangeType">
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                     <tr>
										<td nowrap="nowrap" align="right">Journal Schema :</td>
										<td><input size="20" value="${interJournal_edit.entryFrom.journalSchema}"/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Accounting Period :</td>
										<td>
											<form:select id="period"  path="entryFrom.accountingPeriod" cssClass="combobox">
                                            	<option selected>${interJournal_edit.entryFrom.currency.symbol}</option>
											</form:select>
										</td>
									</tr>									
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="entryFrom.note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <c:if test='${not empty interJournal_edit.entryFrom.indexes}'>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${interJournal_edit.entryFrom.indexes}' var='type'>
                                                <tr>
													<td align="right">${type.indexType.name}</td>
													<td align="center">:</td>
													<td><input value="${type.content}" size="15" disabled/></td>
												</tr>
                                                </c:forEach>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Entry Balance</strong></legend>
												<table width="100%" style="border:none;">
												<tr>
													<td width="32%">&nbsp;</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="right"><strong>Total :</strong></td>
													<td><input style="text-align:right;" value="<fmt:formatNumber value='${display.debet}' groupingUsed='true' maxFractionDigits='0'/>" id="txtBalanceDebet" size="20" disabled /></td>
													<td><input style="text-align:right;" value="<fmt:formatNumber value='${display.credit}' groupingUsed='true' maxFractionDigits='0'/>" id="txtBalanceCredit" size="20" disabled /></td>
												</tr>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </table>
								</td>
								</tr>
								</table>
								<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
								<tr>
									<th width="38%">Account</th>
								  	<th width="15%">Amount</th>
                                  	<th width="15%">Type</th>
								  	<th width="32%">Note</th>
								</tr>
								<c:forEach items="${interJournal_edit.entryFrom.details}" var="detail">
								<tr>
									<td>${detail.account.code} - ${detail.account.name}</td>
									<td><fmt:formatNumber value="${detail.amount}" groupingUsed="true" maxFractionDigits="0"/></td>
									<td>${detail.postingType}</td>
									<td>${detail.note}</td>
								</tr>
								</c:forEach>
                                <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
								</table>
								</div>
						</form:form>
						<div class="info">Created by : <c:out value=' ${interJournal_edit.createdBy.firstName} ${interJournal_edit.createdBy.middleName} ${interJournal_edit.createdBy.lastName}'/> (<fmt:formatDate value='${interJournal_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${interJournal_edit.updatedBy.firstName} ${interJournal_edit.updatedBy.middleName} ${interJournal_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${interJournal_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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