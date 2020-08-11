<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:400px;overflow:auto">	
	<form:form id="addForm" name="addForm" action="page/fixedAssetGroupAdd.htm" method="post" modelAttribute="fixedAssetGroup">
		<table style="border:none" width="100%">
		<tr>
			<td width="26%"><div align="right">Category Name</div></td>
            <td width="1%">:</td>
	  	  <td><form:input path="name" cssClass="inputbox" maxlength="50"/></td>
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
				<form:select id="org" path="organization" cssClass="combobox-ext">
				</form:select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
		  </td>
            <td></td>
		</tr>
		<tr>
			<td><div align="right">Accounting Schema </div></td>
            <td width="1%">:</td>
			<td>
            	<input type="hidden" id="coax" />
				<form:select id="accountingSchema" path="accountingSchema" cssClass="combobox-ext">
				</form:select>
                &nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupaccountingschemaview.htm?target=accountingSchema&organization='/>'+document.getElementById('org').value);" style="CURSOR:pointer;" title="Schema" />
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