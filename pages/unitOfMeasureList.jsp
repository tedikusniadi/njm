<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP - Unit of Measure List</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Company Administration > General Setting > Unit of Measure</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
	</table>

	</div>

	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">C35 - Unit of Measure</h1>
						<div class="clears">&nbsp;</div>
						<div class="toolbar-clean">
							<a class="item-button-new" href="<c:url value='/page/uomPrepareAdd.htm' />"><span>New Unit of Measure</span></a>
					  	</div>
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<th width="8%"><div style="width:44px"></div></th>
							<th width="15%">ID</th>
							<th width="19%">Name</th>
							<th width="58%">Type</th>
						</tr>
						<c:forEach items="${data}" var="measureBean">
						<tr>
 							<td class="tools">
  								<a class="item-button-edit"   href="<c:url value='/page/uomPrepareUpdate.htm?id=${measureBean.id}'/>"><span>Edit</span></a>
  								<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/uomDelete.htm?id=${measureBean.id}'/>');"><span>Delete</span></a>
 							</td>
 							<td><c:out value='${measureBean.measureId}'/></td>
 							<td><c:out value='${measureBean.name}'/></td>
 							<td><c:out value='${measureBean.type}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
<%@ include file="/common/dialog.jsp"%>
</body>
<!-- END OF BODY -->
</html>
