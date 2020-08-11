<%@ include file="/common/tld-common.jsp"%>



<div class="toolbar">
	<a class="item-button-back" href="javascript:displayContent('page/configurationassistancedistributionview.htm');"><span>Back</span></a>
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>

<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/configurationassistancedistributionadd.htm" method="post" modelAttribute="journalDistributionSource">
		<table style="border:none">
		<tr>
			<td><div align="right">Organization :</div></td>
			<td>
				<form:select id="org" path="organization" cssClass="combobox-ext">
				</form:select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td><div align="right">Note :</div></td>
			<td><form:textarea path="note" cols="50" rows="6"/> </td>
		</tr>
		</table>
	</form:form>
</div>