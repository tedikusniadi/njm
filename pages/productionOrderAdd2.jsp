<%@ include file="/common/tld-common.jsp"%>


<h1 class="page-title">U30 - Production Order</h1>						
<div class="toolbar">
    <a class="item-button-list" href="<c:url value='/page/productionorderview.htm'/>"><span>List</span></a>
    <c:if test='${access.add}'>
    	<a class="item-button-back" style="cursor:pointer;"><span>back</span></a>
        <a class="item-button-save" style="cursor:pointer;" id='save'><span>Save</span></a>
    </c:if>
</div>

<div class="main-box">
    <form:form id="addForm" name="addForm" method="post" modelAttribute="production_order_add">
        <table width="100%" style="border:none" cellpadding="1">
        <tr>
            <td width="16%" align="right">Code</td>
            <td>:</td>
            <td width="84%"><input size="30" disabled class="input-disabled" value="Auto Generated"/></td>
        </tr>
        <tr>
            <td width="16%" align="right">Company</td>
            <td>:</td>
            <td width="84%">
            	<select id="org" class="combobox-ext">
                    <option><c:out value='${production_order_add.organization.firstName} ${production_order_add.organization.middleName} ${production_order_add.organization.lastName}'/></option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="16%" align="right">Production Plan No</td>
            <td>:</td>
            <td width="84%"><a href="<c:url value='/page/productionplanningpreedit.htm?id=${production_order_add.sequence.planning.id}'/>"><c:out value='${production_order_add.sequence.planning.code}'/></a></td>
        </tr>
                <tr>
            <td width="16%" align="right">Production Plan Name</td>
            <td>:</td>
            <td width="84%"><a href="<c:url value='/page/productionplanningpreedit.htm?id=${production_order_add.sequence.planning.id}'/>"><c:out value='${production_order_add.sequence.planning.name}'/></a></td>
        </tr>
        <tr>
            <td width="16%" align="right">Work Unit</td>
            <td>:</td>
            <td width="84%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_order_add.workUnit.id}'/>"><c:out value='${production_order_add.workUnit.code} ${production_order_add.workUnit.code}'/></a></td>
        </tr>
        <tr>
            <td align="right">Date</td>
			<td>:</td>
            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <td align="right">Estimated Date Start</td>
			<td>:</td>
            <td><input value="<fmt:formatDate value='${production_order_add.workStart}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size='15'/></td>
        </tr>
        <tr>
            <td align="right">Estimated Time Start</td>
			<td>:</td>
            <td><form:input id='timeStart' path='timeStart' size='15'/></td>
        </tr>
        <tr>
            <td align="right">Estimated Hours</td>
			<td>:</td>
            <td><form:input id='duration' path='duration' size='15' readonly='true'/></td>
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
        <c:forEach items="${production_order_add.sequence.resources}" var="resource">
        <tr>
            <td><c:out value='${resource.resource.resource.code} ${resource.resource.resource.name}'/></td>
            <td>Resource</td>
            <td><c:out value='${resource.unitOfMeasure.name}'/></td>
            <td style="text-align:right;"><fmt:formatNumber value='${resource.estimated}' pattern=',##0.00'/></td>
        </tr>
        </c:forEach>
        <c:forEach items="${production_order_add.sequence.inputs}" var="input">
        <tr>
            <td><c:out value='${input.product.code} ${input.product.name}'/></td>
            <td>BOM</td>
            <td><c:out value='${input.unitOfMeasure.name}'/></td>
            <td style="text-align:right;"><fmt:formatNumber value='${input.estimated}' pattern=',##0.00'/></td>
        </tr>
        </c:forEach>
        <c:forEach items="${production_order_add.sequence.outputs}" var="out">
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
<script type="text/javascript" src="<c:url value='/dojo/dojo.js'/>"></script>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	dojo.require("dojo.widget.*");
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		$('.item-button-back').click(function(){
			$('#se-contents').load("<c:url value='/page/productionorderpreadd1.htm?unit=${production_order_add.workUnit.id}&date=${sDate}'/>");
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