<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Report Shipment Summary</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/laporanShipmentSummaryReport.css"); -->
	</style>
	<style type="text/css" media="print">
		<!-- @import url("assets/laporanShipmentSummaryReport.css"); -->
	</style>	
    <script type="text/javascript">		
		function printPage(){
	   		print();
		}		
	</script>


</head>
<!-- BEGIN OF BODY -->
<body>
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
			<!-- main menu -->
			<%@ include file="/common/sirius-menu.jsp"%>
			<!-- /main menu -->
			
			<!-- tips & page navigator -->
			<div id="se-navigator">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td width="60%">
		
						</td>
						<td width="40%" align="right">
							<%@ include file="/common/welcome.jsp"%>
						</td>
					</tr>
				</table>		
  	     </div>
	</div>	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						
					<div class="area" dojoType="Container" id="quick_link_container">
						<!-- Top toolbar -->
							  <div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/shipmentsummaryreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/shipmentsummaryreportexport.xls?organization=${organization.id}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>&vehicle=${vehicle}&vehicleType=${vehicleType}&driver=${driver}"><span>Export</span></a>
							  </div>
					  </div>

	<div class="main-box">
		<div id="main_container">
			<table width="203" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div align="left">
								<%--<img src="images/logo2.gif" alt="image" title="image">--%>
							</div>								
						</td>
					<td>&nbsp;</td>
					</tr>
			</table>

				<div class="pageTitle">Report Shipment Summary</div>
				<div class="CSS"> &nbsp;</div><br>

					<table width="100%" border="0" cellpadding="2" cellspacing="0" class="CSS1">
					<tr>
						<td width="111">Company</td>
						<td width="13" align="center">:</td>
						<td width="401">&nbsp;<c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
					    <td width="83">&nbsp;</td>
					    <td width="13">&nbsp;</td>
					    <td width="246">&nbsp;</td>
					</tr>
					<tr>
						<td>Shipment Period </td>
						<td align="center">:</td>
						<td>&nbsp;<fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> - <fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					</tr>
					<tr>
					  <td>Vehicle </td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strvehicle}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
					<tr>
					  <td>Vehicle Type </td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strvehicletype}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
					<tr>
					  <td>Driver</td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strdriver}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
					</table>
			  </div>
						<table width="100%" class="CSS1" cellpadding="3" cellspacing="0" style="border:1px solid black; border-right:none; border-left:none; border-bottom:none;">
						<tr class="CSS" style="height:28px;">
							<td width="8%" align="center" valign="middle" class="bottom_left_right">Date</td>
						  	<td width="9%" align="center" valign="middle" class="bottom_right">Driver</td>
					      	<td width="4%" align="center" valign="middle" class="bottom_right">Rit</td>
						  	<td width="20%" align="center" valign="middle" class="bottom_right2">Customer</td>
						  	<td width="9%" align="center" valign="middle" class="bottom_right2">DO</td>
						  	<td width="13%" align="center" valign="middle" class="bottom_right2">Shipment ID </td>
					      	<td width="9%" align="center" valign="middle" class="bottom_right2">Vehicle</td>
					      	<td width="9%" align="center" valign="middle" class="bottom_right2">Vehicle Type </td>
                            <td width="12%" align="center" valign="middle" class="bottom_right2">Fee</td>
					      	<td width="12%" align="center" valign="middle" class="bottom_right2">Amount</td>
                            <td width="12%" align="center" valign="middle" class="bottom_right2">Gross</td>
                          	<td width="7%" align="center" valign="middle" class="bottom_right2">Status</td>
						</tr>
                        <c:set var='t_fee' value='${0}'/>
                        <c:set var='t_gross' value='${0}'/>                        
						<c:forEach items='${report}' var='item' varStatus='itemstatus'>
						<tr>
							<td align="left" valign="top" class="bottom_left_right"><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
							<td align="left" valign="top" class="bottom_right"><c:out value='${item.driver.firstName} ${item.driver.middleName} ${item.driver.lastName}'/></td>
							<td align="center" valign="top" class="bottom_right"><c:out value='${item.rit}'/></td>
							<td align="left" valign="top" class="bottom_right"><c:out value='${item.customer.firstName} ${item.customer.middleName} ${item.customer.lastName}'/></td>
							<td align="left" valign="top" class="bottom_right"><c:out value='${item.doNo}'/></td>
							<td align="left" valign="top" class="bottom_right">
                            	<a href="<c:url value='/page/shipmentpreedit.htm?id=${item.shipment.id}'/>"><c:out value='${item.shipment.code}'/></a>
                            </td>
					        <td align="left" valign="top" class="bottom_right"><c:out value='${item.shipment.vehicle.name}'/></td>
						    <td align="left" valign="top" class="bottom_right"><c:out value='${item.shipment.vehicle.type.name}'/></td>
                            <td align="right" valign="top" class="bottom_right">
                            	<fmt:formatNumber value='${item.price.money.amount}' pattern=',##0.00'/>
                        		<c:set var='t_fee' value='${t_fee+item.price.money.amount}'/>                            	
                            </td>
						    <td align="right" valign="top" class="bottom_right"><fmt:formatNumber value='${item.cost + item.otherCost}' pattern=',##0.00'/></td>
                            <td align="right" valign="top" class="bottom_right">
                            	<fmt:formatNumber value='${item.price.money.amount-(item.cost+item.otherCost)}' pattern=',##0.00'/>
                            	<c:set var='t_gross' value='${t_gross+item.price.money.amount-(item.cost+item.otherCost)}'/>      
                            </td>
                            <td align="center" valign="top" class="bottom_right">
                            	<c:if test='${item.billed}'>Invoiced</c:if>
                                <c:if test='${!item.billed}'>Uninvoiced</c:if>
                            </td>
						</tr>
					   	</c:forEach>						
						<tr class="CSS">
						  	<td align="left" valign="top" class="">&nbsp;</td>
						  	<td align="left" valign="top" class="">&nbsp;</td>
						  	<td align="left" valign="top" class="">&nbsp;</td>
						  	<td align="right" valign="top" class="">&nbsp;</td>
						  	<td align="right" valign="top" class="">&nbsp;&nbsp;</td>
						  	<td align="right" valign="top" style="border-right:none;"></td>
						  	<td colspan="2" align="right" valign="top" style="border-right:solid 1px black;">Total Amount :</td>
						  	<td align="right" valign="top" style="border-right:solid 1px black;"><fmt:formatNumber value='${t_fee}' pattern=',##0.00'/></td>
                          	<td align="right" valign="top" style="border-right:solid 1px black;"><fmt:formatNumber value='${total}' pattern=',##0.00'/></td>
                            <td align="right" valign="top" style="border-right:solid 1px black;"><fmt:formatNumber value='${t_gross}' pattern=',##0.00'/></td>
						</tr>
					 	</table>
                        
                        <c:remove var='t_fee'/>
                        <c:remove var='t_gross'/>
					</div>
					</div>
		     </div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
