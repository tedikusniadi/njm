<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Order Realization > Edit</title>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
    
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
			<td width="60%">Production > Production Order Realization > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">U50 - Production Order Realization</h1>						
                        <div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/productionorderrealizationview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                                <a class="item-button-save" style="cursor:pointer;" id='save'><span>Save</span></a>
                            </c:if>
                        </div>
                        
                        <div class="main-box">
                            <form:form id="addForm" name="addForm" method="post" modelAttribute="production_order_realization_edit">
                                <table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="20%" align="right">Code</td>
                                  	<td width="1%">:</td>
                                  	<td width="43%"><input size="30" disabled class="input-disabled" value="Auto Generated"/></td>
                                  	<td width="36%" rowspan="8" valign="top">
                            			<fieldset>
                                            <legend><strong>Journal Entry</strong></legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${production_order_realization_edit.journalEntry.id}'/>"><c:out value='${production_order_realization_edit.journalEntry.code}'/></a><br/>
                                    	</fieldset>
                                        <fieldset>
                                            <legend><strong>Material Request</strong></legend>
                                            <c:forEach items='${production_order_realization_edit.productionOrder.requests}' var='req'>
                                                <a href="<c:url value='/page/productionmaterialrequestpreedit.htm?id=${req.id}'/>"><c:out value='${req.code}'/></a><br/>
                                            </c:forEach>
                                    	</fieldset>
                        				<fieldset>
                                            <legend><strong>Realization</strong></legend>
                                            <table width="100%" cellpadding="1" cellspacing="0">
                                            <tr>
                                                <td width="31%" align="right">Actual Date Start</td>
                                                <td>:</td>
                                                <td width="69%"><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${production_order_realization_edit.start}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Actual Date finish</td>
                                                <td>:</td>
                                                <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${production_order_realization_edit.finish}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                <tr>
                                    <td width="20%" align="right">Company</td>
                                  	<td>:</td>
                                    <td width="43%">
                        				<select id="org" class="combobox-ext" disabled='true'>
                                            <option value='${production_order_realization_edit.organization.id}'><c:out value='${production_order_realization_edit.organization.firstName} ${production_order_realization_edit.organization.middleName} ${production_order_realization_edit.organization.lastName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%" align="right">Work Unit</td>
                                  <td>:</td>
                                    <td width="43%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_order_realization_edit.productionOrder.workUnit.id}'/>">
                                  <c:out value='${production_order_realization_edit.productionOrder.workUnit.code} ${production_order_realization_edit.productionOrder.workUnit.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td align="right">Date</td>
                                    <td>:</td>
                                    <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${production_order_realization_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Date Start</td>
                                    <td>:</td>
                                    <td><input disabled class="input-disabled" size="10" value="<fmt:formatDate value='${production_order_realization_edit.productionOrder.workStart}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Time Start</td>
                                    <td>:</td>
                                    <td><input disabled class="input-disabled" size="5" value="<fmt:formatNumber value='${production_order_realization_edit.productionOrder.timeStart}' pattern='##0'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Estimated Hours</td>
                                    <td>:</td>
                                    <td><input disabled class="input-disabled" size="5" value="<fmt:formatNumber value='${production_order_realization_edit.productionOrder.duration}' pattern='##0'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Note</td>
                                    <td>:</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="27%">Item</th>
                                    <th width="11%">Type</th>
                                    <th width="5%">UoM</th>
                                    <th width="11%" style="text-align:right;">Estimated Usage</th>
                                    <th width="11%" style="text-align:right;">Material Req</th>
                                    <th width="14%" style="text-align:right;">Actual Usage/Result</th>
                                    <th width="21%" style="text-align:center;">Warehouse</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${production_order_realization_edit.items}' var='item' varStatus='status'>
                                <tr>
                                    <td><c:out value='${item.item.itemName}'/></td>
                                    <td><c:out value='${item.item.type}'/></td>
                                    <td><c:out value='${item.item.unitOfMeasure.name}'/></td>
                                    <td style="text-align:right;">
                                        <c:if test="${item.item.type != 'Output Material'}">
                                            <fmt:formatNumber value='${item.item.estimated}' pattern=',##0.00'/>
                                        </c:if>
                                    </td>
                                    <td style="text-align:right;">
                                        <c:if test="${item.item.type != 'Output Material' and item.item.type != 'Resource'}">
                                            <fmt:formatNumber value='${item.item.material}' pattern=',##0.00'/>
                                        </c:if>
                                    </td>
                                    <td style="text-align:right;">
                                        <c:if test="${item.item.type != 'Resource'}">
                                            <fmt:formatNumber value='${item.actual}' pattern=',##0.00'/>
                                        </c:if>
                                    </td>
                                    <td style="text-align:center;">
                                        <c:if test="${item.item.type != 'Resource'}">
                                            <c:out value='${item.warehouse.name}'/>
                                        </c:if>
                                    </td>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('#save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productionorderrealizationedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Production Order Realization data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
							window.location = "<c:url value='/page/productionorderrealizationview.htm'/>";
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