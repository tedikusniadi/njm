<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<c:if test='${!fixedAsset_edit.disposed and !readonly}'>
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
    </c:if>
    <c:if test='${access.edit and !fixedAsset_edit.disposed}'>
    <a class="item-button-save" href="javascript:displayContent('<c:url value='/page/fixedAssetpredispose.htm?id=${fixedAsset_edit.id}'/>')"><span>Dispose</span></a>
    </c:if>
</div>
<div class="main-box" style="height:402px;overflow:auto">
  <form:form id="editForm" name="editForm" action="page/fixedAssetUpdate.htm" method="post" modelAttribute="fixedAsset_edit">
    <table border="0" width="100%">
      <tr>
        <td width="175" align="right">ID : </td>
        <td width="220"><form:input path="code" maxlength="50"/></td>
        <td width="288" rowspan="5" valign="top"><c:if test='${fixedAsset_edit.depreciationMethod == "STRAIGHT_LINE" and !fixedAsset_edit.disposed}'>
          <fieldset>
            <legend><strong>Depreciation</strong></legend>
            <table border="0" width="100%">
              <tr>
                <td width="69%" align="right">Month Depreciation : </td>
                <td width="31%"><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.straightLine.month}' pattern=',##0.00' />" size="15" /></td>
              </tr>
              <tr>
                <td align="right">Accumulated Depreciation : </td>
                <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.straightLine.accumulated}' pattern=',##0.00' />" size="15" /></td>
              </tr>
              <tr>
                <td align="right">Book Value : </td>
                <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.straightLine.bookValue}' pattern=',##0.00' />" size="15" /></td>
              </tr>
            </table>
            </fieldset>
        </c:if>
            <c:if test='${fixedAsset_edit.depreciationMethod == "DECLINING_BALANCE" and !fixedAsset_edit.disposed}'>
              <fieldset>
              <legend><strong>Depreciation</strong></legend>
                <table border="0" width="100%">
                <tr>
                  <td align="right">Accumulated Depreciation : </td>
                  <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.decliningInformation.accumulated}'pattern=',##0.00' />" size="15" /></td>
                </tr>
                <tr>
                  <td align="right">Book Value : </td>
                  <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.decliningInformation.bookValue}'pattern=',##0.00' />" size="15" /></td>
                </tr>
              </table>
              </fieldset>
            </c:if>
            <c:if test='${fixedAsset_edit.disposed}'>
              <fieldset>
              <legend><strong>Dispose Information</strong></legend>
                <table border="0" width="100%">
                <tr>
                  <td align="right" colspan="2"><strong>DISPOSED</strong></td>
                </tr>
                <tr>
                  <td align="right">Dispose Amount : </td>
                  <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset_edit.disposeAmount}'pattern=',##0.00' />" size="15" /></td>
                </tr>
                <tr>
                  <td align="right">Bank/Cash Account: </td>
                  <td><c:out value='${fixedAsset_edit.bankAccount.code} - ${fixedAsset_edit.bankAccount.bankName}'/></td>
                </tr>
              </table>
              </fieldset>
            </c:if>
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right">Name : </td>
        <td><form:input path="name" maxlength="100" /></td>
      </tr>
      <tr>
        <td align="right">Fixed Asset Group : </td>
        <td><input type="text" size="35" disabled value="${fixedAsset_edit.fixedAssetGroup.name}" /></td>
      	</tr>
		<tr>
      		<td align="right">Aquisition Date : </td>
        	<td><input id="acquisitionDate" name="acquisitionDate" value="${fixedAsset_edit.acquisitionDate}" saveformat="dd-MM-yyyy" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
      	</tr>
      <tr>
        <td align="right">Currency : </td>
        <td><form:select path='currency'>
          <form:option value='${fixedAsset_edit.currency.id}' label='${fixedAsset_edit.currency.symbol}'/>
        </form:select>
          &nbsp;
          <form:select path="exchangeType">
            <form:option value='SPOT'>SPOT</form:option>
            <form:option value='MIDDLE'>MIDDLE</form:option>
            <form:option value='TAX'>TAX</form:option>
          </form:select>
        </td>
        <td><form:errors path="acquisitionValue" cssClass="error"/></td>
      </tr>
      <tr>
        <td align="right">Aquisition Value : </td>
        <td><input name="acquisitionValue" value="<fmt:formatNumber value='${fixedAsset_edit.acquisitionValue}'pattern=',##0.00'/>"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Salvage Value : </td>
        <td><input name="salvageValue" value="<fmt:formatNumber value='${fixedAsset_edit.salvageValue}'pattern=',##0.00'/>"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Note : </td>
        <td><form:textarea path="note" cols="55" rows="5" cssClass="inputbox"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Depreciation Method : </td>
        <td><form:select path="depreciationMethod">
          <form:option onclick="activate(0);" value="NO_DEPRECIATION" label="NO DEPRECIATION"/>
          <form:option onclick="activate(1)" value="STRAIGHT_LINE" label="STRAIGHT LINE"/>
          <form:option onclick="activate(2)" value="DECLINING_BALANCE" label="DECLINING BALANCE"/>
        </form:select>
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Useful Life (Period) : </td>
        <td><form:input id="usefulLife" path="usefulLife"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Declining Balance Rate (%) : </td>
        <td><form:input id="decliningBalanceRate" path="decliningBalanceRate"/></td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </form:form>
</div>
