<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/fixedAssetPrepareAdd.htm?group=${fixedAssetGroup.id}')"><span>Add Asset</span></a>
	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
</div>
<div class="main-box" style="height:400px;overflow:auto">
	<form:form id="editForm" name="editForm" method="post" modelAttribute="fixedAssetGroup">
		<table style="border:none" width="100%">
		<tr>
			<td width="26%"><div align="right">Category Name</div></td>
            <td width="1%">:</td>
	  	  <td><form:input path="name" size="57" maxlength="50"/></td>
			<td width="2%"><form:errors path="name" cssClass="error"/></td>
		</tr>						
		<tr>
			<td><div align="right">Note</div></td>
			<td width="1%">:</td>
          <td><form:textarea path="note" cols="45" rows="6"/></td>
			<td>&nbsp;</td>
		</tr>
        <tr>
			<td nowrap="nowrap" align="right">Company</td>
			<td width="1%">:</td>
			<td>
				<select class="combobox-ext">
                	<option>${fixedAssetGroup.organization.firstName} ${fixedAssetGroup.organization.middleName} ${fixedAssetGroup.organization.lastName}</option>
				</select>
		  </td>
            <td></td>
		</tr>
		<tr>
			<td><div align="right">Accounting Schema </div></td>
            <td width="1%">:</td>
			<td>
            	<input type="hidden" id="coax" value="${fixedAssetGroup.accountingSchema.chartOfAccount.id}"/>
            	<select class="combobox-ext">
                	<option>${fixedAssetGroup.accountingSchema.name}</option>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
        <tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td align="right"><strong>Closing Account Setting</strong></td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<c:forEach items="${fixedAssetGroup.closingInformations}" var="closing" varStatus="status">
		<tr>
			<td align="right">${closing.closingAccount.closingAccountType.name}</td>
			<td width="1%">:</td>
  	 	  	<td width="71%" align="left">
      			<form:select id="glaccount[${status.index}]" path="closingInformations[${status.index}].closingAccount.account" cssClass="combobox-ext">
                	<form:option value='${closing.closingAccount.account.id}'>${closing.closingAccount.account.code} ${closing.closingAccount.account.name}</form:option>
				</form:select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Account" />
			</td>							
		  <td><form:errors path="closingInformations[${status.index}].closingAccount.account" cssClass="error" /></td>
		</tr>
		</c:forEach>
		</table>
	</form:form>
</div>