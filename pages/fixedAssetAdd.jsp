<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
	<a class="item-button-add-acknowledgement" href="javascript:openpopopup(${fixedAsset_add.fixedAssetGroup.organization.id})"><span>From Verification</span></a></div>
<div class="main-box" style="height:402px;overflow:auto">	
	<form:form id="addForm" name="addForm" action="page/fixedAssetAdd.htm" method="post" modelAttribute="fixedAsset_add">
		<table border="0" width="697">
		<tr>
			<td width="175" align="right">ID : </td>
			<td width="242"><form:input path="code" maxlength="50" cssClass="inputbox"/></td>
			<td width="266"><form:errors path="code" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Name : </td>
			<td><form:input path="name" maxlength="100" cssClass="inputbox"/></td>
			<td><form:errors path="name" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Fixed Asset Group : </td>
			<td><input type="text" disabled value="${fixedAsset_add.fixedAssetGroup.name}" class="inputbox"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">Aquisition Date : </td>
			<td><input id="acquisitionDate" name="acquisitionDate" saveformat="dd-MM-yyyy" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
			<td><form:errors path="acquisitionDate" cssClass="error"/></td>
		</tr>
        <tr>
			<td align="right">Currency : </td>
			<td>
            	<form:select id='currency' path='currency'>
                	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                </form:select>
                &nbsp;
                <form:select path="exchangeType">
                    <form:option value='SPOT'>SPOT</form:option>
                    <form:option value='MIDDLE'>MIDDLE</form:option>
                    <form:option value='TAX'>TAX</form:option>
                </form:select>
            </td>
			<td><form:errors path="currency" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Aquisition Value : </td>
			<td><form:input id='acquisitionValue' path="acquisitionValue" cssClass="inputbox"/></td>
			<td><form:errors path="acquisitionValue" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Salvage Value : </td>
			<td><form:input path="salvageValue" cssClass="inputbox"/></td>
			<td><form:errors path="salvageValue" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Note : </td>
			<td><form:textarea path="note" cols="55" rows="5" cssClass="inputbox"/></td>
			<td><form:errors path="note" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Depreciation Method : </td>
			<td>
				<form:select path="depreciationMethod" >
					<form:option onclick="activate(0);" value="NO_DEPRECIATION" label="NO DEPRECIATION"/>
					<form:option onclick="activate(1)" value="STRAIGHT_LINE" label="STRAIGHT LINE"/>
					<form:option onclick="activate(2)" value="DECLINING_BALANCE" label="DECLINING BALANCE"/>
				</form:select>
			</td>
			<td><form:errors path="depreciationMethod" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Useful Life (Period) : </td>
			<td><form:input id="usefulLife" path="usefulLife" cssClass="inputbox"/></td>
			<td><form:errors path="usefulLife" cssClass="error"/></td>
		</tr>
		<tr>
			<td align="right">Declining Balance Rate (%) : </td>
			<td><form:input id="decliningBalanceRate" path="decliningBalanceRate" cssClass="input-disabled" disabled="true"/></td>
			<td><form:errors path="decliningBalanceRate" cssClass="error"/></td>
		</tr>
		<input type="hidden" name="preasset"/>
        </table>
	</form:form>
</div>