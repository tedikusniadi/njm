<%@ include file="/common/tld-common.jsp"%>
<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/organizationstructureincumbentadd.htm" method="post" modelAttribute="structure_edit">
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
				<td><div align="right">Start Date :</div></td>
				<td>
					<input id="positionStartDate" name="positionStartDate" value="${today}" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/>
					<!-- To
					<input readonly="readonly" name="endDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /> -->
				</td>
			</tr>
			<tr>
				<td><div align="right">Incumbent :</div></td>
				<td>
					<form:select id="personnel" path="personnelManagement" class="combobox-ext">
					</form:select>
					<%-- <input id="pastIncumbent" name="pastIncumbent" value="${structure_edit.personnelManagement.id}" hidden="hidden"/> --%>
					<img src="../assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppersonnelmanagementview.htm?target=personnel'/>');" style="CURSOR:pointer;" title="Personnel Management"/>
				</td>
			</tr>
			</table>
	</form:form>
</div>