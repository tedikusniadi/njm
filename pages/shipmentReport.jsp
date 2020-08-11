<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/shipmentReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("assets/shipmentReport.css"); -->
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
                    <td width="60%">Transport Outsource > Transport Management > Shipment > Print</td>
                    <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
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
						<h1 class="page-title">Shipment</h1>
						
						<!-- Top toolbar -->
							  <div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/shipmentpreedit.htm?id=${shipment_edit.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							  </div>
					  </div>

	<div class="main-box">
	<br/>	
			<div id="main_container">
				<br>
					<div class="report">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr>
						<td width="111">Company</td>
						<td width="13">&nbsp;:</td>
						<td width="401">&nbsp;<c:out value='${shipment_edit.organization.firstName} ${shipment_edit.organization.lastName} ${shipment_edit.organization.middleName}'/></td>
					    <td width="83">Note</td>
					    <td width="13">:</td>
					    <td width="246">&nbsp;${shipment_edit.note} </td>
					</tr>
					<tr>
						<td>Vehicle</td>
						<td>&nbsp;:</td>
						<td>&nbsp;${shipment_edit.vehicle.name}</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					</tr>
					<tr>
						<td>Vehicle Type </td>
						<td>&nbsp;:</td>
						<td>&nbsp;${shipment_edit.vehicle.type.name}</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					</tr>
					<tr>
					  <td>Driver</td>
					  <td>&nbsp;:</td>
					  <td>&nbsp;${shipment_edit.driver.firstName} ${shipment_edit.driver.lastName} ${shipment_edit.driver.middleName}</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					</tr>
					</table>
					</div>

					<br>
					
						<div class="report"></div>
						<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
						<tr class="CSS" style="height:20px;">
							<td width="5%" align="center" valign="middle" class="bottom_right">Date</td>
							<td width="20%" align="center" valign="middle" class="bottom_right">Customer</td>
						    <td width="35%" align="center" valign="middle" class="bottom_right">Contract</td>
							<td width="15%" align="center" valign="middle" class="bottom_right2">Delivery Order </td>
							<td width="5%" align="center" valign="middle" class="bottom_right2">Rit</td>
							<td width="10%" align="center" valign="middle" class="bottom_right2">Main Cost </td>
							<td width="10%" align="center" valign="middle" class="bottom">Other Cost</td>
						</tr>
						<c:forEach items="${shipment_edit.items}" var="item">					
						<tr>
							<td align="left" valign="top" class="right">&nbsp;<fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
							<td align="left" valign="top" class="right">&nbsp;<c:out value='${item.customer.firstName} ${item.customer.middleName} ${item.customer.lastName}'/></td>
							<td align="left" valign="top" class="right">&nbsp;<c:out value='${item.contract.code}'/></td>
							<td align="left" valign="top" class="right">&nbsp;<c:out value='${item.doNo}'/></td>
							<td align="right" valign="top" class="right">&nbsp;<c:out value='${item.rit}'/>&nbsp;</td>
							<td align="right" valign="top" class="right"><fmt:formatNumber value='${item.cost}' pattern=',##0.00'/>&nbsp;</td>
							<td align="right" valign="top" class=""><fmt:formatNumber value='${item.otherCost}' pattern=',##0.00'/>&nbsp;</td>
					   </tr>
					   </c:forEach>
					 </table>
					
					<br><br><br>

					<table border="0" cellpadding="5" cellspacing="5" width="100%">
					<tr>
					  <td width="11%" align="left" valign="top">&nbsp;</td>
						<td width="74%">&nbsp;</td>
						<td width="15%" align="right" valign="top">
							<table width="159" border="0" cellpadding="0" cellspacing="0" class="CSS1">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
							  <td>&nbsp;</td>
							  </tr>
							<tr>
							  <td align="center">Prepared By,&nbsp;</td>
							  </tr>
							<tr>
							  <td align="center" valign="middle">&nbsp;</td>
						  	</tr>
							<tr>
							  <td align="center" valign="middle">&nbsp;</td>
						  	</tr>
							<tr>
							  <td align="center" valign="middle">&nbsp;</td>
						  	</tr>
							<tr>
							  <td align="center" valign="middle">&nbsp;</td>
						  	</tr>

							<tr>
							  <td align="center" valign="middle">(&nbsp;${shipment_edit.createdBy.firstName}${shipment_edit.createdBy.middleName}${shipment_edit.createdBy.lastName}&nbsp;)</td>
							  </tr>
						  </table>												
						</td>
					</tr>
					</table>

	          </div>
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
