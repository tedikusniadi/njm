<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/accountingperiodadd.htm" method="post" modelAttribute="accountingPeriod">
		<table style="border:none">
		<tr>
			<td width="150"><div align="right">Period ID :</div></td>
			<td width="378"><form:input path="code" size="10"/></td>
			<tr>
				<td><div align="right">Period Name :</div></td>
				<td><form:input path="name" size="50"/></td>
			</tr>
            <tr>
				<td><div align="right">Level :</div></td>
				<td>
					<form:select path="level">
						<form:option value="GROUP">GROUP</form:option>
						<form:option value="CHILD">CHILD</form:option>
					</form:select>
				</td>
			</tr>
			<c:if test="${not empty accountingPeriod.parent}">
			<tr>
				<td><div align="right">Parent :</div></td>
				<td>
					<select class="combobox-ext">
						<option selected>${accountingPeriod.parent.name}</option>
					</select>
				</td>
			</tr>
			</c:if>
			<tr>
				<td><div align="right">Starting Date :</div></td>
				<td><input name="startDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/></td>
			</tr>
			<tr>
				<td><div align="right">Ending Date :</div></td>
				<td><input name="endDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
			</tr>
			<tr>
				<td><div align="right">Status :</div></td>
				<td>
					<form:select path="status">
						<form:option value="FUTURE">FUTURE</form:option>
                        <form:option value="OPEN">OPEN</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Organization :</div></td>
				<td>
					<form:select id="org" path="organization" cssClass="combobox-ext">
					</form:select>
					&nbsp;
					<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
				</td>
			</tr>
			<tr>
				<td><div align="right">Note :</div></td>
				<td><form:textarea path="note" cols="50" rows="6"/> </td>
			</tr>
			</table>
	</form:form>
</div>