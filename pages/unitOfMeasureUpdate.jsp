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
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
	<script type="text/javascript" src="assets/dialog.js"></script>	
	<script type="text/javascript">
		function save()
		{			
			document.uomForm.action = "<c:url value='/page/uomUpdate.htm'/>";
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
			<td width="60%">Company Administration > General Setting > Unit of Measure > Edit</td>
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
					<!-- main contents goes here -->
						
						<h1 class="page-title">C35 - Unit of Measure</h1>
						
						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/uomView.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="uomForm" name="uomForm" method="post" modelAttribute="unitOfMeasure_edit">
 							<table border="0" cellpadding="3" cellspacing="0" width="100%">
 							<tr>
 								<td width="12%" align="right">ID</td>
                              <td width="1%" align="center">:</td>
							  <td width="45%"><form:input id="uomId" path="measureId" maxlength="15"/></td>
							  <td width="42%"><form:errors path="measureId" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td align="right">Name</td>
								<td align="center">:</td>
                                <td><form:input id="uomName" path="name" maxlength="30"/></td>
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
                            <div class="clears">&nbsp;</div>
                            <div class="toolbar-clean">
								<a class="item-button-new" href="<c:url value='/page/unitofmeasurefactorpreadd.htm?id=${unitOfMeasure_edit.id}' />"><span>New Factor</span></a>
                            </div>
                            <table class="table-list" cellspacing="0" cellpadding="0" style="width:65%;">
                            <tr>
                              <th width="11%"><div style="width:44px"></div></th>
                                <th width="42%">To</th>
                              <th width="47%">Factor</th>
                            </tr>
                            <c:forEach items="${unitOfMeasure_edit.factors}" var="factor">
                            <tr>
                                <td class="tools">
                                    <a class="item-button-edit" href="<c:url value='/page/unitofmeasurefactorpreedit.htm?id=${factor.id}'/>"  title="Edit"><span>Edit</span></a>
                                    <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/unitofmeasurefactordelete.htm?id=${factor.id}'/>');" title="Delete"><span>Delete</span></a>
                                </td>
                                <td><c:out value='${factor.to.name}'/></td>
                                <td><fmt:formatNumber value='${factor.factor}' pattern=',##0.00000'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                            </table>
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
<%@ include file="/common/dialog.jsp"%>