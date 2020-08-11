<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Transport Outsource > Transport Management > Shipment > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D12 - Shipment</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/shipmentview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="shipment_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="14%" nowrap="nowrap" align="right">ID :</td>
						  	  	  <td colspan="2"><input value="Auto Generated" class='input-disabled' size='50'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td width="35%">
						  <form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty shipment_add.organization}'>
                                               	<form:option value='${shipment_add.organization.id}' label='${shipment_add.organization.firstName} ${shipment_add.organization.lastName} ${shipment_add.organization.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
                                  <td width="51%"><form:errors path='organization' cssClass='error'/></td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <td width="51%"><form:errors path='date' cssClass='error'/></td>
                                  </tr>
								<tr>
                                	<td align="right">Currency :</td>
                                    <td colspan="2">
                                    	<form:select id='currency' path='currency'>
                                        	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='exchangeType' path='exchangeType'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td colspan="2">
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
                                           	<c:if test='${not empty shipment_add.vehicle}'>
                                               	<form:option value='${shipment_add.vehicle.id}' label='${shipment_add.vehicle.name}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openvehicle();" style="CURSOR:pointer;" title="Vehicle" />
									</td>
                                    <td width="51%"><form:errors path='vehicle' cssClass='error'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
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
<script type="text/javascript">
	function save()
	{		
		if(dojo.widget.byId('date').getValue() == null || dojo.widget.byId('date').getValue() == '')
		{
			alert('Date cannot be empty!');
			return;
		}
	
		if(dojo.byId('vehicleType').value == null || dojo.byId('vehicleType').value == '')
		{
			alert('Vehicle Type cannot be empty!');
			return;
		}
		
		if(dojo.byId('vehicle').value == null || dojo.byId('vehicle').value == '')
		{
			alert('Vehicle cannot be empty!');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/shipmentadd.htm'/>";
		document.addForm.submit();
	}
			
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
	
	function showdriver()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization='/>"+org.value);
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
</script>