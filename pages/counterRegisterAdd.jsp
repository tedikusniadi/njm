<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
	</style>
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
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/counterregisterview.htm'/>"><span>List</span></a>
							<div id="saveDiv" style="display:block">
								<a class="item-button-save" href="javascript:addCounterRegister();"><span>Save</span></a>
							</div>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="counterRegister">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="606">
											<table width="100%" style="border:none">
												<tr>
													<td width="25%" align="right">ID :</td>
													<td width="50%"><input type="text" name="code" id="counterCode" class="inputbox"/></td>
													<td width="25%"><div class="error" id="error-counterCode">&nbsp;</div></td>
												</tr>
												<tr>
													<td align="right">Organisasi:</td>
													<td>
														<select id="org" name="organization" class="combobox">
															<c:forEach items="${organizations}" var="organization">
																<option value="${organization.id}">${organization.name}</option>
															</c:forEach>
														</select>
													</td>
													<td><div class="error" id="error-companyfacilityId">&nbsp;</div></td>
												</tr>
		                                        <tr>
					 								<td nowrap="nowrap" align="right">Default Cash :</td>
													<td>
														<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext"></form:select>
														<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="checkTypeAccount();" style="CURSOR:pointer;" title="Cash/Bank Account" />
													</td>
					 							</tr>
		                                        <tr>
					 								<td nowrap="nowrap" align="right">Default KPB Account :</td>
													<td>
														<form:select id="glAccountKPB" path="glAccountKPB" cssClass="combobox-ext"></form:select>
														<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openGlAccount('glAccountKPB');" style="CURSOR:pointer;" title="GL Account" />
													</td>
					 							</tr>
		                                        <tr>
					 								<td nowrap="nowrap" align="right">Default Claim Account :</td>
													<td>
														<form:select id="glAccountClaim" path="glAccountClaim" cssClass="combobox-ext"></form:select>
														<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openGlAccount('glAccountClaim');" style="CURSOR:pointer;" title="GL Account" />
													</td>
					 							</tr>
		                                        <tr>
					 								<td nowrap="nowrap" align="right">Default Claim AR Account :</td>
													<td>
														<form:select id="glAccountAR" path="glAccountAR" cssClass="combobox-ext"></form:select>
														<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openGlAccount('glAccountAR');" style="CURSOR:pointer;" title="GL Account" />
													</td>
					 							</tr>
												<tr>
													<td align="right">Status :</td>
													<td>
														<input type="radio" id="counterStatus" name="status" value="true" checked /> Active
														<input type="radio" id="counterStatus" name="status" value="false" /> Not Active
													</td>
													<td></td>
												</tr>
												<tr>
												  <td align="right">Note :</td>
												  <td><textarea rows="3" cols="35" id="note" name="note" class="inputbox"></textarea></td>
												  <td>&nbsp;</td>
												</tr>
												<tr>
												  <td align="right">&nbsp;</td>
												  <td>&nbsp;</td>
												  <td>&nbsp;</td>
												</tr>
										  	</table>
										</td>
										<td width="357" align="left" valign="top"></td>
										<td width="10" style="width:10px;">&nbsp;</td>
									</tr>
								</table>
	  						</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	function addCounterRegister()
	{
		if(document.getElementById("counterCode").value == "")
		{
			alert('Counter Register Code cannot be empty!');
			return;
		}

		if(document.getElementById("org").value == "-1")
		{
			alert('Customer facility cannot be empty!');
			return;
		}

		var url = "<c:url value='/page/counterregisteradd.htm'/>";
		document.addForm.action = url;
		document.addForm.submit();
	}

	function openGlAccount(target)
	{
		openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&target='/>"+target);
	}
	
	function checkTypeAccount()
	{
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&plafon=N&organization='/>"+$("#org").val()+'&type=CASH');
	}
</script>