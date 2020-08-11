<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<c:if test="${moduleGroup.parent!=null}">
		<a class="item-button-back" href="javascript:displayContent('page/modulegrouppreedit.htm?id=${moduleGroup.parent.id}')"><span><spring:message code="back"/></span></a>
	</c:if>
	<c:if test="${moduleGroup.parent==null}">
		<a class="item-button-back" href="javascript:displayContent('page/modulegrouplist.htm')"><span><spring:message code="back"/></span></a>
	</c:if>
	<a class="item-button-save"><span><spring:message code="save"/></span></a>
</div>

<div class="main-box">
	<form:form id="editForm" name="editForm" action="page/modulegroupedit.htm" method="post" modelAttribute="moduleGroup">
	<sessionConversation:insertSessionConversationId attributeName='moduleGroup'/>
		<table style="border:none">
		<tr>
			<td align="right">Index :</td>
			<td><form:input path="menuIndex" size="35"/></td>
		</tr>
		<tr>
			<td align="right"><spring:message code="name"/></td>
			<td><form:input path="name" cssClass="inputbox"/></td>
		</tr>
		<tr>
			<td align="right">Parent</td>
			<td>
				<select name="parent">
					<option value="" selected>ROOT</option>
					<c:forEach items="${moduleGroups}" var="group">
						<option value="${group.id}" ${(moduleGroup.parent.id==group.id)?"selected":""}>${(not empty group.parent.name)?group.parent.name:"ROOT"} > ${group.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">Enabled :</td>
			<td>
				<form:radiobutton path="enabled" value="true" label="Yes"/>
				<form:radiobutton path="enabled" value="false" label="No"/>
			</td>
		</tr>
		<tr>
			<td align="right">Displayed :</td>
			<td>
				<form:radiobutton path="displayed" value="true" label="Yes"/>
				<form:radiobutton path="displayed" value="false" label="No"/>
			</td>
		</tr>
		<tr>
			<td valign="top" align="right"><spring:message code="note"/></td>
			<td><form:textarea path="note" cols="50" rows="6"/></td>
		</tr>
		</table>
	</form:form>
	<br/>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Child Group</a></li>
			<li><a href="#tabs-2">Module</a></li>
		</ul>
		<div id="tabs-1" class="tab-pages">
			<div class="toolbar-clean">
				<a class="item-button-new" href="javascript:displayContent('page/modulegrouppreadd.htm?parent=${moduleGroup.id}')"><span>New Group</span></a>
			</div>
			<table width="100%" cellpadding="0" cellspacing="0" class="table-list" align="center">
			<tr>
				<th><div style="WIDTH:40px;"></div></th>
				<th>Index</th>
				<th>Status</th>
				<th>Name</th>
				<th>Note</th>
			</tr>
			<c:forEach items="${moduleGroup.members}" var="member">
			<tr>
				<td class="tools">
					<a class="item-button-edit" href="javascript:displayContent('page/modulegrouppreedit.htm?id=${member.id}')"><span>Edit</span></a>
					<a class="item-button-delete" href="page/modulegroupdelete.htm?id=${member.id}" title="Delete"><span>Delete</span></a>
				</td>
				<td>${member.menuIndex}</td>
				<td>${(member.enabled)?'Enabled':'Disabled'}-${(member.displayed)?'Displayed':'Hidden'}</td>
				<td>${member.name}</td>
				<td>${member.note}</td>
			</tr>
			</c:forEach>
			<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
			</table>
		</div>
		<div id="tabs-2" class="tab-pages">
			<div class="toolbar-clean">
				<a class="item-button-new" href="javascript:displayContent('page/modulepreadd.htm?id=${moduleGroup.id}')"><span>New Module</span></a>
			</div>
			<table width="980" cellpadding="0" cellspacing="0" class="table-list" align="center">
			<tr>
				<th  style="WIDTH:50px;"><div style="WIDTH:50px;"></div></th>
				<th style="WIDTH:10px;">Index</th>
					<th style="WIDTH:120px;">Status</th>
				  <th  style="WIDTH:34px;">Code</th>
				  <th  style="WIDTH:300px;">Name</th>
				  <th  style="WIDTH:200px;">Default URI</th>
			</tr>
			<c:forEach items="${moduleGroup.modules}" var="module">
			<tr>
				<td class="tools">
					<a class="item-button-edit" href="javascript:displayContent('page/modulepreedit.htm?id=${module.id}')"><span>Edit</span></a>
					<a class="item-button-delete" href="page/moduledelete.htm?id=${module.id}" title="Delete"><span>Delete</span></a>
				</td>
				<td>${module.menuIndex}</td>
				<td>${(module.enabled)?'Enabled':'Disabled'}-${(module.mandatory)?'Displayed':'Hidden'}</td>
				<td>${module.code}</td>
				<td style="oveflow:hidden;text-overflow: ellipsis-word;">${module.name}</td>
				<td style="text-overflow: ellipsis-word;">${module.defaultUri}</td>
			</tr>
			</c:forEach>
			<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
			</table>
		</div>
	</div>
</div>