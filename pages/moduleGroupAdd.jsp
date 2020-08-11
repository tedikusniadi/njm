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

<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/modulegroupadd.htm" method="post" modelAttribute="moduleGroup">
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
		<c:if test="${not empty moduleGroup.parent}">
		<tr>
			<td align="right">Parent :</td>
			<td><input value="${moduleGroup.parent.name}" class="input-disabled inputbox" disabled/></td>
		</tr>
		</c:if>
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
</div>