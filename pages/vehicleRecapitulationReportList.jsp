<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Recapitulation</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>
    
    <script type="text/javascript">	
		function printPage(){
	   		print();
		}
	</script>
</head>

<body>
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
        <div id="se-navigator">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="60%"></td>
                <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
            </tr>
            </table>
        </div>
	</div>	

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

					<div class="area" dojoType="Container" id="quick_link_container">
						<h1 class="page-title">D12 - Vehicle Recapitulation Report</h1>

						<div class="toolbar">
                            <a class="item-button-back" href="<c:url value='/page/vehiclerecapitulationpre.htm'/>"><span>Back</span></a>
                            <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            <a class="item-button-export-xls" href="<c:url value='/page/vehiclerecapitulationexport.xls?organization=${organization.id}'/>"><span>Export</span></a>
                        </div>
					</div>

					<div class="main-box">
						<div id="main_container">
								<div class="report"><strong>VEHICLE RECAPITULATION</strong></div>
                    			<br>
                                <div class="report">
                                    <table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="19">&nbsp;:</td>
                                        <td width="1099"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td width="109">Period </td>
                                        <td width="19">&nbsp;:</td>
                                        <td width="1099"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd MMM yyyy'/> - <fmt:formatDate value='${criteria.dateTo}' pattern='dd MMM yyyy'/></td>
                                    </tr>
                                    </table>
                                </div>
                                <br/>
                                <table border="0" class="CSS1" cellpadding="2" cellspacing="0" style="border:1px solid black;WIDTH:1300px;">
                                <tr class="CSS">
                                    <td width="2%" align="center" valign="middle" class="bottom_right">&nbsp;</td>
                                    <td align="center" valign="middle" class="bottom_right" colspan="5">DATA TRUCK</td>
                                  <td align="center" valign="middle" class="bottom_right2" colspan="8">PENGELUARAN BULANAN TRUCK</td>
                                  <td align="center" valign="middle" class="bottom" colspan="3">&nbsp;</td>
                                </tr>
                                <tr class="CSS">
                                    <td width="2%" align="center" valign="middle" class="bottom_right">NO.</td>
                                    <td align="center" valign="middle" class="bottom_right" width="16%">VEHICLE</td>
                                  	<td width="10%" align="center" valign="middle" class="bottom_right">BUY DATE</td>
                                    <td width="7%" align="center" valign="middle" class="bottom_right">PRICE</td>
                                  	<td width="9%" align="center" valign="middle" class="bottom_right">TYPE</td>
                                  	<td width="5%" align="center" valign="middle" class="bottom_right2">TIRE</td>
                                    <td width="11%" align="center" valign="middle" class="bottom_right2">FREIGHT</td>
                                    <td width="3%" align="center" valign="middle" class="bottom_right2">BAN</td>
                                    <td width="5%" align="center" valign="middle" class="bottom_right2">SER</td>
                                    <td width="3%" align="center" valign="middle" class="bottom_right2">PER</td>
                                    <td width="3%" align="center" valign="middle" class="bottom_right2">LAIN</td>
                                    <td width="7%" align="center" valign="middle" class="bottom_right2">GAJI</td>
                                    <td width="4%" align="center" valign="middle" class="bottom_right2">CICIL</td>
                                    <td width="6%" align="center" valign="middle" class="bottom_right2">C/K</td>
                                  	<td width="3%" align="center" valign="middle" class="bottom_right2">ONG</td>
                                    <td width="2%" align="center" valign="middle" class="bottom_right2">TRC</td>
                                    <td width="4%" align="center" valign="middle" class="bottom">AKUM</td>
                                </tr>
                                <c:set var='ttl' value='${0}'/>
                                <c:set var='t_freight' value='${0}'/>
                                <c:set var='t_contract' value='${0}'/>
                                <c:forEach items='${reports}' var='report' varStatus='status'>
                                <tr>
                                    <td align="center" class="bottom_right" ><c:out value='${status.index+1}'/></td>
                                    <td align="left" class="bottom_right" ><c:out value='${report.vehicle.name}'/></td>
                                    <td align="left" class="bottom_right" ><fmt:formatDate value='${report.vehicle.date}' pattern='MMM yyyy'/></td>
                                    <td align="right" class="bottom_right" ><fmt:formatNumber value='${report.price}' pattern=',##0.00'/></td>
                                    <td align="center" class="bottom_right" ><c:out value='${report.vehicle.type.name}'/></td>
                                    <td align="center" class="bottom_right" ><c:out value='${report.vehicle.type.tire}'/></td>
                                    <td align="right" class="bottom_right" ><fmt:formatNumber value='${report.freight}' pattern=',##0.00'/></td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" ><fmt:formatNumber value='${report.contract}' pattern=',##0.00'/></td>
                                    <td align="right" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom" >&nbsp;</td>
                                </tr>
                                <c:set var='ttl' value='${ttl+report.price}'/>
                                <c:set var='t_freight' value='${t_freight+report.freight}'/>
                                <c:set var='t_contract' value='${t_contract+report.contract}'/>
                                </c:forEach>
                                <tr>
                                    <td align="right" valign="top" colspan="2"><strong>TOTAL</strong>&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${ttl}' pattern=',##0.00'/></td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${t_freight}' pattern=',##0.00'/></td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${t_contract}' pattern=',##0.00'/></td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
						 		</tr>
                                </table>
                                <c:remove var='ttl'/>
                                <c:remove var='t_freight'/>
                                <c:remove var='t_contract'/>
                        		<br/><br/>
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
