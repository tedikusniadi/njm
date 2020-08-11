<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cross Deposit Report</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/laporanShipmentSummaryReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("assets/laporanShipmentSummaryReport.css"); -->
	</style>

	<script type="text/javascript" src="assets/main.js"></script>
	
	<!-- Calendar Script -->
	<script type="text/javascript" src="assets/calendar.js"></script>
	<script type="text/javascript" src="assets/listform.js"></script>
	
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
								<a class="item-button-back" href="<c:url value='/page/crossdepositreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<%--
                            	<a class="item-button-export-xls" href="<c:url value='/page/shipmentsummaryreportexport.xls?organization=${organization.id}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>&vehicle=${vehicle}&vehicleType=${vehicleType}&driver=${driver}"><span>Export</span></a>
							  	--%>
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

				<div class="pageTitle">Report Cross Deposit </div>
				<div class="CSS"> &nbsp;</div><br>

				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr>
						<td> Period </td>
						<td width="13" align="center">:</td>
						<td width="401">&nbsp;<fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> - <fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>
					    <td width="83">&nbsp;</td>
					    <td width="13">&nbsp;</td>
					    <td width="246">&nbsp;</td>
					</tr>
					<tr>
					  <td>Payer</td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strPayer}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
					<tr>
					  <td>Payee</td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strPayee}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
					<tr>
					  <td>Status</td>
					  <td align="center">:</td>
					  <td>&nbsp;<c:out value='${strstatus}'/></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
				</table>
			  </div>

					<br>
					
						<div class="report"></div>
						<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black; border-right:none; border-left:none; border-bottom:none;">
						<tr class="CSS" style="height:28px;">
						  	<td width="15%" align="center" valign="middle" class="bottom_left_right">ID</td>
							<td width="6%" align="center" valign="middle" class="bottom_right">Date</td>
						    <td width="24%" align="center" valign="middle" class="bottom_right">Payer</td>
					        <td width="30%" align="center" valign="middle" class="bottom_right">Payee</td>
						    <td width="10%" align="center" valign="middle" class="bottom_right">Amount</td>
                            <td width="5%" align="center" valign="middle" class="bottom_right">Currency</td>
                            <td width="10%" align="center" valign="middle" class="bottom_right">Status</td>
						</tr>
						<c:forEach items='${unprocessed}' var='item' varStatus='itemstatus'>
						<tr>
						  <td align="left" valign="top" class="bottom_left_right">&nbsp;<c:out value="${item.payable.code}" /></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${item.payable.payer.firstName} ${item.payable.payer.middleName} ${item.payable.payer.lastName}'/></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${item.payable.payee.firstName} ${item.payable.payee.middleName} ${item.payable.payee.lastName}'/></td>
							<td align="right" valign="top" class="bottom_right">&nbsp;<fmt:formatNumber value="${item.amount}" pattern=',##0.00'/>&nbsp;</td>
                            <td align="center" valign="top" class="bottom_right">&nbsp;<c:out value="${item.payable.currency.symbol}" /></td>
                            <td align="center" valign="top" class="bottom_right">
                            	&nbsp;Unprocessed
                            </td>
 						</tr>
				       </c:forEach>	
						<c:forEach items='${processed}' var='item' varStatus='itemstatus'>
						<tr>
						  <td align="left" valign="top" class="bottom_left_right">&nbsp;<c:out value="${item.code}" /></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${item.payer.firstName} ${item.payer.middleName} ${item.payer.lastName}'/></td>
							<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${item.payee.firstName} ${item.payee.middleName} ${item.payee.lastName}'/></td>
							<td align="right" valign="top" class="bottom_right">&nbsp;<fmt:formatNumber value="${item.payment.amount}" pattern=',##0.00'/></td>
                            <td align="center" valign="top" class="bottom_right">&nbsp;<c:out value="${item.payment.payable.currency.symbol}" /></td>
                            <td align="center" valign="top" class="bottom_right">
                            	&nbsp;Processed
                            </td>
						</tr>
				     </c:forEach>
					 </table>
					
					<br><br><br><br>

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
