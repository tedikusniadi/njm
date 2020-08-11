<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment Recapitulation</title>
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
		
		function exportxls()
		{
			var url = 
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
						<h1 class="page-title">D13 - Shipment Recapitulation Report</h1>

						<div class="toolbar">
                            <a class="item-button-back" href="<c:url value='/page/shipmentrecapitulationreportpre.htm'/>"><span>Back</span></a>
                            <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            <a class="item-button-export-xls" href="<c:url value='/page/shipmentrecapitulationreportexport.xls'/>"><span>Export</span></a>
                        </div>
					</div>

					<div class="main-box">
						<div id="main_container">
								<div class="report"><strong>SHIPMENT RECAPITULATION</strong></div>
                    			<br/>
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
                                        <td width="1099"><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> - <fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>
                                    </tr>
                                    <tr>
                                        <td width="109">Customer </td>
                                        <td width="19">&nbsp;:</td>
                                        <td width="1099"><c:out value='${customer}'/></td>
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <c:set var='g_rit' value='${0}'/>
                                <c:set var='g_price' value='${0}'/>
                                <c:set var='g_freight' value='${0}'/>
                                <c:set var='g_gross' value='${0}'/>
                                <c:forEach items='${reports}' var='vehicle'>
                                <table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
                                <tr>
                                    <td width="109">Vehicle </td>
                                    <td width="19">&nbsp;:</td>
                                    <td width="1099"><c:out value='${vehicle.vehicle.name}'/></td>
                                </tr>
                                <tr>
                                    <td width="109">Type </td>
                                    <td width="19">&nbsp;:</td>
                                    <td width="1099"><c:out value='${vehicle.vehicle.type.name}'/></td>
                                </tr>
                                </table>
                                <br/>
                                <table width="1500" border="0" cellpadding="2" cellspacing="0" class="CSS1" style="border:1px solid black;WIDTH:1300px;">
    							<thead>
                                <tr class="CSS">
                                    <th width="2%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;" rowspan="2">NO</th>
                                    <th align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;" width="7%"  rowspan="2">DATE</th>
                           	  	  	<th width="7%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">DRIVER</th>
               	  	  				<th width="2%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">RIT</th>
                       				<th width="9%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">CUSTOMER</th>
                      				<th width="8%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">DESTINATION</th>
                               	  	<th width="4%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">DO ID</th>
                           	  	  	<th width="4%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">PROD</th>
                               	  	<th width="3%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">AMT</th>
                           	  	  	<th width="7%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">PRICE</th>
                           	  	  	<th width="6%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">FREIGHT</th>
               	  	  				<th width="7%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">GROSS PROFIT</th>
                                    <th align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;" colspan="5">OTHER COST</th>
                                  	<th width="7%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;"  rowspan="2">PROFIT</th>
                                    <th width="6%" align="center" valign="middle" style="border-bottom:solid 1px black;"  rowspan="2">Note</th>
                                </tr>
                                <tr class="CSS">
                                    <th width="4%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;">TUBE</th>
                           	  	  	<th align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;" width="4%">TREAD</th>
                               	 	<th width="4%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;">FLAP</th>
                               	  	<th width="4%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;">SERV</th>
                               	  	<th width="5%" align="center" valign="middle" style="border-bottom:solid 1px black;border-right:solid 1px black;">MAIN</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var='t_gross' value='${0}'/>
                                <c:set var='t_freight' value='${0}'/>
                                <c:set var='t_fee' value='${0}'/>
                                <c:set var='t_rit' value='${0}'/>
                                <c:forEach items='${vehicle.shipments}' var='shipment' varStatus='status'>
                                <c:forEach items='${shipment.items}' var='item' varStatus='itemstatus'>                               
                                <tr>
                                	<c:if test='${itemstatus.first}'>
                                    	<td align="center" class="bottom_right" rowspan="${shipment.rows}"><c:out value='${status.index+1}'/></td>
                                    </c:if>
                                    <td align="left" class="bottom_right" ><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
                                    <c:if test='${itemstatus.first}'>
                                    <td align="left" class="bottom_right" rowspan="${shipment.rows}"><c:out value='${item.driver.firstName} ${item.driver.middleName} ${item.driver.lastName}'/></td>
                                    </c:if>
                                    <td align="center" class="bottom_right" >
                                    	<c:out value='${item.rit}'/>
                                        <c:set var='t_rit' value='${t_rit+1}'/>
                                    </td>
                                    <td align="left" class="bottom_right" ><c:out value='${item.customer.firstName} ${item.customer.middleName} ${item.customer.lastName}'/></td>
                                    <td align="left" class="bottom_right" ><c:out value='${item.destination.name}'/></td>
                                    <td align="left" class="bottom_right" ><c:out value='${item.doNo}'/></td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="right" class="bottom_right" >
                                    	<fmt:formatNumber value='${item.price.money.amount}' pattern=',##0.00'/>
                                        <c:set var='t_fee' value='${t_fee+item.price.money.amount}'/>
                                    </td>
                                    <c:if test='${itemstatus.first}'>
                                    <td align="right" class="bottom_right" rowspan="${shipment.rows}" >
                                    	<fmt:formatNumber value='${shipment.freight}' pattern=',##0.00'/>
                                    	<c:set var='t_freight' value='${t_freight+shipment.freight}'/>
                                    </td>
                                    </c:if>
                                    <c:if test='${itemstatus.first}'>
                                    	<td align="right" class="bottom_right" rowspan="${shipment.rows}" ><fmt:formatNumber value='${shipment.fee - shipment.freight}' pattern=',##0.00'/></td>
                                        <c:set var='t_gross' value='${t_gross+shipment.fee - shipment.freight}'/>
                                    </c:if>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom_right" >&nbsp;</td>
                                    <td align="left" class="bottom" ><c:out value='${item.destination.note}'/></td>
                                </tr>
                                </c:forEach>
                                </c:forEach>
                                <tbody>
                                <tfoot>
                                <tr>
                                  	<td align="left" valign="top">&nbsp;</td>
                                  	<td align="right" valign="top" class="right"><strong>TOTAL</strong>&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="center" valign="top" class="right"><fmt:formatNumber value='${t_rit}' pattern='##0'/></td>
                                    <td align="left" valign="top">&nbsp;</td>
                                    <td align="left" valign="top">&nbsp;</td>
                                    <td align="left" valign="top">&nbsp;</td>
                                    <td align="left" valign="top">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${t_fee}' pattern=',##0.00'/></td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${t_freight}' pattern=',##0.00'/></td>
                                    <td align="right" valign="top" class="right"><fmt:formatNumber value='${t_gross}' pattern=',##0.00'/></td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>                                    
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                    <td align="right" valign="top" class="right">&nbsp;</td>
                                    <td align="left" valign="top" class="right">&nbsp;</td>
                                </tr>
                                </tfoot>
                                </table>
                                <c:set var='g_rit' value='${g_rit+t_rit}'/>
                                <c:set var='g_price' value='${g_price+t_fee}'/>
                                <c:set var='g_freight' value='${g_freight+t_freight}'/>
                                <c:set var='g_gross' value='${g_gross+t_gross}'/>
                                
                                <c:remove var='t_fee'/>
                                <c:remove var='t_gross'/>
                                <c:remove var='t_freight'/>
                                <c:remove var='t_rit'/>
                                
                                <div class="clears">&nbsp;</div>
                                </c:forEach>
                        		<div class="clears">&nbsp;</div>
                                <table width="100%" border="0" cellpadding="2" cellspacing="0" style="border:1px solid black;WIDTH:1300px;">
    							<thead>
                                <tr>
                                    <th width="2%">&nbsp;</th>
                                    <th width="7%" align="right">TOTAL</th>
                           	  	  	<th width="7%" style="border-right:solid 1px black;">&nbsp;</th>
           	  	  				  <th width="3%" align="center" style="border-right:solid 1px black;"><fmt:formatNumber value='${g_rit}' pattern='##0'/></th>
                   				  	<th colspan="5">&nbsp;</th>
               	  	  	  	  	  <th width="7%" align="right" style="border-right:solid 1px black;"><fmt:formatNumber value='${g_price}' pattern=',##0.00'/></th>
               	  	  	  	  	  <th width="6%" align="right" style="border-right:solid 1px black;"><fmt:formatNumber value='${g_freight}' pattern=',##0.00'/></th>
   	  	  				  	  	  <th width="7%" align="right" style="border-right:solid 1px black;"><fmt:formatNumber value='${g_gross}' pattern=',##0.00'/></th>
                                  	<th width="33%" colspan="7">&nbsp;</th>
                                </tr>
                                </thead>
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
