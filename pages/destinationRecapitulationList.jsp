<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Destination Recapitulation</title>
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
							<h1 class="page-title">D19 - Destination Recapitulation Report</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/destinationrecapitulationpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/destinationrecapitulationexcellview.xls'/>"><span>Export</span></a>
                            </div>
					  	</div>

						<div class="main-box">
							<div id="main_container">
                            	<div class="report"><strong>DESTINATION RECAPITULATION</strong></div>
                            	<div class="clears">&nbsp;</div>
                                
                                <div class="report">
                                    <table border="0" cellpadding="3" cellspacing="0" class="CSS1" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="10">&nbsp;:</td>
                                      	<td width="1112"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td width="109">Customer </td>
                                        <td width="10">&nbsp;:</td>
                                      	<td width="1112"><c:out value='${criteria.customer.firstName} ${criteria.customer.middleName} ${criteria.customer.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td>Period </td>
                                        <td>&nbsp;:</td>
                                        <td>${criteria.month}&nbsp;${criteria.year}</td>
                                    </tr>
                                    </table>
                                    <div class="clears">&nbsp;</div>
                                    <c:forEach items='${reports}' var='_rep'>
                                    <strong>${_rep.destination.name}</strong>
                                    <table style="border-top:solid 1px #000000;border-left:solid 1px #000000;" width="100%" cellpadding="3" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th width="3%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">No.</th>
                                   	  	<th width="12%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Tanggal</th>
                   	  	  	  	  	  	<th width="74%" colspan='<%= ((java.util.List)request.getAttribute("vehicles")).size()%>' align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">
                                      		<c:out value='${criteria.customer.salutation} ${criteria.customer.firstName} ${criteria.customer.middleName} ${criteria.customer.lastName} - ${_rep.destination.name}'/>
                                      	</th>
                           	  	  	  	<th width="11%" rowspan="2" align="center" valign="middle" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Total</th>
                                    </tr>
                                    <tr>
                                    	
                                    	<c:forEach items='${vehicles}' var='vehicle'>
	                                        <th align="center" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${vehicle.name}'/></th>
                                        </c:forEach>
										
                                    </tr>                            
                                   	</thead>
                                    <tbody>
                                    <c:forEach items='${_rep.reports}' var='xreport' varStatus='status'>
                                    <tr>
                                    	<td style="border-right:solid 1px black;border-bottom:solid 1px black;"><c:out value='${status.index+1}'/></td>
                                        <td style="border-right:solid 1px black;border-bottom:solid 1px black;"><fmt:formatDate value='${xreport.date}' pattern='dd-MM-yyyy'/></td>
                                        
										
										
										<c:forEach items='${vehicles}' var='vehicle' varStatus='status'>
                                        <td style="border-right:solid 1px black;border-bottom:solid 1px black;" align="center">
                                        	<c:if test='${not empty xreport.content[status.index]}'>
                                        		<c:out value='${xreport.content[status.index].count}'/>
                                            </c:if>
                                            &nbsp;
                                        </td>
                                        </c:forEach>
                                        <td style="border-right:solid 1px black;border-bottom:solid 1px black;" align="center"><c:out value='${xreport.t_count}'/></td>
                                    </tr>
                                    </c:forEach>
											
                                    </tbody>
                                    <tfoot>
                                    	<td style="border-right:solid 1px black;border-bottom:solid 1px black;" colspan="2" align="right"><strong>TOTAL</strong></td>
                                        <c:set var='grand' value='${0}'/>
                                        <c:forEach items='${_rep.t_map}' var='tmap'>
                                        	<c:set var='grand' value='${grand+tmap}'/>
                                        	<td style="border-right:solid 1px black;border-bottom:solid 1px black;" align="center"><strong><c:out value='${tmap}'/></strong></td>
                                        </c:forEach>
                                        <td style="border-right:solid 1px black;border-bottom:solid 1px black;" align="center"><strong>${grand}</strong></td>
                                        <c:remove var='grand'/>
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
