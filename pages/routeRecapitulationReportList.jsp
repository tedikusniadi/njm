<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Route Recapitulation</title>
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
        <!-- /tips & page navigator -->
	</div>	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<div class="area" dojoType="Container" id="quick_link_container">
							<h1 class="page-title">D17 - Route Recapitulation Report</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/routerecapitulationreportpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/routerecapitulationreportexport.xls?organization=${organization.id}&route=${filterCriteria.route}&month=${filterCriteria.month}&year=${filterCriteria.year}'/>"><span>Export</span></a>
                            </div>
					  	</div>

						<div class="main-box">
							<div id="main_container">
                            	<div class="report"><strong>ROUTE RECAPITULATION</strong></div>
                            	<div class="clears">&nbsp;</div>
                                
                                <div class="report">
                                    <table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="10">&nbsp;:</td>
                                      <td width="1112"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td>Period </td>
                                        <td>&nbsp;:</td>
                                        <td>${month}&nbsp;${year}</td>
                                    </tr>
                                    </table>
                                    <div class="clears">&nbsp;</div>
                                    <c:forEach items='${routes}' var='route'>
                                    <table border="0" cellpadding="5" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th width="9%" align="left">Route </th>
                                      	<th width="1%" align="center">&nbsp;:</th>
                                      	<th width="90%" align="left">${route.route.name}</th>
                                    </tr>
                                    </thead>
                                    </table>
                                    
                                    <table style="border:solid 1px #000000;" width="1250" cellpadding="2" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th width="2%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">No.</th>
                                      	<th width="17%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Vehicle</th>
                       	  	  	  	  	<th width="5%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Type</th>
                   	  	  	  	  	  <th colspan="31" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${filterCriteria.month} ${filterCriteria.year}'/></th>
                                   	  	<th width="4%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Ttl. Ritase</th>
                               	  	  	<th width="5%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Total</th>
                                    </tr>
                                    <tr>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">1</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">2</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">3</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">4</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">5</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">6</th>
                                      <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">7</th>
                                      <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">8</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">9</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">10</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">11</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">12</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">13</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">14</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">15</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">16</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">17</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">18</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">19</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">20</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">21</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">22</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">23</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">24</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">25</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">26</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">27</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">28</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">29</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">30</th>
                                        <th width="2%"  align="center"  style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">31</th>
                                    </tr>                            
                                   	</thead>
                                    <tbody>
                                     <c:forEach items='${route.reports}' var='report' varStatus='index'>
                                    <tr>
                                    	<td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${status.index+1}'/></td>
                                        <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${report.vehicle.name}'/></td>
                                        <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${report.type.name}'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit1}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit2}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit3}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit4}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit5}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit6}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit7}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit8}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit9}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit10}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit11}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit12}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit13}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit14}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit15}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit16}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit17}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit18}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit19}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit20}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit21}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit22}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit23}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit24}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit25}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit26}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit27}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit28}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit29}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit30}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.rit31}' pattern=',##0'/></td>
                                      	<td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.tRit}' pattern=',##0'/></td>
                                        <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${report.tFreight}' pattern=',##0'/></td>
                                    </tr>
                                    </c:forEach>
                                   	</tbody>
                                    <tfoot>
                                    <tr>
                                    	<td colspan="3" align="center" style="border-right:solid 1px #000000;"><strong>TOTAL</strong></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit1}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit2}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit3}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit4}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit5}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit6}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit7}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit8}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit9}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit10}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit11}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit12}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit13}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit14}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit15}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit16}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit17}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit18}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit19}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit20}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit21}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit22}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit23}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit24}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit25}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit26}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit27}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit28}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit29}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit30}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.gRit.rit31}' pattern=',##0'/></td>
                                      	<td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.tRit}' pattern=',##0'/></td>
                                        <td align="center" style="border-right:solid 1px #000000;"><fmt:formatNumber value='${route.tFreight}' pattern=',##0'/></td>
                                    </tr>
                                    </tfoot>
                                    </table>
                                    <div class="clears">&nbsp;</div>
                                    </c:forEach>
                                </div>
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
