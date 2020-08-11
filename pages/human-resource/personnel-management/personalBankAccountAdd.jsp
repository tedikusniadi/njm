<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
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
							<a class="item-button-back" href="<c:url value='/page/personnelmanagementpreedit.htm?id=${account_add.personnelManagement.id}'/>"><span>Back</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="account_add">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Employee ID</td>
                                    <td width="1%" align="center">:</td>
									<td width="65%"><input disabled="disabled" size='25' class="input-disabled" value="${account_add.personnelManagement.code}"/></td>
 								</tr>
 								<tr>
 									<td align="right">Employee Name</td>
                                    <td width="1%" align="center">:</td>
									<td><input disabled="disabled" size='25' class="input-disabled" value="${account_add.personnelManagement.name}"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Account No</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="accountNumber" path="accountNumber" size="35"/></td>
 								</tr>
 								<tr>
 									<td align="right">Account Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="accountName" path="accountName" size="35"/></td>
 								</tr>
 								<tr>
 									<td align="right">Bank Name</td>
                                    <td width="1%" align="center">:</td>
									<td>
										<form:select id="bank" path="bank" class="combobox">
			  					  		<c:forEach items="${banks}" var="bank">
											<form:option value="${bank.id}" label="${bank.name}"/>
										</c:forEach>
										</form:select>
									</td>
 								</tr>
 								<tr>
 									<td align="right">Bank Branch</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="bankBranch" path="bankBranch" size="35"/></td>
 								</tr>
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
<script type="text/javascript">

	function validation()
	{
		if($("#accountNumber").val() == '')
		{
			alert('Account No cannot be empty !!!');
			return;
		}
		
		if($("#accountName").val() == '')
		{
			alert('Account Name cannot be empty !!!');
			return;
		}
		
		if($("#bankBranch").val() == '')
		{
			alert('Bank Branch cannot be empty !!!');
			return;
		}
		
		return true;
	}

	$(function()
	{
		$('.item-button-save').click(function()
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/personalbankaccountadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Bank Account data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/personnelmanagementpreedit.htm?id='/>"+json.id;
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
</script>
</html>