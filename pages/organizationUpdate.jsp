<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Party >> Edit</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.editForm.action = "<c:url value='/page/organizationUpdate.htm'/>";
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
			<td width="60%">Company Administration > Party > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">A01 - Party</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/organizationView.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="organization">
 								<table border="0" cellpadding="0" cellspacing="0">
 								<tr>
 									<td><div class="form-label">Party Code :</div></td>
									<td><form:input path="code" cssClass="inputbox" /></td>
									<td><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td><div class="form-label">Party First Name :</div></td>
									<td><form:input path="firstName" cssClass="inputbox" /></td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td><div class="form-label">Party Middle Name :</div></td>
									<td><form:input path="middleName" cssClass="inputbox" /></td>
									<td><form:errors path="middleName"/></td>
	 							</tr>
                                <tr>
 									<td><div class="form-label">Party Last Name :</div></td>
									<td><form:input path="lastName" cssClass="inputbox" /></td>
									<td><form:errors path="lastName"/></td>
	 							</tr>
                                <tr>
 									<td><div class="form-label">Party Tax Code :</div></td>
									<td><form:input path="taxCode" cssClass="inputbox" /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr>
 								<tr>
 									<td><div class="form-label">Note :</div></td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
 								</tr> 
 								</table>
 								<br/>
 								<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
									<div id="Classification" dojoType="ContentPane" label="Classification" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyclassificationpreadd.htm?party=${organization.id}'/>"><span>New Address</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0">
										<tr>
											<th><div style="width:10px"></div></th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Type</th>
										</tr>
										<c:forEach items="${organization.classifications}" var="classification">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/partyclassificationpreedit.htm?id=${classification.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="<c:url value='/page/partyclassificationdelete.htm?id=${classification.id}&party=${classification.party.id}'/>" title="Del"><span>Del</span></a>
											</td>
											<td><fmt:formatDate value="${classification.fromDate}" pattern="dd-MM-yyyy"/></td> 
											<td><fmt:formatDate value="${classification.toDate}" pattern="dd-MM-yyyy"/></td>          
											<td>${classification.type}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
									</div>
									<div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/postaladdresspreadd.htm?party=${organization.id}'/>"><span>New Address</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0">
										<tr>
											<th><div style="width:10px"></div></th>
											<th>Address</th>
											<th>Type</th>
											<th>Status</th>
										</tr>
										<c:forEach items="${organization.postalAddresses}" var="postal">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/postaladdresspreedit.htm?id=${postal.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="<c:url value='/page/postaladdressdelete.htm?id=${postal.id}&party=${postal.party.id}'/>" title="Del"><span>Del</span></a>
											</td>
											<td>${postal.address}</td> 
											<td>${postal.addressType}</td>          
											<td>
												<c:if test='${postal.active}'>Active</c:if>
												<c:if test='${!postal.active}'>Inactive</c:if>
											</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
									</div>
                                	<div id="contact" dojoType="ContentPane" label="Contact Mechanism" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/contactmechanismpreadd.htm?party=${organization.id}'/>"><span>New Contact</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0">
										<tr>
											<th><div style="width:10px"></div></th>
											<th>Contact</th>
											<th>Type</th>
											<th>Status</th>
										</tr>
										<c:forEach items="${organization.contactMechanisms}" var="contact">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/contactmechanismpreedit.htm?id=${contact.id}'/>" title="Edit"><span>Edit</span></a>			
												<a class="item-button-delete" href="<c:url value='/page/contactmechanismdelete.htm?id=${contact.id}&&party=contact.party.id'/>" title="Del"><span>Del</span></a>
											</td>
											<td>${contact.contact}</td> 
											<td>${contact.contactMechanismType}</td>          
											<td>
												<c:if test='${contact.active}'>Active</c:if>
												<c:if test='${!contact.active}'>Inactive</c:if>
											</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
									</div>
									<div id="role" dojoType="ContentPane" label="Organization Role" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyrolepreadd.htm?party=${organization.id}'/>"><span>New Role</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="6%"><div style="width:10px"></div></th>
										  <th width="16%">From</th>
										  <th width="16%">To</th>
										  <th width="62%">Role Name</th>
										</tr>
										<c:forEach items="${organization.partyRoles}" var="role">
										<tr>
											<td class="tools">								
												<a class="item-button-delete" href="<c:url value='/page/partyroledelete.htm?id=${role.id}'/>" title="Del"><span>Del</span></a>
											</td>
											<td><fmt:formatDate value="${role.fromDate}" pattern="dd-MM-yyyy"/></td> 
											<td><fmt:formatDate value="${role.toDate}" pattern="dd-MM-yyyy"/></td>          
											<td>${role.partyRoleType.name}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
									</div>
									<div id="structure" dojoType="ContentPane" label="Relationship Information" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyrelationshippreadd.htm?party=${organization.id}'/>"><span>New Relationship</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="28%">Type</th>
									  	  	<th width="22%">From</th>
									  	  	<th width="23%">To</th>
									  	  	<th width="13%">From Role</th>
									  	  	<th width="14%">To Role</th>
										</tr>
										<c:forEach items="${organization.partyRoles}" var="role">
										<c:forEach items="${role.relationfroms}" var="relation">
										<tr>
											<td>${relation.relationshipType.name}</td>
											<td>${relation.fromRole.party.firstName} ${relation.fromRole.party.middleName} ${relation.fromRole.party.middleName}</td> 
											<td>${relation.toRole.party.firstName} ${relation.toRole.party.middleName} ${relation.toRole.party.lastName}</td>
											<td>${relation.fromRole.partyRoleType.name}</td> 
											<td>${relation.toRole.partyRoleType.name}</td>
										</tr>
										</c:forEach>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
								</div>
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
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>



</body>

</html>