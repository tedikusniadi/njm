<%@ include file="/common/tld-common.jsp"%>
<div class="toolbar">
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:420px">
	<form:form id="addForm" name="addForm" action="page/organizationstructureadd.htm" method="post" modelAttribute="structure_add">
		<table style="border:none">
			<tr>
				<td width="150"><div align="right">Position ID :</div></td>
				<td width="378"><form:input path="code" size="10"/></td>
			</tr>
			<tr>
				<td><div align="right">Position Name :</div></td>
				<td><form:input path="name" size="50"/></td>
			</tr>
            <tr>
				<td><div align="right">Level :</div></td>
				<td>
					<form:select path="level">
						<form:option value="GROUP">Organization Structure</form:option>
						<form:option value="CHILD">Position</form:option>
					</form:select>
				</td>
			</tr>
			<c:if test="${not empty structure_add.parent and structure_add.parent.level eq 'CHILD'}">
			<tr>
				<td><div align="right">Report To :</div></td>
				<td>
					<select class="combobox-ext">
						<option selected>${structure_add.parent.name}</option>
					</select>
				</td>
			</tr>
			</c:if>
			<tr>
				<td><div align="right">Type :</div></td>
				<td>
					<form:select path="type">
						<form:option value="STRUCTURAL">Structural</form:option>
                        <form:option value="NON_STRUCTURAL">Non Structural</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Effective Date :</div></td>
				<td>
					<input name="startDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/>
					To
					<input name="endDate" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" />
				</td>
			</tr>
			<tr>
				<td><div align="right">Position Status :</div></td>
				<td>
					<form:select path="active">
						<form:option value="yes">Active</form:option>
                        <form:option value="no">Inactive</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td><div align="right">Job Description :</div></td>
				<td><form:textarea id="jobDescription" class="mceEditor" cols="50" rows="5" path='jobDescription' wrap="hard"/></td>
			</tr>
		</table>
		</br>
		<table width="75%" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td colspan="2" align="left"><strong>Accessible Company</strong></td>
		</tr>
		<c:forEach items="${structure_add.accessibleOrganizations}" var="organization" varStatus="status">
		<tr>
			<td width="1%" nowrap="nowrap"><form:checkbox value="true" path="accessibleOrganizations[${status.index}].enabled"/></td>
			<td>${organization.organization.name}</td>
		</tr>
		</c:forEach>
		</table>
	</form:form>
</div>
<script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce_src.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		editor_selector : "mceEditor",		
		theme_advanced_buttons1 : "bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright, justifyfull,bullist,numlist,undo,redo,link,unlink",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "center",		
		extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]"
	});
</script>