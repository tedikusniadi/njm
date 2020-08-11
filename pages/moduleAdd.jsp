<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<a class="item-button-back" href="javascript:displayContent('page/modulegrouppreedit.htm?id=${module.moduleGroup.id}');"><span><spring:message code="back"/></span></a>
	<a class="item-button-save"><span>Save</span></a>
</div>

<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/moduleadd.htm" method="post" modelAttribute="module">
	<sessionConversation:insertSessionConversationId attributeName='module'/>
	<table style="border:none">
	<tr>
		<td align="right">Index :</td>
		<td><form:input path="menuIndex" size="5"/></td>
	</tr>
	<tr>
		<td align="right">Code :</td>
		<td><form:input path="code" size="5"/></td>
	</tr>
	<tr>
		<td align="right">Name :</td>
		<td><form:input path="name" size="75"/></td>
	</tr>
	<tr>
		<td align="right">Default URI :</td>
		<td><form:input path="defaultUri" size="75"/></td>
	</tr>
	<tr>
		<td align="right">Group :</td>
		<td><input value="${module.moduleGroup.name}" disabled class="inputbox input-disabled"/></td>
	</tr>
	<tr>
		<td align="right">Enabled :</td>
		<td>
			<form:radiobutton path="enabled" value="true" label="Yes"/>
			<form:radiobutton path="enabled" value="false" label="No"/>
		</td>
	</tr>
	<tr>
			<td align="right">Mandatory(Displayed) :</td>
			<td>
				<form:radiobutton path="mandatory" value="true" label="Yes"/>
				<form:radiobutton path="mandatory" value="false" label="No"/>
			</td>
		</tr>
	</table>
	</form:form>
</div>