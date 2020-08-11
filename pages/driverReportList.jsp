<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Driver Report</title>
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
		<%@ include file="/common/sirius-menu.jsp"%>
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
                            <h1 class="page-title">D18 - Driver Report</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/driverreportpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/driverreportexcell.xls'/>"><span>Export</span></a>
                            </div>
                        </div>

                        <div class="main-box">
                            <div id="main_container">
                                <div class="report"><strong>DRIVER REPORT</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="10">&nbsp;:</td>
                                      	<td width="1110"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td>Period </td>
                                        <td>&nbsp;:</td>
                                        <td><fmt:formatDate value='${criteria.dateFrom}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;<strong>to</strong>&nbsp;&nbsp;<fmt:formatDate value='${criteria.dateTo}' pattern='dd-MM-yyyy'/></td>
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <c:forEach items='${reports}' var='report'>
                                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="9%" align="left">Driver </th>
                                  	<th width="1%">&nbsp;:</th>
                                  	<th width="90%" align="left"><c:out value='${report.driver.firstName} ${report.driver.middleName} ${report.driver.lastName}'/></th>
                                </tr>
                                </thead>
                                </table>
                                <table style="border-left:solid 1px #000000;border-top:solid 1px black;" cellpadding="3" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="101" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Date.</th>
                                    <th width="139" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">DO No.</th>
                               	  	<th width="235" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Customer</th>
                                  	<th width="173" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Route</th>
                                  	<th width="31" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Rit</th>
									<c:forEach items='${criteria.costs}' var='cost'>
                                    	<th style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">${cost.name}</th>
                                  	</c:forEach>
                                </tr>                   
                                </thead>
                                <tbody>
                                <c:forEach items='${report.items}' var='ship' varStatus='index'>
                                <tr>
                                	<td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatDate value='${ship.item.date}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${ship.item.doNo}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${ship.item.customer.firstName} ${item.customer.middleName} ${item.customer.lastName}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${ship.item.destination.name}'/></td>
                                    <td align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${ship.item.rit}'/></td>
                                    <c:forEach items='${ship.costs}' var='cost'>
                                    	<td align="right" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${cost.cost}' pattern=',##0.00'/></td>
                                    </c:forEach>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                	<td colspan="5" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><strong>TOTAL</strong></td>
                                    <c:forEach items='${report.tCost}' var='cost'>
                                    	<td align="right" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value='${cost}' pattern=',##0.00'/></td>
                                    </c:forEach>
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
