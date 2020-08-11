<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Bank/Cash Account >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">	
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">Financial Accounting > Accounting Setting > Bank/Cash Account > Add</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F21 - Bank/Cash Account</h1>
						
						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/bankaccountview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="account_add">
			 				<table width="100%" style="border:none" class="space">
							<tr>
								<td width="29%" align="right">ID </td>
				  		  	  	<td width="1%">:</td>
					 		  	<td width="70%"><form:input path="code" maxlength="30" cssClass="inputbox"/></td>
							</tr>
							<tr>
								<td align="right">Bank/Cash Name </td>
								<td>:</td>
								<td><form:input path="bankName" maxlength="50" size='50'/></td>
							</tr>
                            <tr>
								<td align="right">Bank Branch </td>
								<td>:</td>
								<td><form:input path="bankBranch" maxlength="50" size='50'/></td>
							</tr>
							<tr>
								<td align="right">Bank/Cash Account Name </td>
								<td>:</td>
								<td><form:input path="accountName" maxlength="50" size='50'/></td>
							</tr>
                            <tr>
								<td width="29%" align="right">Bank/Cash Account No </td>
				  				<td width="1%">:</td>
				  				<td width="70%"><form:input path="accountNo" maxlength="50" cssClass="inputbox"/></td>
							</tr>
                            <tr>
								<td width="29%" align="right">Account Type </td>
				  				<td width="1%">:</td>
				  				<td width="70%">
                                	<form:select path='accountType'>
                                    	<form:option value='CASH' label='CASH'/>
                                        <form:option value='BANK' label='BANK'/>
                                    </form:select>
                                </td>
							</tr>
                            <tr>
                                <td align="right">Accounting Schema </td>
                                <td>:</td>
                                <td>
                                    <form:select id="coa" path='chartOfAccount' cssClass="combobox-ext" disabled='true'>
                                    	<form:option value='${account_add.chartOfAccount.id}' label='${account_add.chartOfAccount.code} ${account_add.chartOfAccount.name}'/>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                            	<td align="right">Bank/Cash GL Account </td>
								<td>:</td>
                                <td>
									<form:select id="account" path="account" cssClass="combobox-ext">
									</form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:popup();" style="CURSOR:pointer;" title="GL Account" />
						  		</td>
                            </tr>
                            <tr>
                            	<td align="right">Bank Charges GL Account </td>
								<td>:</td>
                                <td>
									<form:select id="chargeAccount" path="chargeAccount" cssClass="combobox-ext">
									</form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:popupcharges();" style="CURSOR:pointer;" title="GL Account" />
						  		</td>
                            </tr>
                            <tr>
								<td align="right">Bank/Cash Account Holder </td>
								<td>:</td>
                                <td>
                                	<form:select id='holder' path="holder" cssClass="combobox-ext">
                                    	<c:if test='${not empty account_add.holder}'>
                                            <form:option value='${holder.organization.id}' label='${holder.organization.firstName} ${holder.organization.lastName} ${holder.organization.middleName}' />
                                        </c:if>
									</form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="showholder();" style="CURSOR:pointer;" title="Account Holder" />
                                </td>
							</tr>
							<tr>
						  		<td align="right">Currency </td>
						  		<td>:</td>
						  		<td>
						  			<form:select path="currency">
										<form:options items="${currencys}" itemLabel="symbol" itemValue="id"/>
									</form:select>
                          		</td>
					  		</tr>
                            <tr>
                            	<td align="right">Note</td>
						  		<td>:</td>
						  		<td><form:textarea cols="50" rows="6" path="note" /></td>
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
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	function save()
	{
		document.addForm.action="<c:url value='/page/bankaccountadd.htm'/>";
		document.addForm.submit();
	}
	
	function popup()
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?target=account&coa='/>"+coa.value);
	}
	
	function popupcharges()
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?target=chargeAccount&coa='/>"+coa.value);
	}
	
	function showholder()
	{
		openpopup("<c:url value='/page/popupaccountholderview.htm?target=holder'/>");
	}
</script>