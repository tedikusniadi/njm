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

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/refunddealerview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="refundDealer">
			 				<table width="100%" style="border:none" class="space">
			 				<tr>
			 					<td align="right">Date From</td>
			 					<td>:</td>
			 					<td><input inputId="dateFromId" id="dateFrom" name="dateFrom" class="datepicker" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>"/></td>
			 				</tr>
			 				<tr>
                                <td align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty refundDealer.organization}'>
                                            <form:option value='${refundDealer.organization.id}' label='${refundDealer.organization.name}' />
                                        </c:if>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                </td>
                            </tr>
							<tr>
								<td align="right">Leasing</td>
								<td>:</td>
								<td>
									<select id='leasing' name=leasing class='combobox-medium'><option value="">--Leasing--</option></select>
									<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Payment Leasing" />
								</td>
							</tr>
					  		<tr>
								<td align="right">Amount</td>
								<td>:</td>
								<td><form:input id="amount" path="amount" size="21"/></td>
							</tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->

</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	
	function openLeasing(target)
	{
		var org = document.getElementById('org').value;
		if(org == '')
		{
			alert('Please select Company first !!!');
			return;
		}
		openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=leasing&organization='/>"+org);
	}
		
	function save()
	{
		if($("#dateFromId").val() == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if($("#leasing").val() == '')
		{
			alert('Please select Leasing first !!!');
			return;
		}
		
		if($("#amount").val() == '' || $("#amount").val() < 0)
		{
			alert("Amount cannot be empty and must be greater than zero !!!");
			return;
		} 
		
		document.addForm.action="<c:url value='/page/refunddealeradd.htm'/>";
		document.addForm.submit();
	}
</script>