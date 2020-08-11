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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/partyedit.htm'/>";
			document.editForm.submit();
		}
	</script>
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
							<a class="item-button-list" href="<c:url value='/page/partyview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" href="javascript:save();"><span><spring:message code='save'/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="party_edit" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="27%" align="right">Party Code</td>
                                    <td width="1%" align="center">:</td>
								  	<td width="71%"><form:input path="code" cssClass="inputbox" disabled="true"/></td>
								  	<td width="2%"><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Party First Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="firstName" size='45'/></td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Middle Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="middleName" size='45'/></td>
									<td><form:errors path="middleName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Last Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="lastName" size='45'/></td>
									<td><form:errors path="lastName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Tax Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="taxCode" cssClass="inputbox" /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr>
                                <tr>
								<tr>
 									<td align="right">Party Other Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="otherCode" cssClass="inputbox" /></td>
									<td><form:errors path="otherCode"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Legend</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="legend" size='30'/></td>
									<td><form:errors path="legend"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Salutation</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="salutation"/></td>
									<td><form:errors path="salutation"/></td>
	 							</tr>
	 							<tr>
	 							  <td align="right">NPPKP</td>
	 							  <td align="center">:</td>
	 							  <td><form:input path="nppkp" cssClass="inputbox" /></td>
	 							  <td><form:errors path="nppkp"/></td>
	 							  </tr>
	 							<tr>
 									<td align="right">Party PKP Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="pkpDate" name="pkpDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="${party_edit.pkpDate}" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
								<tr>
 									<td align="right">Birth/Startup Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="birthDate" name="dateOfBirth" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" value="${party_edit.dateOfBirth}" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<c:if test="${party_edit.type == 'group'}">
	                            <tr>
									<c:set var="since" value=""/>
	                                <td align="right">Aktif</td>
	                                <td width="1%" align="center">:</td>
	                                <c:forEach items="${party_edit.partyRoles}" var="role" varStatus="status">
									<c:if test="${role.partyRoleType.name == 'LEASING'}">
									<c:set var="since" value="${role.fromDate}"/>
	                                <td>
	                            		<form:radiobutton path='partyRoles[${status.count-1}].active' value='true' label='Ya'/>
	                            		<form:radiobutton path='partyRoles[${status.count-1}].active' value='false' label='Tidak'/>
	                               	</td>
	                                </c:if>
									</c:forEach>
	                           	</tr>
	                           	</c:if>
                                <tr>
 									<td align="right">Alamat</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="fixAddress" size="57"/></td>
									<td><form:errors path="fixAddress"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Telp</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="fixPhone"/></td>
									<td><form:errors path="fixPhone"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Fax</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="fixFax"/></td>
									<td><form:errors path="fixFax"/></td>
	 							</tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Admin Head</td>
                                    <td width="1%" align="center">:</td>
                                    <td>
                                        <form:select path="adminHead" id="adh" class="combobox-ext">
                                        	<c:if test='${not empty party_edit.adminHead}'>
                                               	<form:option value='${party_edit.adminHead.id}' label='${party_edit.adminHead.name}'/>
                                            </c:if>
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppartyview.htm?target=adh&partyRole=8&type=person'/>');" style="CURSOR:pointer;" title="Admin Head" />
                                    </td>
                                </tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Kepala Cabang</td>
                                    <td width="1%" align="center">:</td>
                                    <td>
                                        <form:select path="headOffice" id="ho" class="combobox-ext">
                                        	<c:if test='${not empty party_edit.headOffice}'>
                                               	<form:option value='${party_edit.headOffice.id}' label='${party_edit.headOffice.name}'/>
                                            </c:if>
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppartyview.htm?target=ho&partyRole=8&type=person'/>');" style="CURSOR:pointer;" title="Kepala Cabang" />
                                    </td>
                                </tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td>
                                    	<input type="file" name="file" src="${party.picture}"/>&nbsp;
                                    	<c:if test='${party.picture != null}'>
                                        	<a href="javascript:openpopup('<c:url value='/page/partyshowimage.htm?id=${party_edit.id}'/>');">Show</a>
                                        </c:if>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
 									<td align="right">Note</td>
                                    <td width="1%" align="center">:</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
 								</tr>
 								</table>
 								<br/>
 								<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
									<div id="Classification" dojoType="ContentPane" label="Classification" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyclassificationpreadd.htm?party=${party_edit.id}'/>"><span>New Classification</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th><div style="width:10px"></div></th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Type</th>
										</tr>
										<c:forEach items="${party_edit.classifications}" var="classification">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/partyclassificationpreedit.htm?id=${classification.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/partyclassificationdelete.htm?id=${classification.id}&party=${classification.party.id}'/>');" title="Del"><span>Del</span></a>
											</td>
											<td><fmt:formatDate value="${classification.fromDate}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${classification.toDate}" pattern="dd-MM-yyyy"/></td>
											<td>${classification.type.name}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
									</div>
									<div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/postaladdresspreadd.htm?party=${party_edit.id}'/>"><span>New Address</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="7%"><div style="width:10px"></div></th>
								  	  	  	<th width="37%">Address</th>
								  	  	  	<th width="41%">Type</th>
									  	  	<th width="8%">Status</th>
                                            <th width="7%">Default</th>
										</tr>
										<c:forEach items="${party_edit.postalAddresses}" var="postal">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/postaladdresspreedit.htm?id=${postal.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/postaladdressdelete.htm?id=${postal.id}&party=${postal.party.id}'/>');" title="Del"><span>Del</span></a>
											</td>
											<td>${postal.address}</td>
											<td>
                                            	<c:forEach items='${postal.addressTypes}' var='type'>
                                                	<c:if test='${type.enabled}'>
                                                    	${type.type},
                                                    </c:if>
                                                </c:forEach>
                                            </td>
											<td>
												<c:if test='${postal.enabled}'>Active</c:if>
												<c:if test='${!postal.enabled}'>Inactive</c:if>
											</td>
                                            <td>
												<c:if test='${postal.selected}'>Yes</c:if>
												<c:if test='${!postal.selected}'>No</c:if>
											</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
                                	<div id="contact" dojoType="ContentPane" label="Contact Mechanism" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/contactmechanismpreadd.htm?party=${party_edit.id}&from=party'/>"><span>New Contact</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th><div style="width:10px"></div></th>
											<th>Contact</th>
											<th>Type</th>
											<th>Status</th>
                                            <th>Note</th>
										</tr>
										<c:forEach items="${party_edit.contactMechanisms}" var="contact">
										<tr>
											<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/contactmechanismpreedit.htm?id=${contact.id}&from=party'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/contactmechanismdelete.htm?id=${contact.id}&party=${contact.party.id}&from=party'/>');" title="Del"><span>Del</span></a>
											</td>
											<td>${contact.contact}</td>
											<td>${contact.contactMechanismType}</td>
											<td>
												<c:if test='${contact.active}'>Active</c:if>
												<c:if test='${!contact.active}'>Inactive</c:if>
											</td>
                                            <td>${contact.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
									<div id="role" dojoType="ContentPane" label="Party Role" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyrolepreadd.htm?party=${party_edit.id}'/>"><span>New Role</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="4%"><div style="width:10px"></div></th>
									  	  	<th width="12%">From</th>
									  	  	<th width="12%">To</th>
									  	  	<th width="52%">Role Name</th>
                                            <th width="20%">Status</th>
										</tr>
										<c:forEach items="${party_edit.partyRoles}" var="role">
										<tr>
											<td class="tools">
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/partyroledelete.htm?id=${role.id}'/>');" title="Del"><span>Del</span></a>
											</td>
											<td><fmt:formatDate value="${role.fromDate}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${role.toDate}" pattern="dd-MM-yyyy"/></td>
											<td>${role.partyRoleType.name}</td>
                                            <td>
                                            	<c:if test='${role.active}'>
                                                	Active
                                                </c:if>
                                                <c:if test='${!role.active}'>
                                                	Inactive
                                                </c:if>
                                            </td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
									<div id="structure" dojoType="ContentPane" label="Relationship Information" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partyrelationshippreadd.htm?party=${party_edit.id}'/>"><span>New Relationship</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="4%"><div style="width:10px"></div></th>
                                            <th width="28%">Type</th>
									  	  	<th width="22%">From</th>
									  	  	<th width="23%">To</th>
									  	  	<th width="13%">From Role</th>
									  	  	<th width="14%">To Role</th>
										</tr>
										<c:forEach items="${party_edit.partyRoles}" var="role">
										<c:forEach items="${role.relationfroms}" var="relation">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.delete and relation.deleteable}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/partyrelationshipdelete.htm?id=${relation.id}'/>');" title="Del"><span>Del</span></a>
                                                </c:if>
											</td>
                                            <td>${relation.relationshipType.name}</td>
											<td>${relation.fromRole.party.firstName} ${relation.fromRole.party.middleName} ${relation.fromRole.party.lastName}</td>
											<td>${relation.toRole.party.firstName} ${relation.toRole.party.middleName} ${relation.toRole.party.lastName}</td>
											<td>${relation.fromRole.partyRoleType.name}</td>
											<td>${relation.toRole.partyRoleType.name}</td>
										</tr>
										</c:forEach>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="facility" dojoType="ContentPane" label="Facility" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/facilityrolepreadd.htm?id=${party_edit.id}'/>"><span>New Facility</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                                       	  	<th width="7%"><div style="width:10px"></div></th>
											<th width="29%">Name</th>
								  	  	 	<th width="17%">Type</th>
								  	  	 	<th width="47%">Note</th>
										</tr>
										<c:forEach items="${party_edit.facilitys}" var="fac">
										<tr>
                                        	<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/facilityrolepreedit.htm?id=${fac.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/facilityroledelete.htm?id=${fac.id}'/>');" title="Del"><span>Del</span></a>
											</td>
											<td>${fac.facility.name}</td>
											<td>${fac.facilityRoleType.name}</td>
											<td>${fac.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="account" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partybankaccountpreadd.htm?id=${party_edit.id}'/>"><span>New Account</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                               	  	  	  	<th width="4%" height="21"><div style="width:10px"></div></th>
										  	<th width="16%">Account No</th>
                                            <th width="20%">Account Name</th>
                                            <th width="23%">Cash/Bank Name</th>
                                            <th width="24%">Cash/Bank Branch</th>
								  	  	  	<th width="13%">Status</th>
										</tr>
										<c:forEach items="${party_edit.accounts}" var="account">
										<tr>
                                        	<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/partybankaccountpreedit.htm?id=${account.id}'/>" title="Edit"><span>Edit</span></a>
											</td>
											<td><c:out value='${account.bankAccount.accountNo}'/></td>
                                            <td><c:out value='${account.bankAccount.accountName}'/></td>
                                            <td><c:out value='${account.bankAccount.bankName}'/></td>
											<td><c:out value='${account.bankAccount.bankBranch}'/></td>
											<td>
                                            	<c:if test='${account.enabled}'>Active</c:if>
                                                <c:if test='${!account.enabled}'>Inactive</c:if>
                                                <c:if test='${account.used}'>[Default]</c:if>
                                            </td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
								</div>
 							</form:form>
						</div>
							    <div class="info">Created by : <c:out value='${party_edit.createdBy.firstName} ${party_edit.createdBy.middleName} ${party_edit.createdBy.lastName}'/> (<fmt:formatDate value='${party_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${party_edit.updatedBy.firstName} ${party_edit.updatedBy.middleName} ${party_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${party_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>

</div>



</body>
<%@ include file="/common/dialog.jsp"%>
</html>