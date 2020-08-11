<%@ include file="/common/tld-common.jsp"%>

<%@ include file="/common/popup.jsp"%>

<h1 class="page-title">U40 - Production Material Request</h1>						
<div class="toolbar">
    <c:if test='${access.add}'>
    	<a class="item-button-back" style="cursor:pointer;"><span>back</span></a>
        <a class="item-button-save" style="cursor:pointer;" id='save'><span>Save</span></a>
    </c:if>
</div>

<div class="main-box">
    <form:form id="addForm" name="addForm" method="post" modelAttribute="production_material_request_add">
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
            	<form:select id="org" path='organization' class="combobox-ext">
                	<form:option value='${production_material_request_add.organization.id}' label='${production_material_request_add.organization.firstName} ${production_material_request_add.organization.middleName} ${production_material_request_add.organization.lastName}'/>
                </form:select>
                &nbsp;
                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
            </td>
        </tr>
        <tr>
            <td align="right">Date</td>
			<td>:</td>
            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" value="<fmt:formatDate value='${production_material_request_add.date}' pattern='MM/dd/yyyy'/>" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <td width="16%" align="right">Production Order No</td>
            <td>:</td>
            <td width="84%"><a href="<c:url value='/page/productionorderpreedit.htm?id=${production_material_request_add.productionOrder.id}'/>"><c:out value='${production_material_request_add.productionOrder.code}'/></a></td>
        </tr>
        <tr>
            <td width="16%" align="right">Work Unit</td>
            <td>:</td>
            <td width="84%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_material_request_add.productionOrder.workUnit.id}'/>"><c:out value='${production_material_request_add.productionOrder.workUnit.code} ${production_material_request_add.productionOrder.workUnit.code}'/></a></td>
        </tr>
        <tr>
            <td align="right">Warehouse</td>
			<td>:</td>
            <td>
            	<form:select id='facility' path='facility' cssClass='combobox'>
                </form:select>
                &nbsp;
                <img src="assets/icons/list_extensions.gif" onclick="javascript:openwarehouse();" style="CURSOR:pointer;" title="Warehouse" />
            </td>
        </tr>
        <tr>
            <td align="right">Delivery Date</td>
			<td>:</td>
            <td><input id="delivery" name="delivery" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>	</td>
        </tr>
        </table>
        <div class="clears">&nbsp;</div>
        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" style="width:75%;">
        <thead>
        <tr>
            <th width="36%">Item</th>
          	<th width="17%">Estimated Usage</th>
          	<th width="15%">Requested Qty</th>
            <th width="19%">Request Qty</th>
          <th width="13%">UoM</th>
        </tr>
        <thead>
        <tbody>
        <c:forEach items="${production_material_request_add.items}" var="item" varStatus='status'>
        <tr>
            <td><c:out value='${item.input.product.code} ${item.input.product.name}'/></td>
            <td><fmt:formatNumber value='${item.estimated}' pattern=',##0.00'/></td>
            <td><fmt:formatNumber value='${item.estimated-item.quantity}' pattern=',##0.00'/></td>
            <td><form:input path='items[${status.index}].quantity' size='12'/></td>
        	<td><c:out value='${item.input.unitOfMeasure.name}'/></td>
        </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
        </tfoot>
        </table>
    </form:form>
</div>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/dojo/dojo.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	function openwarehouse()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?target=facility&organization='/>"+org.value);
	}
	
	function openshipping()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		openpopup("<c:url value='/page/popuppostaladdressview.htm?target=shippingAddress&party='/>"+org.value);
	}
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Material Request',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		$('.item-button-back').click(function(){
			$('#se-contents').load("<c:url value='/page/productionmaterialrequestpreadd1.htm'/>");
		});
		
		$('#save').click(function(){
			if(!$('#org').val())
			{
				alert('Company cannot be empty!');
				return;
			}
			
			if(!dojo.widget.byId('date').getDate())
			{
				alert('Date cannot be empty!');
				return;
			}
		
			if(!$('#facility').val())
			{
				alert('Warehouse cannot be empty!');
				return;
			}
			
			if(!dojo.widget.byId('delivery').getDate())
			{
				alert('Delivery date cannot be empty!');
				return;
			}
		
			$.ajax({
				url:"<c:url value='/page/productionmaterialrequestadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Material Request data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
							window.location = "<c:url value='/page/productionmaterialrequestview.htm'/>";
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
						}
					}
				},
				error : function(xhr) {
					console.log(xhr.responseText);
				},
			});
		});
	});
</script>