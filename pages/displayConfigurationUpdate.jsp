<%@ include file="/common/tld-common.jsp"%>

<%@ include file="/common/popup.jsp"%>

<div class="toolbar">
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="editForm" name="editForm" action="page/configurationassistancedisplayconfigedit.htm" method="post" modelAttribute="displayConfiguration">
		<table style="border:none">
		<tr>
			<td width="159"><div align="right">Row/Page(Reguler) :</div></td>
	  		<td width="326"><form:input path="row" cssClass="inputbox"/></td>
	  	  <td width="170">&nbsp;</td>
		</tr>
		<tr>
			<td width="159"><div align="right">Row/Page(Popup) :</div></td>
	  		<td width="326"><form:input path="popuprows" cssClass="inputbox"/></td>
	  	  <td width="170">&nbsp;</td>
		</tr>
        <tr>
			<td width="159"><div align="right">Default Locale :</div></td>
	  		<td width="326">
       	  <form:select path="locale" cssClass='combobox'>
                	<form:options items='${locales}' itemValue='id' itemLabel='name'/>
                </form:select>
            </td>
	  	  <td width="170">&nbsp;</td>
		</tr>
		<tr>
			<td width="159"><div align="right">Default Organization :</div></td>
	  		<td width="326">
       	  		<form:select id="org" path="organization" cssClass='combobox'>
                	<c:if test='${not empty displayConfiguration.organization}'>
                       	<form:option value='${displayConfiguration.organization.id}' label='${displayConfiguration.organization.firstName} ${displayConfiguration.organization.lastName} ${displayConfiguration.organization.middleName}' />
                    </c:if>
                </form:select>
                &nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
            </td>
	  	  <td width="170">&nbsp;</td>
		</tr>
		</table>
	</form:form>
</div>