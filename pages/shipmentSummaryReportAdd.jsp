<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment Recapitulation Report</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Transport Outsource > Transport Outsource Reports > Shipment Summary Report</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D16 - Shipment Summary Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Company :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                 <tr>
									<td nowrap="nowrap" align="right">Customer :</td>
									<td>
										<select id="customer" name="customer" class="combobox-ext">
                                           	<c:if test='${not empty customer}'>
                                               	<option value='${customer.id}'>${customer.firstName} ${customer.lastName} ${customer.middleName}</option>
                                            </c:if>
										</select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
									</td>
								</tr>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>								
                                <tr>
                                    <td><div align="right">Vehicle Type :</div></td>
                                    <td>
                                        <select id="vehicleType" name="vehicleType" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupvehicletypeview.htm?target=vehicleType'/>');" style="CURSOR:pointer;" title="Vehicle Type" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Vehicle :</div></td>
                                    <td>
                                        <select id="vehicle" name="vehicle" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openvehicle();" style="CURSOR:pointer;" title="Vehicle" />
                                    </td>
                                </tr>                                
                                <tr>
									<td nowrap="nowrap" align="right">Driver :</td>
									<td>
									    <select id="driver" name="driver" class="combobox-ext">
                                        </select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="showdriver();" style="CURSOR:pointer;" title="Driver" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Invoiced :</td>
									<td>
									    <select id="invoiced" name="billed" class="combobox">
                                        	<option value="">&nbsp;</option>
                                            <option value="true">YES</option>
                                            <option value="false">NO</option>
                                        </select>
									</td>
								</tr>
				  				</table>
							</form>
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
<script type="text/javascript">
	function generate()
	{ 
		if(document.getElementById('org').value == null || document.getElementById('org').value == '')
		{
			alert('Please select company first!');
			return;
		}
	
		document.reportForm.action = "<c:url value='/page/shipmentsummaryreportview.htm'/>";
		document.reportForm.submit();
	}
	
	function opencustomer()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
			
		var vehicle = document.getElementById('vehicle');
		
		for(var idx=vehicle.options.length;idx>=0;idx--)
			vehicle.remove(vehicle.selectedIndex);
			
		var vehicleType = document.getElementById('vehicleType');
		
		for(var idx=org.options.length;idx>=0;idx--)
			vehicleType.remove(vehicleType.selectedIndex);
		
		document.reportForm.reset();
	}
	
	function openvehicle()
	{
		openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&type='/>"+document.getElementById('vehicleType').value);
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
</script>