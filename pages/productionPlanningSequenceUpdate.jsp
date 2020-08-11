<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Planning Sequence >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Production > Production Planning Sequence > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U21 - Production Planning Sequence</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionplanningpreedit.htm?id=${planning_sequence_edit.planning.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" id='save' style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="planning_sequence_edit">
								<table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="36%" align="right">Work Unit</td>
                                    <td width="1%">:</td>
                               	  	<td width="63%"><input value="${planning_sequence_edit.workUnit.code} ${planning_sequence_edit.workUnit.name}" size="50" class="input-disabled" disabled/></td>
                                </tr>
                                <tr>
                                    <td width="36%" align="right">Work Duration</td>
                                    <td width="1%">:</td>
                               	  	<td width="63%">
                                    	<form:input path='duration' size='15' disabled='true' cssClass='input-disabled'/>&nbsp;
                                    	<form:select path='unitOfMeasure' disabled='true'>
                                        	<form:option value='${planning_sequence_edit.unitOfMeasure.id}' label='${planning_sequence_edit.unitOfMeasure.name}'/>
                                        </form:select>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                    <div id="_resource" dojoType="ContentPane" label="Resource" class="tab-pages" refreshOnShow="true">
                                    	<table id='resource' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th width="43%">Item</th>
                                          	<th width="11%">UoM</th>
                                            <th width="18%">Estimated</th>
                                            <th width="15%">Unit</th>
                                            <th width="13%">Estimated/Unit</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${planning_sequence_edit.resources}' var='resource' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${resource.resource.resource.code} ${resource.resource.resource.name}'/></td>
                                            <td><c:out value='${resource.unitOfMeasure.name}'/></td>
                                            <td><form:input id='#estimated[${status.index}]' path='resources[${status.index}].estimated' size='20' cssClass='input-disabled' cssStyle='text-align:right;' disabled='true'/></td>
                                            <td><form:input id='#unit[${status.index}]' path='resources[${status.index}].unit' size='20' cssClass='input-disabled' cssStyle='text-align:right;' disabled='true'/></td>
                                            <td><input id='#sum[${status.index}]' size='20' value="<fmt:formatNumber value='${resource.estimated/resource.unit}' pattern=',##0.00'/>" class='input-disabled' cssClass='rclass' disabled style="text-align:right;"/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="input" dojoType="ContentPane" label="Input Material" class="tab-pages" refreshOnShow="true">
                                    	<table id='iTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0" style="width:65%;">
                                        <thead>
                                        <tr>
                                          	<th>Item</th>
                                            <th width="12%">UoM</th>
                                            <th width="25%">Estimated Usage</th>
                                        </tr>
                                        </thead>
                                        <tbody id="iBody">
                                        <c:forEach items='${planning_sequence_edit.inputs}' var='in'>
                                        <tr>
                                        	<td><c:out value='${in.product.code} ${in.product.name}'/></td>
                                        	<td><c:out value='${in.unitOfMeasure.name}'/></td>
                                        	<td><fmt:formatNumber value='${in.estimated}' pattern=',##0'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="output" dojoType="ContentPane" label="Output Material" class="tab-pages" refreshOnShow="true">
                                    	<table id='oTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0" style="width:65%;">
                                        <thead>
                                        <tr>
                                          	<th width="52%">Item</th>
                                       	  <th width="12%">UoM</th>
                                       	  <th width="21%">Estimated output</th>
                                            <th width="15%">PH(%)</th>
                                        </tr>
                                        </thead>
                                        <tbody id="oBody">
                                        <c:forEach items='${planning_sequence_edit.outputs}' var='out'>
                                        <tr>
                                        	<td><c:out value='${out.product.code} ${out.product.name}'/></td>
                                        	<td><c:out value='${out.unitOfMeasure.name}'/></td>
                                        	<td><fmt:formatNumber value='${out.estimated}' pattern=',##0'/></td>
                                            <td><fmt:formatNumber value='${out.ph}' pattern=',##0'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                </div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	var iIndex = 0;
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Planning Sequence',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('#save').click(function(){		
			$.ajax({
				url:"<c:url value='/page/productionplanningsequenceadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Planning Sequence data......');
					$dialog.dialog('open');
				},
				success : function(obj) {
					if(obj)
					{
						if(obj.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productionplanningpreedit.htm?id='/>"+obj.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+obj.message);
						}
					}
				},
				error : function(xhr) {
					alert('Proccess fail '+xhr.responseText);
				},
			});
		});
	});
</script>