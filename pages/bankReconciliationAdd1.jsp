<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-list" href="<c:url value='/page/bankreconciliationview.htm'/>"><span><spring:message code='list'/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save();"><span><spring:message code='next'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="reconciliation_add" enctype="multipart/form-data">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Code :</td>
								  	<td width="80%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25' disabled/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Organization :</td>
									<td>
										<select id="org" name="organization">
                                             <option value='${reconciliation_add.organization.id}'>${reconciliation_add.organization.name}</option>
										</select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Organization" />
									</td>
								</tr>
                                <tr>
                                  	<td align="right">Date :</td>
                                  	<td>
                                  		<input id="date" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>" name="date" class="datepicker"/>
                                    </td>
                                </tr>
							    <tr>
									<td nowrap="nowrap" align="right">Bank Account :</td>
									<td>
										<select id="bankAccount" name="bankAccount" class="combobox-ext">
                                        </select>
                                        <img src="assets/icons/list_extensions.gif" onclick="openBankAccount()" style="CURSOR:pointer;" title="Bank Account" />
									</td>
								</tr>
                                <tr>
                                  	<td align="right">File :</td>
                                  	<td>
                                  		<input type="file" id="file" name="file"/>
                                    </td>
                                </tr>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
function openBankAccount()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Organization first!');
		return;
	}

	openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&organization='/>"+org.value);
}

function save()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Organization first !!!');
		return;
	}
	
  	if($('#date').val() == "") {
		alert('Date can not be empty !!!');
		return;
	}

	var bankAccount = document.getElementById('bankAccount');
  	if(bankAccount.value == "") {
		alert('Please select Bank Account first !!!');
		return;
	}
	document.addForm.action = "<c:url value='/page/bankreconciliationpreadd2.htm'/>";
	document.addForm.submit();
}
</script>
</body>
</html>