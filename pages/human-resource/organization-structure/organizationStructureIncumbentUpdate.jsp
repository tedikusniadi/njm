<%@ include file="/common/tld-common.jsp"%>
<div class="toolbar">
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="editForm" name="editForm" action="page/organizationstructureincumbentedit.htm" method="post" modelAttribute="structure_edit">
		<table style="border:none">
			<tr>
				<td width="150"><div align="right">Position ID :</div></td>
				<td width="378"><form:input path="code" size="10" readonly="true" class="input-disabled"/></td>
			</tr>
			<tr>
				<td><div align="right">Position Name :</div></td>
				<td><form:input path="name" size="50" readonly="true" class="input-disabled"/></td>
			</tr>
			<c:if test="${not empty structure_add.parent and structure_add.parent.level eq 'CHILD'}">
			<tr>
				<td><div align="right">Report To :</div></td>
				<td>
					<select class="combobox-ext">
						<option selected>${structure_add.parent.name}</option>
					</select>
				</td>
			</tr>
			</c:if>
			<tr>
				<td><div align="right">Incumbent :</div></td>
				<td>
					<select id="pastIncumbent" name="pastIncumbent" class="combobox-ext">
						<option value="${structure_edit.personnelManagement.id}">${structure_edit.personnelManagement.name}</option>
					<select>
				</td>
			</tr>
			<tr>
				<td><div align="right">End Date :</div></td>
				<td>
					<input id="endDate" name="endDate" value="${today}" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" />
				</td>
			</tr>
			</table>
	</form:form>
</div>