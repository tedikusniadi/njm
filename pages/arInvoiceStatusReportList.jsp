<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AR Invoice Status</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
    </style>
    
	<script type="text/javascript">
			function printPage(){print();}
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
				<td width="60%">Financial Accounting &gt; Account Receivables &gt; Report &gt; Invoice Status</td>
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
							<h1 class="page-title">F38 - Invoice Status<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/arinvoicestatuspre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/arinvoicestatusexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AR INVOICE STATUS</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table width="498">	
                                    <tr>	
                                        <td width="100" class="CSS1">Company</td>
                                        <td width="11" class="CSS1">:&nbsp;&nbsp;</td>
                                        <td width="344" class="CSS1"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" class="CSS1">Period</td>
                                        <td width="11" class="CSS1">:&nbsp;&nbsp;</td>
                                        <td width="344" class="CSS1"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${criteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
								</div>
                                <div class="clears">&nbsp;</div>
								<table width="100%" cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                	<th width="11%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date </th>
                               	  <th width="14%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Code</th>
                       	  	  	  <th width="23%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Name</th>
                               	  <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Status</th>
                                    <th width="30%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Inv. No.<br/>
                                  &nbsp;&nbsp;Receipt No.</th>
                                  <th width="14%" align="right" valign="middle" style="border-bottom:1px solid black;border-top:1px solid black;">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='billing'>
                                <tr>
                                    <td><strong><fmt:formatDate value='${billing.date}' pattern='dd MMM yyyy'/></strong></td>
                                    <td><strong><c:out value='${billing.customer.code}'/></strong></td>
                                    <td><strong><c:out value='${billing.customer.firstName} ${billing.customer.middleName} ${billing.customer.lastName}'/></strong></td>
                                    <td><strong><c:out value='${billing.status}'/></strong></td>
                                    <td><strong><c:out value='${billing.code}'/></strong></td>
                                    <td align="right"><strong><fmt:formatNumber value='${billing.totalDefAmount}' pattern=',##0.00'/></strong></td>
                                </tr>
                                <c:forEach items='${billing.payments}' var='application'>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;&nbsp;&nbsp;<c:out value='${application.payment.code}'/></td>
                                    <td align="right"><fmt:formatNumber value='${application.paidAmount-application.writeOff}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                    <td><strong>Unpaid Amount</strong></td>
                                    <td align="right"><strong><fmt:formatNumber value='${billing.unpaid}' pattern=',##0.00'/></strong></td>
                                </tr>
                                </c:forEach>
                                </tbody>
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
