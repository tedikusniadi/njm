<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-delete" href="javascript:perioddelete(${accountingPeriod.id})"><span>Delete</span></a>
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/accountingperiodpreadd.htm?parent=${accountingPeriod.id}');"><span>New Child</span></a>
	<c:if test="${accountingPeriod.level == 'CHILD' and accountingPeriod.status == 'OPEN'}">
		<a class="item-button-closing-accounting-period" href="javascript:periodclose('<c:url value='/page/accountingperiodpreclose.htm?id=${accountingPeriod.id}'/>','${accountingPeriod.id}');"><span>Pre Close</span></a>
	</c:if>
	<c:if test="${accountingPeriod.level == 'CHILD' and accountingPeriod.status == 'PRECLOSE'}">
		<a class="item-button-closing-accounting-period" href="javascript:periodclose('<c:url value='/page/accountingperiodclose.htm?id=${accountingPeriod.id}'/>','${accountingPeriod.id}');"><span>Close</span></a>
	</c:if>
	<c:if test="${accountingPeriod.level == 'CHILD' and (accountingPeriod.status == 'CLOSED' or accountingPeriod.status == 'PRECLOSE')}">
		<a class="item-button-open-accounting-period" href="<c:url value='/page/accountingperiodopen.htm?id=${accountingPeriod.id}'/>"><span>Open</span></a>
	</c:if>
</div>

<div class="main-box" style="height:370px">
	<form:form id="editForm" name="editForm" action="page/accountingperiodedit.htm" method="post" modelAttribute="accountingPeriod">
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
					<form:select path="parent" cssClass="combobox-ext">
						<option>${accountingPeriod.parent.name}</option>
					</form:select>
				</td>
			</tr>
			</c:if>
			<tr>
				<td><div align="right">Starting Date :</div></td>
				<td><input name="startDate" value="<fmt:formatDate value='${accountingPeriod.startDate}' pattern='MM/dd/yyyy'/>" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/></td>
			</tr>
			<tr>
				<td><div align="right">Ending Date :</div></td>
				<td><input name="endDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" value="<fmt:formatDate value='${accountingPeriod.endDate}' pattern='MM/dd/yyyy'/>" containerToggle="explode" containerToggleDuration="300" /></td>
			</tr>
			<tr>
				<td><div align="right">Status :</div></td>
				<td>
					<form:select path="status" disabled="true">
						<form:option value="OPEN">OPEN</form:option>
                        <form:option value="PRECLOSE">PRE CLOSED</form:option>
						<form:option value="CLOSED">CLOSED</form:option>
						<form:option value="FUTURE">FUTURE</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Organization :</div></td>
				<td>
					<select path="organization" class="combobox-ext">
						<option>${accountingPeriod.organization.firstName} ${accountingPeriod.organization.middleName} ${accountingPeriod.organization.lastName}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Note :</div></td>
				<td><form:textarea path="note" cols="50" rows="6"/> </td>
			</tr>
			</table>
	</form:form>
</div>