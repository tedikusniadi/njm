<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Journal Entry >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			var debet = document.getElementById('txtBalanceDebet').value;
			var credit = document.getElementById('txtBalanceCredit').value;			
		
			if(debet != credit)
			{
				alert("Amount not balance!");
				return;
			}
		
			document.addForm.action = "<c:url value='/page/journalentrycopy.htm'/>";
			document.addForm.submit();
		}
		
		function setIndex(id)
		{
			if(id)
			{
				var input = document.getElementById('text-id['+id+']');
				var index = document.getElementById('hidden-id['+id+']');
			
				if(input && index)
				{
					if(input.value != '')
						index.disabled = false;
					else
						index.disabled = true;
				}
			}
		}
		
		function popup(target)
		{
			var coa = document.getElementById('coa');
			if(coa.value == '')
			{
				alert('Please select valid Journal Schema first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa='/>"+coa.value+"&target="+target);
		}
		
		function openperiod()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select valid Organization first!');
				return;
			}
			
			url = "<c:url value='/page/popupaccountingperiodview.htm?target=period&openonly=true&organization='/>"+org.value;
			
			var date = document.getElementById('date');
			if(date && date.firstChild.value != '')
			{
				url = url+"&date="+date.firstChild.value;
			}
			
			openpopup(url);
		}
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
</script>
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
			<td width="60%">Financial Accounting > Journal Entry > Add</td>
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
						
						<h1 class="page-title">F40 - Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/journalentryview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="journalEntry_add">
							<table width="100%" border="0" cellpadding="0" cellspacing="20" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="Auto Number" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><form:input path="name" size="65"/> </td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input id="date" name="entryDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryType">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="currency">
                                            	<form:options items='${currencys}' itemLabel='symbol' itemValue='id'/>
											</form:select>
                                            &nbsp;
                                            <form:select path="exchangeType">
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td>
											<form:select id="org" path="organization" cssClass="combobox-ext">
												<option value='${journalEntry_add.organization.id}'><c:out value='${journalEntry_add.organization.firstName} ${journalEntry_add.organization.middleName} ${journalEntry_add.organization.lastName}'/></option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Chart of Account :</td>
										<td>
											<select id="coa" class="combobox-ext">
												<option value="${schema.id}">${schema.name}</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Accounting Period :</td>
										<td>
											<form:select id="period"  path="accountingPeriod" cssClass="combobox-ext" disabled='true'>
                                            	<c:if test='${not empty journalEntry_add.accountingPeriod}'>
                                                	<option value="${journalEntry_add.accountingPeriod.id}"><c:out value='${journalEntry_add.accountingPeriod.code} ${journalEntry_add.accountingPeriod.name}'/></option>
                                                </c:if>
											</form:select>
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
												<c:forEach items='${indexTypes}' var='type'>
                                                <tr>
													<td align="right">${type.name}</td>
													<td align="center">:</td>
													<td>
                                                    	<input id="hidden-id[${type.id}]" type="hidden" name="indexes" value="${type.id}"/>
                                                        <input id="text-id[${type.id}]" name="text" size="15"/>
                                                    </td>
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
													<td><input value="<fmt:formatNumber value='${debet}' groupingUsed='true'/>" type="text" id="txtBalanceDebet" size="15" disabled /></td>
													<td><input value="<fmt:formatNumber value='${credit}' groupingUsed='true'/>" type="text" id="txtBalanceCredit" size="15" disabled /></td>
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
									<th width="32%" colspan="2">Account</th>
									<th width="19%">Amount</th>
                                    <th width="25%">Type</th>
									<th width="20%">Note</th>
								</tr>
                                <c:forEach items='${journalEntry_add.details}' var='detail' varStatus='status'>
                                <tr>
									<td width="32%" colspan="2">${detail.account.code} ${detail.account.name}</td>
									<td width="19%"><fmt:formatNumber value="${detail.amount}" groupingUsed="true"/></td>
                                    <td width="25%">${detail.postingType}</td>
									<td width="20%">${detail.note}</td>
								</tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
								</table>
								</div>
						</form:form>
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