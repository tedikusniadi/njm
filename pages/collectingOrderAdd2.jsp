<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			var vehicleType = dojo.byId('vehicleType').value;
			var vehicle = dojo.byId('vehicle').value;
			var date = document.getElementById('dateid').value;
			
			if(date == null || date == '')
			{
				alert('Date cannot be empty!');
				return;
			}

			if(vehicleType == null || vehicleType == '')
			{
				alert('Vehicle Type cannot be empty!');
				return;
			}
			
			if(vehicle == null || vehicle == '')
			{
				alert('Vehicle cannot be empty!');
				return;
			}
		
			document.addForm.action = "<c:url value='/page/collectingorderadd.htm'/>";
			document.addForm.submit();
		}
				
		function openvehicle()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select company first!');
				return;
			}
		
			openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&type='/>"+document.getElementById('vehicleType').value+"&organization="+org.value);
		}
    
    function opendriver()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization='/>"+org.value);
	}
				
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Procurement > Pertamina Procurement > Collecting Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P25 - Collecting Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/collectingorderview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">ID :</td>
                                  	<td width="80%"><input name="code" value="Auto Number" size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <select id="org" class="combobox-ext" disabled='true'>
                                            <option value="${order_add.organization.id}"><c:out value='${order_add.organization.firstName} ${order_add.organization.lastName} ${order_add.organization.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" inputid="dateid" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Reference :</td>
                                  	<td width="80%"><a href="<c:url value='/page/loadingorderpreedit.htm?id=${order_add.loadingOrderPlan.loadingOrder.id}'/>"><c:out value='${order_add.loadingOrderPlan.no}'/></a></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true" selected='true'>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="32%">Product</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="9%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${order_add.loadingOrderPlan.items}' var='line'>
                                        <tr>
                                        	<td><c:out value='${line.item.product.code} - ${line.item.product.name}'/></td>
                                        	<td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.item.product.unitOfMeasure.measureId}'/></td>
                                            <td><c:out value='${line.note}'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<select class="combobox-ext" disabled>
                                                    <option ><c:out value='${order_add.loadingOrderPlan.loadingOrder.purchaseOrder.shipTo.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="status" dojoType="ContentPane" label="Delivery" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Vehicle Type :</td>
                                            <td>
                                                <select id="vehicleType" name="vehicleType" class="combobox-ext">
                                                </select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupvehicletypeview.htm?target=vehicleType'/>');" style="CURSOR:pointer;" title="Vehicle Type" />
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