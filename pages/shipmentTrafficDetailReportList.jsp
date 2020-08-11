<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment Traffic Detail</title>
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

	<style type="text/css">
		#t_content{
			border:1px solid black;
			border-right:none;
			border-bottom:none;
		}
		
		#t_content th{
			border-bottom:1px solid black;
			border-right:1px solid black;
		}
		
		#t_content td{
			border-bottom:1px solid black;
			border-right:1px solid black;
		}
	</style>
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
						<div class="area" dojoType="Container" id="quick_link_container">
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/shipmenttrafficreportdetailadd.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/shipmenttrafficreportdetailexcel.xls'/>"><span>Export</span></a>
                            </div>
                        </div>
    
                        <div class='main-box'>
                            <div id="main_container">
                                <div class="pageTitle">Traffic Detail Report</div>
                                <div class="CSS">&nbsp;</div><br>
    
                                <table width="100%" border="0" cellpadding="2" cellspacing="0" class="CSS1">
                                <tr>
                                    <td width="128">Company</td>
                                  	<td width="6" align="center">:</td>
                                  	<td width="1085"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                </tr>
                                <tr>
                                    <td>Date </td>
                                    <td align="center">:</td>
                                    <td><fmt:formatDate value='${trafic.dateFrom}' pattern='dd-MM-yyyy'/> To <fmt:formatDate value='${trafic.dateTo}' pattern='dd-MM-yyyy'/></td>


                                </tr>
                                </table>
                            </div>
                            <c:forEach items='${reports}' var='report'>
                            <strong><c:out value='${report.customer.firstName} ${report.customer.middleName} ${report.customer.lastName}'/></strong>
                            <table id="t_content" width="75%" cellpadding="3" cellspacing="0">
                            <thead>
                            <tr>
                                <th width="73%" align="left" valign="middle" class="bottom_left_right">Vechicle</th>
                              	<th width="27%" align="right" valign="middle" class="bottom_right">Price</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var='t_price' value='${0}'/>
                            <c:forEach items='${report.details}' var='detail'>
                            <tr>
                            	<td><c:out value='${detail.vehicle.name}'/></td>
                            	<td align="right"><fmt:formatNumber value='${detail.price}' pattern=',##0.00'/></td>
                            </tr>
                            <c:set var='t_price' value='${t_price+detail.price}'/>
                            </c:forEach>
                            <tr>
                            	<td><strong>TOTAL</strong></td>
                            	<td align="right"><strong><fmt:formatNumber value='${t_price}' pattern=',##0.00'/></strong></td>
                            </tr>
                            </tbody>
                            </table>
                            <c:remove var='t_price'/>
                            <div class="clears">&nbsp;</div>
                            </c:forEach>
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

</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
