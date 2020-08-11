<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>
			
<div class="main-box" style="height:370px">		  
<form:form id="addForm" name="addForm" action="page/chartofaccountadd.htm" method="post" modelAttribute="chartOfAccount">
	<table style="border:none">
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