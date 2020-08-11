<%@ include file="/common/tld-common.jsp"%>

<div class="toolbar">
	<c:if test="${module.moduleGroup!=null}">
		<a class="item-button-back" href="javascript:displayContent('page/modulegrouppreedit.htm?id=${module.moduleGroup.id}');"><span><spring:message code="back"/></span></a>
	</c:if>
	<c:if test="${module.moduleGroup==null}">
		<a class="item-button-back" href="javascript:displayContent('page/modulegrouplist.htm')"><span><spring:message code="back"/></span></a>
	</c:if>
	<a class="item-button-save"><span><spring:message code="save"/></span></a>
</div>

<div class="main-box">
	<form:form id="editForm" name="editForm" action="page/moduleedit.htm" method="post" modelAttribute="module">
	<sessionConversation:insertSessionConversationId attributeName='module'/>
		<table style="border:none">
		<tr>
			<td align="right">Index :</td>
			<td><form:input path="menuIndex" size="5"/></td>
		</tr>
		<tr>
			<td align="right">Code :</td>
			<td><form:input path="code" size="35"/></td>
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
			<td>
				<select name="moduleGroup">
					<option value="" selected>ROOT</option>
					<c:forEach items="${moduleGroups}" var="group">
						<option value="${group.id}" ${(module.moduleGroup.id==group.id)?"selected":""}>${group.groupName}</option>
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
			<td align="right">Mandatory(Displayed) :</td>
			<td>
				<form:radiobutton path="mandatory" value="true" label="Yes"/>
				<form:radiobutton path="mandatory" value="false" label="No"/>
			</td>
		</tr>
		</table>
	</form:form>
	<br/>
	<div id="tabs" dojoType="TabContainer" style="width:100% ; height: 250px;">
		<ul>
			<li><a href="#tabs-1">Child Group</a></li>
		</ul>
		<div id="tabs-1" dojoType="ContentPane" label="Detail" class="tab-pages">
			<div class="toolbar-clean">
				<a class="item-button-new" href="javascript:displayContent('page/moduledetailpreadd.htm?parent=${module.id}')"><span>New Detail URI</span></a>
			</div>
			<table width="100%" cellpadding="0" cellspacing="0" class="table-list" align="center">
			<tr>
				<th><div style="WIDTH:40px;"></div></th>
				<th>URI</th>
				<th>Type</th>
			</tr>
			<c:forEach items="${module.details}" var="member">
			<tr>
				<td class="tools">
					<a class="item-button-edit" href="javascript:displayContent('page/moduledetailpreedit.htm?id=${member.id}')"><span>Edit</span></a>
					<a class="item-button-delete" href="page/moduledetaildelete.htm?id=${member.id}" title="Delete"><span>Delete</span></a>
				</td>
				<td>${member.uri}</td>
				<td>${member.detailType}</td>
			</tr>
			</c:forEach>
			<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
			</table>
		</div>
	</div>
	<br/><br/>
</div>