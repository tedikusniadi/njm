<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-save" href="javascript:dispose(${fixedAsset.organization.id});"><span>Save</span></a>
</div>
<div class="main-box" style="height:402px;overflow:auto">	
	<form:form id="editForm" name="editForm" method="post" modelAttribute="fixedAsset">
		<table width="100%" style="border:none">
        <tr>
        	<td width="57%">
           		<table border="0" width="100%">
                <input type="hidden" name="disposed" value="true" />
                <tr>
                    <td nowrap="nowrap" align="right">Date :</td>
                    <td><input id="disposeDate" name="disposeDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                </tr>
                <c:if test='${fixedAsset.depreciationMethod == "STRAIGHT_LINE"}'>
                <tr>
                    <td width="19%" align="right">Book Value : </td>
                    <td width="81%"><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset.straightLine.bookValue}' pattern=',##0.00' />" size="15"></td>
                </tr>
                </c:if>
                <c:if test='${fixedAsset.depreciationMethod == "DECLINING_BALANCE"}'>
				<tr>
                    <td align="right">Book Value : </td>
                    <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${fixedAsset.decliningInformation.bookValue}' pattern=',##0.00' />" size="15"></td>
                </tr>
				</c:if>
                <c:if test='${fixedAsset.depreciationMethod == "STRAIGHT_LINE"}'>
                <tr>
                    <td align="right">Dispose Amount : </td>
                    <td><input name='disposeAmount' value="<fmt:formatNumber value='${fixedAsset.straightLine.bookValue}' pattern='##0.00' />" size="15"></td>
                </tr>
                </c:if>
                <c:if test='${fixedAsset.depreciationMethod == "DECLINING_BALANCE"}'>
				<tr>
                    <td align="right">Dispose Amount : </td>
                    <td><input name='disposeAmount' value="<fmt:formatNumber value='${fixedAsset.decliningInformation.bookValue}' pattern='##0.00' />" size="15"></td>
                </tr>
				</c:if>
                <tr>
      				<td align="right">Aquisition Date : </td>
        			<td><input type="text" size="10" disabled class="input-disabled"  value="<fmt:formatDate value='${fixedAsset.acquisitionDate}' pattern='dd-MM-yyyy'/>"/></td>
      			</tr>
                <tr>
                    <td align="right">Bank Account : </td>
                    <td>
                        <form:select id='account' path='bankAccount' cssClass='combobox-ext'>
                            <c:if test='${not empty fixedAsset.bankAccount}'>
                                <form:option value='${fixedAsset.bankAccount.id}' label='${fixedAsset.bankAccount.code}' />
                            </c:if>
                        </form:select>
                        &nbsp;
                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountview.htm?target=account&organization=${fixedAsset.fixedAssetGroup.organization.id}'/>');" style="CURSOR:pointer;" title="Bank Account" />
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap" align="right">Account Name : </td>
                    <td><input id='accountName' disabled='true' class='input-disabled' size="30"/></td>
                </tr>
                <tr>
                    <td nowrap="nowrap" align="right">Bank Name : </td>
                    <td><input id='bankName' disabled='true' class='input-disabled' size="30"/></td>
                </tr>
                <tr>
                    <td nowrap="nowrap" align="right">Bank Branch : </td>
                    <td><input id='bankBranch' disabled='true' class='input-disabled' size="30"/></td>
                </tr>
                <tr>
                    <td nowrap="nowrap" align="right">Account No : </td>
                    <td><input id='accountNo' disabled='true' class='input-disabled' size="30"/></td>
                </tr>
                </table>
            </td>
        </tr>
        </table>
	</form:form>
</div>