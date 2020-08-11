<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Role >> Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

	<script type="text/javascript">
		function edit()
		{
			document.editForm.action = "<c:url value='/page/roleedit.htm'/>";
	  		document.editForm.submit();
		}
		
		function copy()
		{
			document.editForm.action = "<c:url value='/page/rolepreaddcopy.htm?id=${role_edit.id}'/>";
	  		document.editForm.submit();
		}
	</script>


</head>

<body>

	<%@ include file="/common/sirius-header.jsp"%>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Tools > User Management > Role > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">T11 - User Role</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/roleview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:edit();"><span>Save</span></a>
							<a class="item-button-copy" href="javascript:copy();"><span>Copy</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="editForm" method="post" modelAttribute="role_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="162" align="right">Role ID</td>
								  	<td width="10">:</td>
							  	  	<td width="345" align="left"><form:input path="roleId" cssClass="inputbox"/></td>
				    		  	  	<td width="349"><form:errors path="roleId"/></td>
								</tr>
								<tr>
									<td align="right">Role Name</td>
									<td>:</td>
									<td align="left"><form:input path="name" cssClass="inputbox"/></td>
						    		<td><form:errors path="name"/></td>
								</tr>
								<tr>
									<td align="right">Note</td>
									<td>:</td>
									<td align="left"><form:textarea path="note" cols="50" rows="6"/></td>
						    		<td>&nbsp;</td>
								</tr>
								</table>
                                <br/>
                                <table width="75%" border="0" cellpadding="0" cellspacing="0" align="center">
                                <tr>
									<td colspan="4" align="left"><strong>Accessible Module</strong></td>
								</tr>
								<c:forEach items="${role_edit.accessibleModules}" var="module" varStatus="status">
								<tr>
						 	  	  	<td width="5%"><form:checkbox value="true" path="accessibleModules[${status.index}].enabled"/></td>
								  	<td width="8%">${module.module.code}</td>
								  	<td width="75%">${module.module.name}</td>
				    		  		<td width="12%">
	 				  					<form:select path="accessibleModules[${status.index}].accessType">
											<form:options items="${accessTypes}" itemValue="id" itemLabel="name"/>
										</form:select>
								  	</td>
								</tr>
								</c:forEach>
                                <c:forEach items="${role_edit.newModules}" var="module" varStatus="status">
								<tr>
						 	  	  	<td width="5%"><form:checkbox value="true" path="newModules[${status.index}].enabled"/></td>
								  	<td width="8%">${module.module.code}</td>
								  	<td width="75%">${module.module.name}</td>
				    		  		<td width="12%">
	 				  					<form:select path="newModules[${status.index}].accessType">
											<form:options items="${accessTypes}" itemValue="id" itemLabel="name"/>
										</form:select>
								  	</td>
								</tr>
								</c:forEach>
                                </table>
                                <br/>
                                <table width="75%" border="0" cellpadding="0" cellspacing="0" align="center">
                                <tr>
									<td colspan="4" align="left"><strong>Accessible Company</strong></td>
								</tr>
								<c:forEach items="${role_edit.organizations}" var="organization" varStatus="status">
								<tr>
						 	  	  	<td width="5%"><form:checkbox value="true" path="organizations[${status.index}].enabled"/></td>
								  	<td colspan="3">${organization.organization.firstName} ${organization.organization.middleName} ${organization.organization.lastName}</td>
								</tr>
								</c:forEach>
                                <c:forEach items="${role_edit.newOrganizations}" var="organization" varStatus="status">
								<tr>
						 	  	  	<td width="5%"><form:checkbox value="true" path="newOrganizations[${status.index}].enabled"/></td>
								  	<td colspan="3">${organization.organization.firstName} ${organization.organization.middleName} ${organization.organization.lastName}</td>
								</tr>
								</c:forEach>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>

</body>

</html>
