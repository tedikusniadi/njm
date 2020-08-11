<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Accounting Schema >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>
<!-- BEGIN OF BODY -->
<body>

	
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
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Schema > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F13 - Accounting Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/accountingschemaview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="accountingSchema_add">
							<table style="border:none" width="100%">
							<tr>
								<td width="18%" align="right">Accounting Schema ID</td>
								<td width="1%">:</td>
								<td width="25%"><form:input id="code" path="code" cssClass="inputbox" /></td>
			    				<td width="56%"><form:errors path="code" cssClass="error" /></td>
							</tr>	
							<tr>
								<td><div align="right">Accounting Schema Name</div></td>
								<td width="1%">:</td>
								<td width="25%"><form:input path="name" size="50"/></td>
			    				<td width="56%"><form:errors path="name" cssClass="error" /></td>
							</tr>
							<tr>
								<td><div align="right">Organization</div></td>
								<td width="1%">:</td>
								<td>
									<form:select id="org" path="organization" cssClass="combobox-ext">
									</form:select>
                                    &nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
								</td>							
			    				<td><form:errors path="organization" cssClass="error" /></td>
							</tr>
							<tr>
								<td align="right">Note</td>
								<td width="1%">:</td>
								<td><form:textarea path="note" cols="55" rows="6"/></td>							
			    				<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td align="right"><strong>Main Setting</strong></td>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td align="right">Chart of Account</td>
								<td width="1%">:</td>
								<td>
									<form:select id="coax" path="chartOfAccount" cssClass="combobox-ext">
										<c:forEach items="${coas}" var="coa">
											<form:option value="${coa.id}">${coa.code} ${coa.name}</form:option>
										</c:forEach>
									</form:select>
								</td>							
			    				<td><form:errors path="chartOfAccount" cssClass="error" /></td>
							</tr>
							<tr>
								<td align="right">Accounting Period</td>
								<td width="1%">:</td>
								<td>
									<form:select path="accountingPeriod" cssClass="combobox-ext">
										<c:forEach items="${periods}" var="period">
											<form:option value="${period.id}">${period.code} ${period.name}</form:option>
										</c:forEach>
									</form:select>
								</td>							
			    				<td><form:errors path="accountingPeriod" cssClass="error" /></td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
							</table>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="closing" dojoType="ContentPane" label="Closing Account Setting" class="tab-pages" refreshOnShow="true">
                                    <table>
                                    <c:forEach items="${accountingSchema_add.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'NONASSET'}">
                                    <tr>
                                        <td align="right">${closing.closingAccountType.name}</td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}">${closing.account.code} ${closing.account.name}</option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="receivAndpayable" dojoType="ContentPane" label="Receivables & Payables Account Setting" class="tab-pages" refreshOnShow="true">
                                    <table>
                                    <tr>
                                    	<td align="right"><strong>Receivables GL Account</strong></td>
                                    	<td colspan="3">&nbsp;</td>
                                    </tr>
                                    <c:forEach items="${accountingSchema_add.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'RECEIVABLES'}">
                                    <tr>
                                        <td align="right">${closing.closingAccountType.name}</td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}">${closing.account.code} ${closing.account.name}</option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    <tr><td colspan="4">&nbsp;</td></tr>
                                    <tr>
                                    	<td align="right"><strong>Payables GL Account</strong></td>
                                    	<td colspan="3">&nbsp;</td>
                                    </tr>
                                    <c:forEach items="${accountingSchema_add.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'PAYABLES'}">
                                    <tr>
                                        <td align="right">${closing.closingAccountType.name}</td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}">${closing.account.code} ${closing.account.name}</option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="mastercost" dojoType="ContentPane" label="Transport Outsource Account Setting" class="tab-pages" refreshOnShow="true">
                                    <table>
                                    <c:forEach items="${accountingSchema_add.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'TRANSPORT_OUTSOURCE'}">
                                    <tr>
                                        <td align="right">${closing.closingAccountType.name}</td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}">${closing.account.code} ${closing.account.name}</option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
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
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/AccountingSchemaDWRRemote.js'/>"></script>

<script type="text/javascript">
	
	function val(e)
	{
		
	}

	function save(e)
	{
		var _val = function(e)
		{
			if(e)
			{
				alert('Accounting Schema with code: '+_code.value+" already exist!");
				return;
			}
			
			document.addForm.action = "<c:url value='/page/accountingschemaadd.htm'/>";
			document.addForm.submit();
		}

		var _code = document.getElementById('code');

		AccountingSchemaDWRRemote.isIDExist(_code.value,_val);
	}
		
	function popup(target)
	{
		var coax = document.getElementById('coax');
		if(!coax && !coax.value)
		{
			alert('Please select valid Chart of Account first!');
			return;
		}
			
		openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa='/>"+coax.value+"&target="+target);
	}
</script>