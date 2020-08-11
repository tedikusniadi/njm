<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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
			<td width="60%">Sales > Delivery Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S11 - Delivery Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryorderview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">ID :</td>
                                  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty order_add.organization}'>
                                            <form:option value='${order_add.organization.id}' label='${order_add.organization.firstName} ${order_add.organization.lastName} ${order_add.organization.middleName}' />
                                        </c:if>
                                    	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" value="<fmt:formatDate value='${order_add.date}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Customer :</td>
                                    <td width="80%"><input value="${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Reference :</td>
                                    <td width="80%"><a href="<c:url value='/page/deliveryplanningpreedit.htm?id=${order_add.deliveryPlanningSequence.deliveryPlanning.id}'/>"><c:out value='${order_add.deliveryPlanningSequence.deliveryPlanning.code}.${order_add.deliveryPlanningSequence.no}'/></a></td>
                                </tr>
                                <tr>
                                    <td align="right">Warehouse : </td>
                                    <td>
                                        <select class="combobox-ext" disabled>
                                            <option><c:out value='${order_add.deliveryPlanningSequence.facility.name}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Note : </td>
                                    <td><form:textarea path='note' rows='6' cols='55'/></td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Product" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="34%">Product</th>
                                            <th width="13%">Quantity</th>
                                            <th width="7%">UoM</th>
                                            <th width="46%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_add.items}" var="line" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${line.item.sequenceable.product.code} - ${line.item.sequenceable.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
                                            <td><form:input path='items[${status.index}].note' size='60'/></td> 
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="4">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="exp" dojoType="ContentPane" label="Shipping & Expedition" class="tab-pages" refreshOnShow="true">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Expedition :</td>
                                            <td>
                                                <form:select id="expedition" path="expedition" cssClass="combobox-ext">
                                                <c:if test='${not empty order_add.expedition}'>
                                                    <form:option value='${order_add.expedition.id}' label='${order_add.expedition.firstName} ${order_add.expedition.lastName} ${order_add.expedition.middleName}' />
                                                </c:if>
                                            	</form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="showexpedition();" style="CURSOR:pointer;" title="Expedition" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Vehicle :</td>
                                            <td>
                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_add.vehicle}'>
                                                        <form:option value='${order_add.vehicle.id}' label='${order_add.vehicle.name}' />
                                                    </c:if>
                                            	</form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openvehicle();" style="CURSOR:pointer;" title="Vehicle" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Driver :</td>
                                            <td>
                                                <form:select id="driver" path="driver" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_add.driver}'>
                                                        <form:option value='${order_add.driver.id}' label='${order_add.driver.firstName} ${order_add.driver.lastName} ${order_add.driver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opendriver();" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rit :</td>
                                            <td><form:input id='rit' path='rit' size='10'/></td>
                                        </tr>
                                        <tr>
                                            <td width="20%" align="right">Shipping Address : </td>
                                            <td width="80%">
                                            	 <select class="combobox-ext" disabled>
                                                    <option><c:out value='${order_add.deliveryPlanningSequence.postalAddress.address}'/></option>
                                                </select>
                                          	</td>
                                        </tr>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Delivery Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			var date = dojo.widget.byId('date').getValue();
			var vehicle = dojo.byId('vehicle').value;
			var driver = dojo.byId('driver').value;
			var rit = dojo.byId('rit').value;
			
			if(!vehicle || !driver || !rit || !date)
			{
				alert('Date, Vehicle, Driver or Rit cannot be empty!');
				return;
			}

			
			$.ajax({
				url:"<c:url value='/page/deliveryorderadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Delivery Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/deliveryorderprint.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});		
		});
	});
			
	function showshipping()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		
		openpopup('<c:url value='/page/popuppostaladdressview.htm?target=postalAddress&party='/>'+org.value);
	}
	
	function showexpedition()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		
		openpopup('<c:url value='/page/popupexpeditionview.htm?target=expedition&organization='/>'+org.value);
	}
	
	function openvehicle()
	{
		var expedition = dojo.byId('expedition').value;
		if(!expedition || expedition == '')
		{
			alert('Please select Expedition first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&organization='/>"+expedition);
	}
	
	function opendriver()
	{
		var org = document.getElementById('expedition');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization='/>"+org.value);
	}
</script>