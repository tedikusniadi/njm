<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Geographic Type >> Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	<script type="text/javascript">
		function save()
		{			
			document.addForm.action = "<c:url value='/page/geotypeadd.htm'/>";
			document.addForm.submit();
		}
	</script>
</head>

<body>

	<%@ include file="/common/sirius-header.jsp"%>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	
	<%@ include file="/common/sirius-menu.jsp"%>
	
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Company Administration > General Setting > Geographic Type > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">C33 - Geographic Type</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/geotypeview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					 	</div>
						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>

					 		<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="geographicType_add">
					 		<table cellpadding="0" cellspacing="0">
					 		<tr>
								<td><div class="form-label">Name :</div></td>
								<td>
									<div class="form-value">
					  					<form:input path="name" cssClass="inputbox" maxlength="50"/>
					 				</div>
								</td>
								<td><form:errors cssClass="error" path="name"/></td>
					 		</tr>
					 		<tr>
								<td><div class="form-label">Note :</div></td>
								<td>
									<div class="form-value">
					  					<form:textarea path="note" cols="45" rows="6"/>
					 				</div>
								</td>
								<td>&nbsp;</td>
					 		</tr>
					 		</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>

</html>
