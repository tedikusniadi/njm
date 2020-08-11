<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Sales Master Cost >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>

	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>

</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top menu -->

<!-- /top menu -->

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
			<td width="60%">Sales > Sales Master Cost</td>
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
					<!-- main contents goes here -->
						<h1 class="page-title">S50 - Sales Master Cost</h1>
						
						<div class="clears">&nbsp;</div>
						<div class="toolbar-clean">
							<a class="item-button-new" href="<c:url value='/page/salesmastercostpreadd.htm'/>"><span>New Sales Master Cost</span></a>
					  	</div>
					  
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<th width="7%"><div style="width:20px"></div></th>
					  	  <th width="20%">Name</th>
					  	  <th width="73%">Type</th>
						</tr>
						<c:forEach items="${costs}" var="cost">
						<tr>
							<td class="tools">
								<a class="item-button-edit"   href="<c:url value='/page/salesmastercostpreedit.htm?id=${cost.id}'/>" title="Edit"><span>Edit</span></a>
								<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/salesmastercostdelete.htm?id=${cost.id}'/>')" title="Delete"><span>Delete</span></a>
							</td>
							<td><c:out value="${cost.name}" /></td> 
							<td><c:out value="${cost.type}" /></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
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
</div>
	<%@ include file="/common/dialog.jsp"%>
</div>

</body>
<!-- END OF BODY -->
</html>
