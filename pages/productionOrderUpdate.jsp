<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/productionOrderFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Production > Production Order > Edit</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<%@ include file="/common/tld-common.jsp"%>
						
                        
                        <h1 class="page-title">U30 - Production Order</h1>						
                        <div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/productionorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
                                <a class="item-button-save" style="cursor:pointer;" id='save'><span>Save</span></a>
                            </c:if>
                        </div>
                        
                        <div class="main-box">
                            <form:form id="addForm" name="addForm" method="post" modelAttribute="production_order_edit">
                                <table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="16%" align="right">Code</td>
                                    <td>:</td>
                                    <td width="84%"><input size="30" disabled class="input-disabled" value="<c:out value='${production_order_edit.code}'/>"/></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Company</td>
                                    <td>:</td>
                                    <td width="84%">
                                        <select id="org" class="combobox-ext">
                                            <option><c:out value='${production_order_edit.organization.firstName} ${production_order_edit.organization.middleName} ${production_order_edit.organization.lastName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Production Plan No</td>
                                    <td>:</td>
                                    <td width="84%"><a href="<c:url value='/page/productionplanningpreedit.htm?id=${production_order_edit.sequence.planning.id}'/>"><c:out value='${production_order_edit.sequence.planning.code}'/></a></td>
                                </tr>
                                        <tr>
                                    <td width="16%" align="right">Production Plan Name</td>
                                    <td>:</td>
                                    <td width="84%"><a href="<c:url value='/page/productionplanningpreedit.htm?id=${production_order_edit.sequence.planning.id}'/>"><c:out value='${production_order_edit.sequence.planning.name}'/></a></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Work Unit</td>
                                    <td>:</td>
                                    <td width="84%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_order_edit.workUnit.id}'/>"><c:out value='${production_order_edit.workUnit.code} ${production_order_edit.workUnit.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td align="right">Date</td>
                                    <td>:</td>
                                    <td><input value="<fmt:formatDate value='${production_order_edit.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size='10'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Date Start</td>
                                    <td>:</td>
                                    <td><input value="<fmt:formatDate value='${production_order_edit.workStart}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size='10'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Time Start</td>
                                    <td>:</td>
                                    <td><form:input id='timeStart' path='timeStart' size='10' disabled='true'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Hours</td>
                                    <td>:</td>
                                    <td><form:input id='duration' path='duration' size='10' disabled='true'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Note</td>
                                    <td>:</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" style="width:75%;">
                                <thead>
                                <tr>
                                    <th width="46%">Item</th>
                                    <th width="16%">Type</th>
                                    <th width="16%">UoM</th>
                                    <th width="22%" style="text-align:right;">Estimated Usegae</th>
                                </tr>
                                <thead>
                                <tbody>
                                <c:forEach items="${production_order_edit.sequence.resources}" var="resource">
                                <tr>
                                    <td><c:out value='${resource.resource.resource.code} ${resource.resource.resource.name}'/></td>
                                    <td>Resource</td>
                                    <td><c:out value='${resource.unitOfMeasure.name}'/></td>
                                    <td style="text-align:right;"><fmt:formatNumber value='${resource.estimated}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <c:forEach items="${production_order_edit.sequence.inputs}" var="input">
                                <tr>
                                    <td><c:out value='${input.product.code} ${input.product.name}'/></td>
                                    <td>BOM</td>
                                    <td><c:out value='${input.unitOfMeasure.name}'/></td>
                                    <td style="text-align:right;"><fmt:formatNumber value='${input.estimated}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <c:forEach items="${production_order_edit.sequence.outputs}" var="out">
                                <tr>
                                    <td><c:out value='${out.product.code} ${out.product.name}'/></td>
                                    <td>Output Material</td>
                                    <td><c:out value='${out.unitOfMeasure.name}'/></td>
                                    <td style="text-align:right;"><fmt:formatNumber value='${out.estimated}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                </tfoot>
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
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		$('.item-button-back').click(function(){
			$('#se-contents').load("<c:url value='/page/productionorderpreadd1.htm?unit=${production_order_edit.workUnit.id}&date=${sDate}'/>");
		});
		
		$('#save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productionorderadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
							window.location = "<c:url value='/page/productionorderview.htm'/>";
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
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