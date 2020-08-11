<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP - Currency Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.updateForm.action = "<c:url value='/page/currencyUpdate.htm'/>";
			document.updateForm.submit();
		}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	
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
		<td width="60%">
		Company Administration > General Setting > Currency > Edit
		</td>
		<td width="40%" align="right">
			<%@ include file="/common/welcome.jsp"%>
		</td>
	</tr>
	</table>
	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					
					<h1 class="page-title">C33 - Currency</h1>
						
					<div class="toolbar">
						<a class="item-button-list" href="<c:url value='/page/currencyView.htm'/>"><span>List</span></a>
						<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					</div>					  
					  
					<div class="main-box">
						<c:if test="${not empty message}">
							<%@ include file="/common/error.jsp"%>
						</c:if>
						<form:form cssClass="edit-form" id="updateForm" name="updateForm" method="post" modelAttribute="currency_edit">
						<table border="0" cellpadding="0" cellspacing="0">
 						<tr>
 							<td width="104"><div class="form-label">Currency ID :</div></td>
							<td width="240"><form:input id="currencyId" path="symbol" cssClass="inputbox" /></td>
							<td width="360"><form:errors path="symbol" cssClass="error"/></td>
 						</tr>
 						<tr>
 							<td><div class="form-label">Currency Name :</div></td>
							<td><form:input id="currencyName" path="name" cssClass="inputbox" /></td>
							<td><form:errors path="name" cssClass="error"/></td>
 						</tr>
 						<tr>
 							<td width="128"><div class="form-label">&nbsp;</div></td>
						  	<td width="192"><input type="checkbox" name="base" <c:if test='${currency_edit.base}'>checked</c:if> >Default Currency</input></td>
						    <td><form:errors path="base" cssClass="error"/></td>
 						</tr>
 						</table>
						</form:form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
