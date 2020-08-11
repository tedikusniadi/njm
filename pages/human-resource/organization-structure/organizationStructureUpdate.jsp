<%@ include file="/common/tld-common.jsp"%>
<div class="toolbar">
	<a class="item-button-delete" href="javascript:structureDelete(${structure_edit.id})"><span>Delete</span></a>
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/organizationstructurepreadd.htm?parent=${structure_edit.id}');"><span>New Position</span></a>
	<c:if test="${empty structure_edit.personnelManagement}">
		<a class="item-button-add-gl-child" href="javascript:displayContent('page/organizationstructureincumbentpreadd.htm?id=${structure_edit.id}');"><span>New Incumbent</span></a>
	</c:if>
	<c:if test="${not empty structure_edit.personnelManagement}">
		<a class="item-button-add-gl-child" href="javascript:displayContent('page/organizationstructureincumbentpreedit.htm?id=${structure_edit.id}');"><span>Remove Incumbent</span></a>
	</c:if>
</div>
<div class="main-box" style="height:420px">
	<form:form id="editForm" name="editForm" action="page/organizationstructureedit.htm" method="post" modelAttribute="structure_edit">
		<table style="border:none">
		<%-- <c:if test="${not empty structure_edit.personnelManagement}"> --%>
		<tr>
			<td>
				<table style="border:none" width="100%">
				<tr>
					<td valign="top" style="width: 100px;">
						<table style="border:none">
						<tr>
							<td align="left"><strong>Incumbent:</strong></td>
						</tr>
						<tr>
							<td align="center" valign="center">
							<c:if test="${not empty structure_edit.personnelManagement.picture}">
								<table style="border:solid;size: 1px;color: gray;">
								<tr>
									<td align="center" valign="center">
										<img width="110" height="140" src="<c:url value='/static/${structure_edit.personnelManagement.picture}'/>"/>
									</td>
								</tr>
								</table>
							</c:if>
							<c:if test="${empty structure_edit.personnelManagement.picture}">
								<table style="border:solid;size: 1px;color: gray;">
								<tr>
									<td align="center" valign="center">
										<img width="120" height="145" src="<c:url value='/images/no_image_available.jpeg'/>"/>
									</td>
								</tr>
								</table>
							</c:if>
							</td>
						</tr>
						<tr>
							<c:if test="${not empty structure_edit.personnelManagement}">
								<td align="center" nowrap="nowrap"><a href="<c:url value='/page/personnelmanagementpreedit.htm?id=${structure_edit.personnelManagement.id}'/>"><c:out value='${structure_edit.personnelManagement.name}'/></a></td>
							</c:if>
							<c:if test="${empty structure_edit.personnelManagement}">
								<td align="center" nowrap="nowrap"><strong><c:out value='POSITION IS AVAILABLE'/></strong></td>
							</c:if>
						</tr>
						</table>
					</td>
					<td style="width: 50px;">&nbsp;</td>
					<c:if test="${not empty structure_edit.incumbentHistories}">
					<td valign="top" style="width: 500px;">
						<table style="border:none">
						<tr>
							<td align="left"><strong>Past Incumbent:</strong></td>
						</tr>
						<tr>
							<td align="center">
								<table class="table-list">
									<tr>
										<th nowrap="nowrap" width="200">Name</th>
										<th nowrap="nowrap" width="100">Start Date</th>
										<th nowrap="nowrap" width="100">End Date</th>
									</tr>
									<c:forEach items="${structure_edit.incumbentHistories}" var="his">
										<tr>
											<td nowrap="nowrap"><a href="<c:url value='/page/personnelmanagementpreedit.htm?id=${his.personnelManagement.id}'/>"><c:out value='${his.personnelManagement.name}'/></a></td>
											<td nowrap="nowrap"><fmt:formatDate value='${his.startDate}' pattern='dd-MM-yyyy'/></td>
											<td nowrap="nowrap"><fmt:formatDate value='${his.endDate}' pattern='dd-MM-yyyy'/></td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						</table>
					</td>
					</c:if>
				</tr>
				</table>
			</td>
		</tr>
		<%-- </c:if> --%>
		<tr>
			<td>
			<table style="border:none">
				<tr>
					<td width="150"><div align="right">Position ID :</div></td>
					<td width="378"><form:input path="code" size="10"/></td>
				</tr>
				<tr>
					<td><div align="right">Position Name :</div></td>
					<td><form:input path="name" size="50"/></td>
				</tr>
	            <tr>
					<td><div align="right">Level :</div></td>
					<td>
						<form:select path="level">
							<form:option value="GROUP">Organization Structure</form:option>
							<form:option value="CHILD">Position</form:option>
						</form:select>
					</td>
				</tr>
				<c:if test="${not empty structure_edit.parent and structure_edit.parent.level eq 'CHILD'}">
				<tr>
					<td><div align="right">Report To :</div></td>
					<td>
						<form:select path="parent" cssClass="combobox-ext">
							<option>${structure_edit.parent.name}</option>
						</form:select>
					</td>
				</tr>
				</c:if>
				<c:if test="${structure_edit.level eq 'CHILD'}">
				<tr>
					<td><div align="right">Type :</div></td>
					<td>
						<form:select path="type">
							<form:option value="STRUCTURAL">Structural</form:option>
	                        <form:option value="NON_STRUCTURAL">Non Structural</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<td><div align="right">Effective Date :</div></td>
					<td>
						<input name="startDate" value="<fmt:formatDate value='${structure_edit.startDate}' pattern='MM/dd/yyyy'/>" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/>
						To
						<input name="endDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" value="<fmt:formatDate value='${structure_edit.endDate}' pattern='MM/dd/yyyy'/>" containerToggle="explode" containerToggleDuration="300" />
					</td>
				</tr>
				<tr>
					<td><div align="right">Position Status :</div></td>
					<td>
						<form:select path="active">
							<form:option value="yes">Active</form:option>
	                        <form:option value="no">Inactive</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<td><div align="right">Job Description :</div></td>
					<td><form:textarea path="jobDescription" cols="50" rows="6"/> </td>
				</tr>
				</c:if>
			</table>
			</br>
			<table width="75%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td colspan="2" align="left"><strong>Accessible Company</strong></td>
			</tr>
			<c:forEach items="${structure_edit.accessibleOrganizations}" var="organization" varStatus="status">
			<tr>
				<td width="1%" nowrap="nowrap"><form:checkbox value="true" path="accessibleOrganizations[${status.index}].enabled"/></td>
				<td>${organization.organization.name}</td>
			</tr>
			</c:forEach>
			</table>
			</td>
		</tr>
	</form:form>
</div>