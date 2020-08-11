<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<c:set var="icon" value=""/>
                        <div dojoType="SplitContainer" widgetId="split" style="width: 100%; height: 480px;" orientation="horizontal" sizerWidth="5" activeSizing="0" layoutAlign="client">
                            <div widgetId="treePane" dojoType="Tree" toggle="wipe" toggleDuration="500" sizeMin="20" sizeShare="3">
                                <div dojoType="TreeNode" title="${title}" expandLevel="2" onTitleClick='redirectTo("page/organizationstructureview.htm");' childIconSrc="assets/icons/coa-parent.gif">
                                    <c:forEach items="${structures}" var="parent">
                                    	<c:if test="${parent.level eq 'GROUP'}"><c:set var="icon" value="assets/icons/group.gif"/></c:if>
                                    	<c:if test="${parent.level eq 'CHILD'}"><c:set var="icon" value="assets/icons/child.png"/></c:if>
                                        <div dojoType="TreeNode" onTitleClick='displayContent("page/organizationstructurepreedit.htm?id=${parent.id}");' title="${parent.name}" childIconSrc="${icon}">
                                            <c:if test="${not empty parent.childs}">
                                                <c:forEach items="${parent.childs}" var="child1">
		                                    	<c:if test="${child1.level eq 'GROUP'}"><c:set var="icon" value="assets/icons/group.gif"/></c:if>
		                                    	<c:if test="${child1.level eq 'CHILD'}"><c:set var="icon" value="assets/icons/child.png"/></c:if>
                                                    <div dojoType="TreeNode" onTitleClick='displayContent("page/organizationstructurepreedit.htm?id=${child1.id}");' title="${child1.name}" childIconSrc="${icon}">
                                                        <c:if test="${not empty child1.childs}">
                                                            <c:forEach items="${child1.childs}" var="child2">
						                                    	<c:if test="${child2.level eq 'GROUP'}"><c:set var="icon" value="assets/icons/group.gif"/></c:if>
						                                    	<c:if test="${child2.level eq 'CHILD'}"><c:set var="icon" value="assets/icons/child.png"/></c:if>
                                                                <div dojoType="TreeNode" onTitleClick='displayContent("page/organizationstructurepreedit.htm?id=${child2.id}");' title="${child2.name}" childIconSrc="${icon}">
                                                                    <c:if test="${not empty child2.childs}">
                                                                        <c:forEach items="${child2.childs}" var="child3">
									                                    	<c:if test="${child3.level eq 'GROUP'}"><c:set var="icon" value="assets/icons/group.gif"/></c:if>
									                                    	<c:if test="${child3.level eq 'CHILD'}"><c:set var="icon" value="assets/icons/child.png"/></c:if>
                                                                            <div dojoType="TreeNode" onTitleClick='displayContent("page/organizationstructurepreedit.htm?id=${child3.id}");' title="${child3.name}" childIconSrc="${icon}">
                                                                            </div>											
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>											
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>											
                                                </c:forEach>
                                            </c:if>
                                        </div>											
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="listPane" dojoType="ContentPane" style="padding: 5px; width:100% ; height:480px;" refreshOnShow="true" doLayout="true" overFlow="true">
                                <div class="toolbar">
                                    <a class="item-button-add-gl-child" href="javascript:displayContent('page/organizationstructurepreadd.htm');"><span>New Organization Structure</span></a>
                                </div>					  
                                <div class="main-box" style="height: 420px;">
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list" align="center">
                                    <tr>
                                        <th width="49"><div style="width:25px"></div></th>
                                        <th width="117">ID</th>
                                        <th width="331">Organization Structure Name</th>
                                        <!-- <th width="469">Note</th> -->
                                    </tr>
                                    <c:forEach items="${structures}" var="structure">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/organizationstructuredelete.htm?id=${structure.id}'/>');"><span>Delete</span></a>
                                        </td>
                                        <td><c:out value='${structure.code}'/></td>
                                        <td><c:out value='${structure.name}'/></td>
                                        <%-- <td><c:out value='${structure.note}'/></td> --%>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
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
	
	function displayContent(url)
	{
		var listPane = dojo.widget.getWidgetById("listPane");
		listPane.setUrl(url);
	}

	function redirectTo(url)
	{
		window.location = url;
	}
	
	function structureDelete(id)
	{
		var confirmation = confirm("Do you really want to delete this Organization Structure ?");
		if(confirmation==true)
			window.location = "<c:url value='/page/organizationstructuredelete.htm?id='/>"+id;
	}
</script>
</html>