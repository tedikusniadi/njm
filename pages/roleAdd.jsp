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
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
	
	<script type="text/javascript">
		function add()
		{
			if(!dojo.byId('roleId').value)
			{
				alert("Role ID cannot be emtpy!");
				return;
			}
			
			if(!dojo.byId('name').value)
			{
				alert("Role Name cannot be emtpy!");
				return;
			}
		
			document.addForm.action = "<c:url value='/page/roleadd.htm'/>";
	  		document.addForm.submit();
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
							<a class="item-button-save" href="javascript:add();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="role_add">
								<table width="100%" style="border:none" cellpadding="3">
								<tr>
									<td width="183" align="right">Role ID</td>
								  	<td width="10">:</td>
						  	  	  	<td width="669" align="left"><form:input id='roleId' path="roleId" cssClass="inputbox"/></td>
			    		  	  	  	<td width="349"><form:errors path="roleId"/></td>
								</tr>
								<tr>
									<td align="right">Role Name</td>
									<td>:</td>
									<td align="left"><form:input id='name' path="name" cssClass="inputbox"/></td>
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
								<c:forEach items="${role_add.accessibleModules}" var="module" varStatus="status">
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
                                </table>
                                <br/>
                                <table width="75%" border="0" cellpadding="0" cellspacing="0" align="center">
                                <tr>
									<td colspan="4" align="left"><strong>Accessible Company</strong></td>
								</tr>
								<c:forEach items="${role_add.organizations}" var="organization" varStatus="status">
								<tr>
						 	  	  	<td width="5%"><form:checkbox value="true" path="organizations[${status.index}].enabled"/></td>
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
	
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
