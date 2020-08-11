<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Recurring Journal Entry >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/recurringjournalentryedit.htm'/>";
			document.editForm.submit();
		}
</script>
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
			<td width="60%">Financial Accounting > Journal Entrys > Recurring Journal Entry > Edit</td>
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
						
						<h1 class="page-title">F42 - Recurring Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/recurringjournalentryview.htm'/>"><span>List</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="recurringJournal_edit">
							<table width="100%" border="0" cellpadding="0" cellspacing="20" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="${recurringJournal_edit.code}" size="30" disabled/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Day :</td>
										<td>
											<form:select path="day">
												<c:forEach begin="1" end="31" step="1" var='day'>
													<form:option value="${day}">${day}</form:option>
												</c:forEach>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><form:input path="name" size="65"/> </td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryType" disabled="true">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td>
											<select id="org" class="combobox-ext">
												<option><c:out value='${recurringJournal_edit.organization.firstName} ${recurringJournal_edit.organization.middleName} ${recurringJournal_edit.organization.lastName}'/></option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Status :</td>
										<td>
											<form:radiobutton path="enabled" value="true" label="Enabled"/>
											<form:radiobutton path="enabled" value="false" label="Disabled"/>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${recurringJournal_edit.indexes}' var='type'>
                                                <tr>
													<td align="right">${type.indexType.name}</td>
													<td align="center">:</td>
													<td><input value="${type.index}" size="15" disabled/></td>
												</tr>
                                                </c:forEach>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Entry Balance</strong></legend>
												<table width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="29%">&nbsp;</td>
													<td width="37%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input value="<fmt:formatNumber value='${display.debet}' groupingUsed='true' maxFractionDigits='0'/>" type="text" id="txtBalanceDebet" size="15" disabled /></td>
													<td><input value="<fmt:formatNumber value='${display.credit}' groupingUsed='true' maxFractionDigits='0'/>" type="text" id="txtBalanceCredit" size="15" disabled /></td>
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
								<thead>
                                <tr>
									<th width="38%">Account</th>
								  	<th width="15%">Amount</th>
                                  	<th width="15%">Type</th>
								  	<th width="32%">Note</th>
								</tr>
                                </thead>
                                <tbody>
								<c:forEach items="${recurringJournal_edit.details}" var="detail">
								<tr>
									<td>${detail.account.code} - ${detail.account.name}</td>
									<td><fmt:formatNumber value="${detail.amount}" groupingUsed="true" maxFractionDigits="0"/></td>
									<td>${detail.postingType}</td>
									<td>${detail.note}</td>
								</tr>
								</c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                </tfoot>
								</table>
							</form:form>
                            <div class="info">Created by :<c:out value='${recurringJournal_edit.createdBy.firstName} ${recurringJournal_edit.createdBy.middleName} ${recurringJournal_edit.createdBy.lastName}'/> (<fmt:formatDate value='${recurringJournal_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${recurringJournal_edit.updatedBy.firstName} ${recurringJournal_edit.updatedBy.middleName} ${recurringJournal_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${recurringJournal_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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