<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AP Ledger Summary</title>
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
				<td width="60%">Financial Accounting > Account Payable > Report > AP ledger Summary </td>
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
							<h1 class="page-title">F50 - AP Ledger Summary<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/apledgersummarypre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/apledgersummaryexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AP LEDGER SUMMARY</strong></div>
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
                                        <td width="344" ><fmt:formatDate value='${criteria.dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${criteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>

                                <c:set var='grand' value='${0}'/>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="13%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Code</th>
                                    <th width="31%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Name</th>
                               	  	<th width="14%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Opening</th>
                                  	<th width="14%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Debet</th>
                                  	<th width="14%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Credit</th>
                               	  	<th align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Closing</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'>
                                <tr>
                                    <td align="left"><c:out value='${report.supplier.code}'/></td>
                                    <td align="left"><c:out value='${report.supplier.firstName} ${report.supplier.middleName} ${report.supplier.lastName}'/></td>
                                    <td align="right"><fmt:formatNumber value='${report.opening}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${report.debet}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${report.credit}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${report.closing}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='grand' value='${grand+report.closing}'/>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr><td colspan="6">&nbsp;</td></tr>
                                <tr>
                                  	<td colspan="5" align="left" style="border-top:1px solid black;"><strong>Total</strong></td>
                                    <td align="right" width="14%" style="border-top:1px solid black;">
                                        <strong>
                                        <fmt:formatNumber value='${grand}' pattern=',##0.00'/>
                                        <c:remove var='grand'/>
                                   	  </strong>
                               	  	</td>
                                </tr>
                                </tfoot>
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
