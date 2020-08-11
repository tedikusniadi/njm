<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-delete" href="javascript:window.location=page/chartofaccountdelete.htm?id=${chartOfAccount.id};"><span>Delete</span></a>
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
    <a class="item-button-print" href="javascript:window.location='page/chartofaccountprint.htm?id=${chartOfAccount.id}';"><span>Print</span></a>
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/glaccountpreadd.htm?coa=${chartOfAccount}');"><span>New GL Account</span></a>
</div>
			
<div class="main-box" style="height:370px">		  
<form:form id="editForm" name="editForm" action="page/chartofaccountedit.htm" method="post" modelAttribute="chartOfAccount">
	<table style="border:none" width="100%">
	<tr>
		<td align="right">Chart Of Account ID :</td>
		<td><form:input path="code" cssClass="inputbox"/></td>
	</tr>
	<tr>
		<td align="right">Chart Of Account Name :</td>
		<td><form:input path="name" cssClass="inputbox"/></td>
	</tr>
	<tr>
		<td valign="top" align="right">Note :</td>
		<td><form:textarea path="note" cols="50" rows="6"/></td>
	</tr>
	</table>
</form:form>
</div>