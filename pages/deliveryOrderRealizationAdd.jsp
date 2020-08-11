<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Order Realization >> Add</title>
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
			<td width="60%">Sales > Delivery Order Realization > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Delivery Order Realization</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryorderrealizationview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="54%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td width="45%" align="right">Date :</td>
                                            <td width="53%"><input id="date" name="date" value="<fmt:formatDate value='${order_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select id="org" path="organization" cssClass="combobox-ext">
                                                    <option><c:out value='${order_add.organization.firstName} ${order_add.organization.lastName} ${order_add.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">DO Date :</td>
                                            <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_add.deliveryOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Customer :</td>
                                          <td width="74%"><input value="${order_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Reference :</td>
                                          <td width="74%"><a href="<c:url value='/page/deliveryorderpreedit.htm?id=${order_add.deliveryOrder.id}'/>">
                                          <c:out value='${order_add.deliveryOrder.code}'/></a></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                    <option><c:out value='${order_add.deliveryOrder.deliveryPlanningSequence.facility.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="46%" valign="top">
   	    		   						<fieldset>
                                        	<legend>DO Realization</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<td width="41%" align="right">Delivery Acceptance Date</td>
                                                <td width="2%">:</td>
                                           	  	<td width="57%"><input id="acceptanceDate" name="acceptanceDate" value="<fmt:formatDate value='${order_add.acceptanceDate}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Document Return Date</td>
                                                <td>:</td>
                                                <td><input id="docDate" name="docDate" value="<fmt:formatDate value='${order_add.docDate}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Note</td>
                                                <td>:</td>
                                           	  <td><form:textarea path='note' rows='4' cols='30'/></td>
                                        	</tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Product" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="31%">Product</th>
                                       	  <th width="8%">Qty</th>
                                       	  <th width="8%">Accepted</th>
                                       	  <th width="8%">Canceled</th>
                                       	  <th width="8%">Resend</th>
                                       	  <th width="6%" style="text-align:center;">UoM</th>
                                          <th width="15%">Container</th>
                                          <th width="16%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_add.items}" var="line" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${line.item.item.sequenceable.product.code} - ${line.item.item.sequenceable.product.name}'/></td>
                                            <td><input disabled class="input-disabled" id='quan_${status.index}' size="7" style="text-align:right" value="<fmt:formatNumber value='${line.item.item.quantity}' pattern=',##0.00'/>"/></td>
                                            <td><input class="entry" index='${status.index}' identity='accepted' id='accepted_${status.index}' name='items[${status.index}].accepted' size='7' value="${line.item.item.quantity}" style="text-align:right;"/></td>
                                            <td><input class="entry" index='${status.index}' identity='returned' id='returned_${status.index}' name='items[${status.index}].returned' value="0" size='7' style="text-align:right;"/></td>
                                            <td><input id='resend_${status.index}' disabled class="input-disabled" value="0" size="7" style="text-align:right;"/></td>
                                            <td style="text-align:center;"><c:out value='${line.item.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
                                            <td>
                                                <form:select id='container[${status.index}]' path='items[${status.index}].container' cssStyle='width:100px;'>
                                                </form:select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('${status.index}');" style="CURSOR:pointer;" title="Container" />
                                            </td>
                                            <td><form:input path='items[${status.index}].note' size='20'/></td> 
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
                                            <td><input size="5" disabled class="input-disabled" value="${order_add.deliveryOrder.rit}"/></td>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.entry').change(function(e){
			$triger = $(e.target);
			$index = $triger.attr('index');			
			$quan = $('#quan_'+$index).val().toNumber();
			$accepted = $('#accepted_'+$index);
			$returned = $('#returned_'+$index);
			$resend = $('#resend_'+$index);
		
			if($accepted && $returned)
			{
        if($triger.attr('identity') == 'accepted')
				{
					$input = e.target.value.toNumber();
					if($input >= $quan)
					{
						$accepted.val($quan);
						$returned.val(0);
						$resend.val(0);
					}
					else
					{
						$resend.val($quan-$input);
						$returned.val(0);
					}
				}
				else
				{
					$input = e.target.value.toNumber();
					if($input > $quan-$accepted.val().toNumber())
					{
						alert('Returned quantity cannot > '+($quan-$accepted.val().toNumber()));
						
						e.target.value = $quan-$accepted.val().toNumber();
						$resend.val(0);
					
						return;
					}
					else
						$resend.val($quan-$accepted.val().toNumber()-$input);
				}
			}
		});
	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'DO Realization',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			<c:if test='${empty order_add.deliveryOrder.vehicle}'>
				alert('Vehilce cannot be empty!');
				return;
			</c:if>
			
			<c:if test='${empty order_add.deliveryOrder.driver}'>
				alert('Driver cannot be empty!');
				return;
			</c:if>
		
			var date = dojo.widget.byId('date');			
			if(date.getValue() == null || date.getValue() == '')
			{
				alert('Date cannot be empty!');
				return;
			}
		
			var acceptanceDate = dojo.widget.byId('acceptanceDate');
			if(acceptanceDate.getValue() == null || acceptanceDate.getValue() == '')
			{
				alert('Acceptance Date cannot be empty!');
				return;
			}
			
			<c:forEach items="${order.items}" var="line" varStatus='status'>
				var __grid__ = document.getElementById('grid[${status.index}]');
				var __container__ = document.getElementById('container[${status.index}]');
				
				if(!__grid__.value)
				{
					alert('Grid can not be empty!');
					return;
				}
				
				if(!__container__.value)
				{
					alert('Container can not be empty!');
					return;
				}
			</c:forEach>
			
			$.ajax({
				url:"<c:url value='/page/deliveryorderrealizationadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving DO Realization data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/deliveryorderrealizationview.htm'/>";
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
				
	function rejected(ori,used,index)
	{
		var returned = document.getElementById('returned['+index+']').value;
		var accepted = document.getElementById('accepted['+index+']').value;
		document.getElementById('rejected['+index+']').value = parseFloat(ori)-(parseFloat(accepted)+parseFloat(returned));
	}
	
	function opencontainer(index)
	{
		openpopup("<c:url value='/page/popupcontainerbyfacilityview.htm?facility=${order_add.deliveryOrder.deliveryPlanningSequence.facility.id}&target=container['/>"+index+"]&index="+index);
	}
	
	function showexpedition()
	{
		openpopup("<c:url value='/page/popupexpeditionview.htm?target=expedition&organization=${order_add.organization.id}'/>");
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
		var expedition = dojo.byId('expedition').value;
		if(!expedition || expedition == '')
		{
			alert('Please select Expedition first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization='/>"+expedition);
	}
</script>