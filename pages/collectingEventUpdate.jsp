<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Billing Collecting Event >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/billingcollectingeventedit.htm'/>";
			document.editForm.submit();
		}
				
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Account Receivable > Billing > Collecting Event > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F11 - Billing</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingpreedit.htm?id=${event.billing.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="event">
								<table width="100%" style="border:none">
								<tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="25" value="<fmt:formatDate value='${event.date}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled/></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Event :</td>
								  	<td width="80%"><form:input path="event" size='50' disabled='true' cssClass='input-disabled'/></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Reference :</td>
								  	<td width="80%"><form:input path="reference" size='50' disabled='true' cssClass='input-disabled'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Status :</td>
									<td>
                                    	<form:radiobutton path='done' value='true' label='Done'/>
                                        <form:radiobutton path='done' value='false' label='Ongoing'/>
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

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>