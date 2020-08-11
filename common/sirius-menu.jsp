<%@ include file="tld-common.jsp"%>
<%@ include file="/common/tld-spring.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").append($('.conversation'));	
	});
</script>
<div style="display:none">
	<table>
		<tbody>
		<c:forEach items="${attribute}" var="attr">
			<tr>
				<td><sessionConversation:insertSessionConversationId attributeName='${attr.key}'/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div id="se-main-menu">
	<div id="main_menu_popup" dojoType="MenuBar2" class="menu-popup">
		<c:forEach items="${menu.roots}" var="root">
			<c:if test="${empty root.url}">
				<div dojoType="MenuBarItem2" caption="${root.name}" submenuId="${root.id}"></div>
			</c:if>
			<c:if test="${not empty root.url}">
				<div dojoType="MenuBarItem2" caption="${root.name}" onclick="go_to('<c:url value='${root.url}'/>');"></div>
			</c:if>
		</c:forEach>
	</div>

	<c:forEach items="${menu.roots}" var="root" varStatus="status">
		<div dojoType="PopupMenu2" widgetId="${root.id}">
		<c:forEach items="${menu.modules}" var="module" varStatus="status2">
			<c:if test="${module.parentId==root.id}">
				<c:if test="${empty module.url}">
					<div dojoType="MenuItem2" caption="${module.name}" submenuId="${module.id}"></div>
				</c:if>
				<c:if test="${not empty module.url}">
					<div dojoType="MenuItem2" caption="${module.name}" onclick="go_to('<c:url value='${module.url}'/>');"></div>
				</c:if>
				<c:if test="${menu.modules[status2.index+1]!=null}">
					<div dojoType="MenuSeparator2"></div>
				</c:if>
			</c:if>
		</c:forEach>
		</div>
	</c:forEach>

	<c:forEach items="${menu.modules}" var="group" varStatus="status3">
		<c:if test="${empty group.url}">
			<div dojoType="PopupMenu2" widgetId="${group.id}">
				<c:forEach items="${menu.modules}" var="module" varStatus="status4">
					<c:if test="${module.parentId==group.id}">
						<c:if test="${empty module.url}">
							<div dojoType="MenuItem2" caption="${module.name}" submenuId="${module.id}"></div>
						</c:if>
						<c:if test="${not empty module.url}">
							<div dojoType="MenuItem2" caption="${module.name}" onclick="go_to('<c:url value='${module.url}'/>');"></div>
						</c:if>
						<c:if test="${menu.modules[status4.index+1]!=null}">
							<div dojoType="MenuSeparator2"></div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</c:forEach>
</div>