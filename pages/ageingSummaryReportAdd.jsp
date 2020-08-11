<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Ageing Summary</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			document.reportForm.action = "<c:url value='/page/ageingsummaryreportview.htm'/>";
			document.reportForm.submit();
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
		
		function opencustomer()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
		}
		
		function openLeasing()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=leasing&organization='/>"+org.value);
		}
	</script>
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
			<td width="60%">Financial Accounting > Account Receivables > Ageing Summary</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F26 - Ageing Summary</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td width="21%"><div align="right">Organization :</div></td>
                                    <td width="79%">
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
                                    <td align="right">Date To :</td>
                                    <td>
                                        <!-- <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp; -->
                                        <input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Customer :</div></td>
                                    <td>
                                        <select id="customer" name="customer" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Leasing :</div></td>
                                    <td>
                                        <select id="leasing" name="customerLeasing" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openLeasing();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
							    <tr>
									<td nowrap="nowrap" align="right">Main Dealer :</td>
									<td>
										<select id="mainDealer" name="customerMainDealer" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opensupplierpersonal('mainDealer')" style="CURSOR:pointer;" title="Pelanggan" />
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>