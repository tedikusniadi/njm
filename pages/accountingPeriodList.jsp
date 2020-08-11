<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Accounting Period</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Period </td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
                        <div dojoType="SplitContainer" widgetId="split" style="width: 100%; height: 430px;" orientation="horizontal" sizerWidth="5" activeSizing="0"	layoutAlign="client">
                            <div widgetId="treePane" dojoType="Tree" toggle="wipe" toggleDuration="500" sizeMin="20" sizeShare="3">
                                <div dojoType="TreeNode" title="Accounting Period" expandLevel="2" onTitleClick='redirectTo("page/accountingperiodview.htm");' childIconSrc="assets/icons/coa-parent.gif">
                                    <c:forEach items="${accountingPeriods}" var="parent">
                                        <div dojoType="TreeNode" onTitleClick='displayContent("page/accountingperiodpreedit.htm?id=${parent.id}");' title="${parent.name}" childIconSrc="assets/icons/group.gif">
                                            <c:if test="${not empty parent.childs}">
                                                <c:forEach items="${parent.childs}" var="child1">
                                                    <div dojoType="TreeNode" onTitleClick='displayContent("page/accountingperiodpreedit.htm?id=${child1.id}");' title="${child1.name}" childIconSrc="assets/icons/group.gif">
                                                        <c:if test="${not empty child1.childs}">
                                                            <c:forEach items="${child1.childs}" var="child2">
                                                                <div dojoType="TreeNode" onTitleClick='displayContent("page/accountingperiodpreedit.htm?id=${child2.id}");' title="${child2.name}" childIconSrc="assets/icons/group.gif">
                                                                    <c:if test="${not empty child2.childs}">
                                                                        <c:forEach items="${child2.childs}" var="child3">
                                                                            <div dojoType="TreeNode" onTitleClick='displayContent("page/accountingperiodpreedit.htm?id=${child3.id}");' title="${child3.name}" childIconSrc="assets/icons/group.gif">
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
                            <div id="listPane" dojoType="ContentPane" style="padding: 5px; width:100% ; height:430px;" refreshOnShow="true" doLayout="true" overFlow="true">
                                <div class="toolbar">
                                    <a class="item-button-add-gl-child" href="javascript:displayContent('page/accountingperiodpreadd.htm');"><span>New Period</span></a>
                                </div>					  
                                <div class="main-box" style="height: 370px;">
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list" align="center">
                                    <tr>
                                        <th width="49"><div style="width:40px"></div></th>
                                        <th width="117">ID</th>
                                        <th width="331">Accounting Period Name</th>
                                        <th width="469">Note</th>
                                    </tr>
                                    <c:forEach items="${accountingPeriods}" var="period">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/accountingperioddelete.htm?id=${period.id}'/>');"><span>Delete</span></a>
                                        </td>
                                        <td><c:out value='${period.code}'/></td>
                                        <td><c:out value='${period.name}'/></td>
                                        <td><c:out value='${period.note}'/></td>
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
<%-- <script src="<c:url value='/assets/dialog.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script> --%>
<script type="text/javascript">
	function displayContent(url)
	{
		var listPane = dojo.widget.getWidgetById("listPane");
		listPane.setUrl(url);
	}

	function redirectTo(url)
	{
		window.location = url;
	}
	
	function perioddelete(id)
	{
		var confirmation = confirm("Do you really want to delete Accounting Period ?");
		if(confirmation==true)
			window.location = "<c:url value='/page/accountingperioddelete.htm?id='/>"+id;
	}
	
	function periodclose(uri,id)
	{			
		$.ajax({
			url:"<c:url value='/page/popupaccountingperiodcheckcloseability.htm'/>",
			data:{id:id},
			type : 'GET',
			dataType : 'json',
			success : function(json) {
				if(json)
				{
					if(json.status == 'OK')
					{
						if(json.closeable)
							window.location = uri;
						else
							alert(json.message);						
					}
					else
						alert(json.message);
				}
			}
		});	
	}
</script>
<%-- <%@ include file="/common/dialog.jsp"%> --%>

</body>
</html>