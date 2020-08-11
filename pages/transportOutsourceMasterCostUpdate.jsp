<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Master Cost >> Edit</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action="<c:url value='/page/transportoutsourcemastercostedit.htm'/>";
			document.editForm.submit();
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
            <td width="60%">Transport Outsource > Transport Outsource Master Cost > Edit</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D30 - Transport Outsource Master Cost</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/transportoutsourcemastercostview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="editForm" name="editForm" method="post" modelAttribute="masterCost_edit">
			 				<table width="99%" style="border:none" class="space">
							<tr>
								<td width="15%" align="right"><div align="left">Name</div></td>
						  		<td width="1%"><div align="center">:</div></td>
						 		<td width="34%"><form:input path="name" maxlength="100" cssClass="inputbox"/></td>
								<td><form:errors path='name' cssClass='error'/></td>
							</tr>	
							<tr>
								<td align="right"><div align="left">Type </div></td>
								<td><div align="center">:</div></td>
								<td>
                                	<form:select path="type" cssClass="combobox">
										<form:option value='MAIN' label='Main Cost'/>
                                        <form:option value='OTHER' label='Other Cost'/>
									</form:select>
                                </td>
								<td><form:errors path='type' cssClass='error'/></td>
							</tr>
							<tr>
								<td align="right"><div align="left">Note </div></td>
								<td><div align="center">:</div></td>
								<td><form:textarea path="note" cols='45' rows='6'/></td>
						  		<td>&nbsp;</td>
							</tr>
							</table>
 							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${masterCost_edit.createdBy.firstName} ${masterCost_edit.createdBy.middleName} ${masterCost_edit.createdBy.lastName}'/> (<fmt:formatDate value='${masterCost_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${masterCost_edit.updatedBy.firstName} ${masterCost_edit.updatedBy.middleName} ${masterCost_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${masterCost_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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



</body>
<!-- END OF BODY -->
</html>
