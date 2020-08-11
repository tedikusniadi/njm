<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AP Payment Summary</title>
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
				<td width="60%">Financial Accounting > Account Payable > Report > AP Payment Summary </td>
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
							<h1 class="page-title">F52 - AP Payment Summary<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/appaymentsummarypre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/appaymentsummaryexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AP PAYMENT SUMMARY</strong></div>
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
                                <c:forEach items='${reports}' var='report'>
                                <c:set var='grand' value='${0}'/>
                                <div class="report"><strong><c:out value='${report.suplier.code} - ${report.suplier.firstName} ${report.suplier.middleName} ${report.suplier.lastName}'/></strong></div>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="13%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                                    <th width="12%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Type</th>
                           	  	  	<th width="20%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No</th>
                           	  	  <th width="38%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Description</th>
                           	  	  <th width="17%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${report.payments}' var='payment'>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${payment.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${payment.paymentInformation.paymentMethodType}'/></td>
                                    <td align="left"><c:out value='${payment.code}'/></td>
                                    <td align="left"><c:out value='${payment.note}'/></td>
                                    <td align="right"><fmt:formatNumber value='${payment.paymentInformation.amount}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='grand' value='${grand+payment.paymentInformation.amount}'/>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                  	<td colspan="4" align="left" style="border-top:1px solid black;"><strong>Total for <c:out value='${report.suplier.code} - ${report.suplier.firstName} ${report.suplier.middleName} ${report.suplier.lastName}'/></strong></td>
                                    <td align="right" width="17%" style="border-top:1px solid black;">
                                        <strong>
                                        <fmt:formatNumber value='${grand}' pattern=',##0.00'/>
                                        <c:remove var='grand'/>
                                   	  </strong>
                               	  	</td>
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
