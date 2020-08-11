<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP - Unit of Measure Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.uomForm.action = "<c:url value='/page/uomAdd.htm'/>";
			document.uomForm.submit();
		}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
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
			<td width="60%">Company Administration > General Setting > Unit of Measure > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
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
						
						<h1 class="page-title">C35 - Unit of Measure</h1>
						
						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/uomView.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					 	</div>
					  
						<div class="main-box">
							<form:form id="uomForm" name="uomForm" method="post" modelAttribute="unitOfMeasure_add">
 							<table width="100%" border="0" cellpadding="3" cellspacing="0">
 							<tr>
 								<td width="152" align="right">ID</td>
                              	<td width="6" align="center">:</td>
							  	<td width="607"><form:input id="uomId" path="measureId" cssClass="inputbox" maxlength="15"/></td>
							  	<td width="450"><form:errors path="measureId" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td align="right">Name</td>
                                <td align="center">:</td>
								<td><form:input id="uomName" path="name" cssClass="inputbox" maxlength="30"/></td>
								<td><form:errors path="name" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td align="right">Type</td>
                                <td align="center">:</td>
								<td>
	    							<form:select path="type" cssClass="combobox">
                                        <form:option value="WEIGHT" label='WEIGHT'/>
                                        <form:option value="UNIT" label='UNIT'/>
                                        <form:option value="AREA" label='AREA'/>
                                        <form:option value="VOLUME" label='VOLUME'/>
                                        <form:option value="TIME" label='TIME'/>
                                        <form:option value="LENGTH" label='LENGTH'/>
                                    </form:select>
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
