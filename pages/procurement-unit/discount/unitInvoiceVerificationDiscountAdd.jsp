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
							<a class="item-button-list" href="<c:url value='/page/unitinvoiceverificationdiscountview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="discount">
			 				<table width="100%" style="border:none" class="space">
							<tr>
								<td align="right">Name</td>
								<td>: <form:input id="name" path="name" cssClass='inputbox'/></td>
							</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Organization :</td>
									<td>:
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty discount.organization}'>
                                               	<form:option value='${discount.organization.id}' label='${discount.organization.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
							<tr>
								<td align="right">Tanggal</td>
								<td>: <input id="date" inputId="dateId" name="dateFrom" inputId="inputDate" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
							</tr>
                            <tr>
								<td align="right">Discount</td>
								<td>: <form:input id="amount" path="amount" cssClass='inputbox'/>%</td>
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
	function save()
	{
		var name = document.getElementById('name').value;
		if(name == '')
		{
			alert("Name cannot be empty !!!");
			return;
		}
		
		var date = document.getElementById('dateId').value;
		if(date == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		var amount = document.getElementById('amount').value;
		if(amount == '')
		{
			alert("Amount cannot be empty !!!");
			return;
		}
		else
		{
			if(amount <= 0)
			{
				alert("Amount must be greater than zero !!!");
				return;
			}
			if(amount.indexOf(",") >= 0)
			{
				alert("Please replace (,) with (.) !!!");
				return;
			}
		}
		
		document.addForm.action="<c:url value='/page/unitinvoiceverificationdiscountadd.htm'/>";
		document.addForm.submit();
	}
</script>