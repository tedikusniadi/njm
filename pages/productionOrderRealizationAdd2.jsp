<%@ include file="/common/tld-common.jsp"%>


<h1 class="page-title">U50 - Production Order Realization</h1>						
<div class="toolbar">
    <a class="item-button-list" href="<c:url value='/page/productionorderrealizationview.htm'/>"><span>List</span></a>
    <c:if test='${access.add}'>
    	<a class="item-button-back" style="cursor:pointer;"><span>back</span></a>
        <a class="item-button-save" style="cursor:pointer;" id='save'><span>Save</span></a>
    </c:if>
</div>

<div class="main-box">
    <form:form id="addForm" name="addForm" method="post" modelAttribute="production_order_realization_add">
        <table width="100%" style="border:none" cellpadding="1">
        <tr>
            <td width="20%" align="right">Code</td>
          <td width="1%">:</td>
          <td width="43%"><input size="30" disabled class="input-disabled" value="Auto Generated"/></td>
          <td width="36%" rowspan="8" valign="top">
   	<fieldset>
                	<legend><strong>Material Request</strong></legend>
                    <c:forEach items='${production_order_realization_add.productionOrder.requests}' var='req'>
                    	<a href="<c:url value='/page/productionmaterialrequestpreedit.htm?id=${req.id}'/>"><c:out value='${req.code}'/></a><br/>
                    </c:forEach>
            </fieldset>
                <div class="clears">&nbsp;</div>
<fieldset>
                	<legend><strong>Realization</strong></legend>
                    <table width="100%" cellpadding="1" cellspacing="0">
                    <tr>
                    	<td width="31%" align="right">Actual Date Start</td>
                        <td>:</td>
                        <td width="69%"><input id="start" name="start" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                    </tr>
                    <tr>
                    	<td align="right">Actual Date finish</td>
                        <td>:</td>
                    	<td><input id="finish" name="finish" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                    </tr>
                    </table>
                </fieldset>
          </td>
        </tr>
        <tr>
            <td width="20%" align="right">Company</td>
          <td>:</td>
            <td width="43%">
<select id="org" class="combobox-ext">
                    <option value='${production_order_realization_add.organization.id}'><c:out value='${production_order_realization_add.organization.firstName} ${production_order_realization_add.organization.middleName} ${production_order_realization_add.organization.lastName}'/></option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right">Work Unit</td>
          <td>:</td>
            <td width="43%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_order_realization_add.productionOrder.workUnit.id}'/>">
          <c:out value='${production_order_realization_add.productionOrder.workUnit.code} ${production_order_realization_add.productionOrder.workUnit.code}'/></a></td>
        </tr>
        <tr>
            <td align="right">Date</td>
			<td>:</td>
            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <td align="right">Estimated Date Start</td>
			<td>:</td>
            <td><input disabled class="input-disabled" size="10" value="<fmt:formatDate value='${production_order_realization_add.productionOrder.workStart}' pattern='dd-MM-yyyy'/>"/></td>
        </tr>
        <tr>
            <td align="right">Estimated Time Start</td>
			<td>:</td>
            <td><input disabled class="input-disabled" size="5" value="<fmt:formatNumber value='${production_order_realization_add.productionOrder.timeStart}' pattern='##0'/>"/></td>
        </tr>
        <tr>
            <td align="right">Estimated Hours</td>
			<td>:</td>
            <td><input disabled class="input-disabled" size="5" value="<fmt:formatNumber value='${production_order_realization_add.productionOrder.duration}' pattern='##0'/>"/></td>
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
        <c:forEach items='${production_order_realization_add.items}' var='item' varStatus='status'>
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
            	<form:input class='actual' id='actual[${status.index}]' path='items[${status.index}].actual' size='9' cssStyle='text-align:right;'/>
            </td>
            <td>
            	<c:if test="${item.item.type != 'Resource'}">
                    <form:select id='ware[${status.index}]' path='items[${status.index}].warehouse' cssClass='combobox'>
                    </form:select>
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
<script type="text/javascript" src="<c:url value='/dojo/dojo.js'/>"></script>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	dojo.require("dojo.widget.*");
	
	$(function(){
		$.ajax({
			url:"<c:url value='/page/popupfacilityjsonview.htm'/>",
			data:{organization:$('#org').val()},
			method : 'GET',
			dataType : 'json',
			success : function(json) {
				if(json)
				{
					if(json.status == 'OK')
					{
						$warehouse = $('.combobox');
							
						$.each(json.facilitys,function(idx,obj){
							$opt = $('<option></option>');
							$opt.attr('value',obj.id);
							$opt.html(obj.name);
							
							$opt.appendTo($warehouse);
						});
					}
				}
			},
			error : function(xhr) {
				alert('Proccess fail '+xhr.responseText);
			},
		});
	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		$('.item-button-back').click(function(){
			$('#se-contents').load("<c:url value='/page/productionorderrealizationpreadd1.htm?unit=${production_order_realization_add.productionOrder.workUnit.id}&date=${sDate}'/>");
		});
		
		$('#save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productionorderrealizationadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Order Realization data......');
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