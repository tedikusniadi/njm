<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AP Ageing Summary</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
    </style>
	
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Financial Accounting > Account Payable > Report > AP Ageing Summary </td>
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
							<h1 class="page-title">F54 - AP Ageing Summary<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/apageingsummarypre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/apageingsummaryexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AP AGEING SUMMARY</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table width="498">	
                                    <tr>	
                                        <td width="100" >Company</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" >Period</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><fmt:formatDate value='${criteria.date}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
								<c:forEach items='${reports}' var='report'>
                                <table border="0" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="9%" align="left"><c:out value='${report.organization.code} - ${report.organization.firstName} ${report.organization.middleName} ${report.organization.lastName}'/></th>
                                </tr>
                                </thead>
                                </table>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="24%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Supplier</th>
                                  	<th width="13%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Balance</th>
                           	  	  	<th width="13%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Not Yet Due</th>
                               	  	<th align="center" style="border-top:1px solid black;" colspan="4">Over Due</th>
                                </tr>
                                <tr>
                                    <th width="13%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">0-30 Days</th>
                                    <th width="13%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">31-60 Days</th>
                               	  	<th width="13%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">61-90 Days</th>
                                  	<th width="11%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">&#8250; 90 Days</th>
                                </tr>
                                </thead>
                                <tbody>                                
                                <c:forEach items='${report.suppliers}' var='supp'>
                                <tr>
                                    <td align="left"><c:out value='${supp.supplier.code} - ${supp.supplier.firstName} ${supp.supplier.middleName} ${supp.supplier.lastName}'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.opening}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.notDue}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.oneDue}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.twoDue}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.threeDue}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${supp.moreDue}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                  	<td align="left" style="border-top:1px solid black;"><strong>Total</strong></td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                        <strong><fmt:formatNumber value='${report.t_opening}' pattern=',##0.00'/></strong>
                               	  	</td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                        <strong><fmt:formatNumber value='${report.t_notDue}' pattern=',##0.00'/></strong>
                               	  	</td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                       <strong><fmt:formatNumber value='${report.t_oneDue}' pattern=',##0.00'/></strong>
                               	  	</td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                        <strong><fmt:formatNumber value='${report.t_twoDue}' pattern=',##0.00'/></strong>
                               	  	</td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                        <strong><fmt:formatNumber value='${report.t_threeDue}' pattern=',##0.00'/></strong>
                               	  	</td>
                                    <td align="right" width="13%" style="border-top:1px solid black;">
                                        <strong><fmt:formatNumber value='${report.t_moreDue}' pattern=',##0.00'/></strong>
                               	  	</td>
                                </tr>
                                <tr>
                                  	<td align="left"><strong>Percentage</strong></td>
                                    <td align="right" width="13%">&nbsp;</td>
                                    <td align="right" width="13%"><strong><fmt:formatNumber value='${report.p_notDue}' pattern=',##0.00'/>%</strong></td>
                                    <td align="right" width="13%"><strong><fmt:formatNumber value='${report.p_oneDue}' pattern=',##0.00'/>%</strong></td>
                                    <td align="right" width="13%"><strong><fmt:formatNumber value='${report.p_twoDue}' pattern=',##0.00'/>%</strong></td>
                                    <td align="right" width="13%"><strong><fmt:formatNumber value='${report.p_threeDue}' pattern=',##0.00'/>%</strong></td>
                                    <td align="right" width="13%"><strong><fmt:formatNumber value='${report.p_moreDue}' pattern=',##0.00'/>%</strong></td>
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
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
