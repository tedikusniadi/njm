<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter To Journal >> Add</title>
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

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Journal Entrys > Inter To Journal Entry > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						
						<h1 class="page-title">F44 - Inter To Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/${interJournal.interJournalable.uri}?id=${interJournal.interJournalable.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="interJournal_add">
                            <table width="100%" style="border:none" id="tableRecord">
							<tr valign="top">
								<td width="52%">
								  <table width="100%" style="border:none">
									<tr>
										<td width="21%" nowrap="nowrap" align="right">Entry Number :</td>
								  	  <td width="79%"><input  value="Auto Number" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input id="date" disabled class="input-disabled" value="<fmt:formatDate value='${interJournal_add.entryFrom.entryDate}' pattern='dd-MM-yyyy'/>"/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company From :</td>
										<td>
											<form:select id="org" path="entryFrom.organization" cssClass="combobox-ext">
												<c:if test='${not empty interJournal_add.entryFrom.organization}'>
                                                	<form:option value='${interJournal_add.entryFrom.organization.id}' label='${interJournal_add.entryFrom.organization.firstName} ${interJournal_add.entryFrom.organization.lastName} ${interJournal_add.entryFrom.organization.middleName}' />
                                                </c:if>

                                            </form:select>
										</td>
									</tr>
									</table>
								</td>
						  		<td width="48%">
					  				<table width="100%" style="border:none">
                                    <tr>
										<td width="19%" align="right" nowrap="nowrap">Amount :</td>
									  	<td width="81%"><input id="amount" size="20" disabled class="input-disabled" style="text-align:right" value="<fmt:formatNumber value='${interJournal_add.amount}' pattern=',#00.00'/>"/></td>
									</tr>
                                    <tr>
                                    	<td width="19%" align="right" nowrap="nowrap">Inter Type :</td>
                                    	<td>
                                        	<form:select path="postingType" disabled='true'>
												<form:option value="DEBET">DEBET</form:option>
                                                <form:option value="CREDIT">CREDIT</form:option>
											</form:select>
                                        </td>
                                    </tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company To :</td>
										<td>
											<form:select id="orgto" path="organizationTo" cssClass="combobox-ext" disabled='true'>
                                            	<option><c:out value='${interJournal_add.organizationTo.firstName} ${interJournal_add.organizationTo.middleName} ${interJournal_add.organizationTo.lastName}'/></option>
                                            </form:select>
										</td>
									</tr>
                                    </table>
								</td>
							</tr>
							</table>
							<table width="100%" style="border:none" id="tableRecord">
							<tr valign="top">
								<td width="52%">
								  <table width="100%" style="border:none">
                                    <tr>
										<td width="23%" align="right" nowrap="nowrap">Name :</td>
									  <td width="77%"><form:input path="entryFrom.name" size="50" disabled='true'/> </td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryFrom.entryType" disabled='true'>
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="entryFrom.currency" disabled='true'>
                                            	<option><c:out value='${interJournal_add.entryFrom.currency.symbol}'/></option>
											</form:select>
                                            &nbsp;
                                            <form:select path="entryFrom.exchangeType" disabled='true'>
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                     <tr>
										<td nowrap="nowrap" align="right">Journal Schema :</td>
										<td>
											<select id="schema" name="entryFrom.journalSchema" class="combobox-ext" disabled>
                                            	<option><c:out value='${interJournal_add.interJournalable.journalSchema.code} ${interJournal_add.interJournalable.journalSchema.name}'/></option>
											</select>
										</td>
									</tr>
                                    <form:hidden id='period' path='entryFrom.accountingPeriod'/>
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="entryFrom.note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
						  		<td width="48%">
					  				<table width="100%" style="border:none">
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${interJournal_add.entryFrom.indexes}' var='index' varStatus='status'>
                                                <tr>
													<td align="right">${index.indexType.name}</td>
													<td align="center">:</td>
													<td><form:input path="entryFrom.indexes[${status.index}].content"/></td>
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
												<table width="100%" style="border:none;">
												<tr>
													<td width="32%">&nbsp;</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input value="<fmt:formatNumber value='${interJournal_add.amount}' pattern=',#00.00'/>" id="txtBalanceDebet" size="20" disabled class="input-disabled" style="text-align:right"/></td>
													<td><input value="<fmt:formatNumber value='${interJournal_add.amount}' pattern=',#00.00'/>" id="txtBalanceCredit" size="20" disabled class="input-disabled" style="text-align:right"/></td>
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
									<th width="36%">Account</th>
								  	<th width="17%">Amount</th>
                                  	<th width="14%">Type</th>
								  	<th width="33%">Note</th>
								</tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${interJournal_add.entryFrom.details}' var='detail'>
                                <tr>
                                	<td><c:out value='${detail.account.code} ${detail.account.name}'/></td>
                                    <td><fmt:formatNumber value='${detail.amount}' pattern=',#00.00'/></td>
                                    <td><c:out value='${detail.postingType}'/></td>
                                    <td><c:out value='${detail.note}'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                	<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
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
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/AccountingPeriodDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save()
	{
		var _event = function(data)
		{
			if(data.id != null)
			{
				var period = document.getElementById('period');
				if(period)
					period.value = data.id;
			
				document.addForm.action = "<c:url value='/page/interjournaltoadd2.htm'/>";
				document.addForm.submit();
			}
			else
			{
				alert('Accounting Period doesnot exist!');
			}			
		}
		
		var date = document.getElementById('date');			
		if(date.value == '')
		{
			alert("Please select date first!");
			return;
		}
		
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert("Please select Organization first!");
			return;
		}
		
		AccountingPeriodDWRRemote.load(date.value,org.value,_event);
	}
</script>