<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>

<div class="main-box" style="height:370px;overflow:scroll">
	<form:form id="addForm" name="addForm" action="page/glaccountadd.htm" method="post" modelAttribute="account">
		<table style="border:none">
		<tr>
			<td width="150"><div align="right">GL Account ID :</div></td>
			<td width="378"><form:input path="code" size="10"/></td>
			<tr>
				<td><div align="right">GL Account Name :</div></td>
				<td><form:input path="name" size="50"/></td>
			</tr>
            <tr>
				<td><div align="right">GL Account Alias :</div></td>
				<td><form:input path="alias" size="50"/></td>
			</tr>
			<tr>
				<td><div align="right">GL Account Cash Type :</div></td>
				<td>
					<form:select path="cashType">
						<form:option value="CASH">CASH</form:option>
						<form:option value="NONCASH">NON CASH</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">GL Account Closing Type :</div></td>
				<td>
					<form:select path="closingType">
						<form:option value="TEMPORARY">TEMPORARY</form:option>
						<form:option value="PERMANENT">PERMANENT</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">GL Account Posting Type :</div></td>
				<td>
					<form:select path="postingType">
						<form:option value="DEBET">DEBET</form:option>
						<form:option value="CREDIT">CREDIT</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">GL Account Level :</div></td>
				<td>
					<form:select path="level">
						<form:option value="ACCOUNTGROUP">ACCOUNT GROUP</form:option>
						<form:option value="ACCOUNT">ACCOUNT</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">GL Account Type :</div></td>
				<td>
					<form:select path="accountType">
						<form:options items="${types}" itemLabel="name" itemValue="id"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">GL Account Parent :</div></td>
				<td>
					<select class="combobox-ext">
						<option>${account.parent.code} ${account.parent.name}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Chart of Account :</div></td>
				<td>
					<select class="combobox-ext">
						<option>${account.coa.code} ${account.coa.name}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Null Warning :</div></td>
				<td>
					<form:radiobutton value="true" path="warning" label="Yes"/>
					<form:radiobutton value="false" path="warning" label="No"/>
				</td>
			</tr>
			<tr>
				<td><div align="right">Note :</div></td>
				<td><form:textarea path="note" cols="50" rows="6"/> </td>
			</tr>
			</table>
	</form:form>
</div>