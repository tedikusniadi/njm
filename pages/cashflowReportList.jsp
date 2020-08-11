<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cashflow Report</title>
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
				<td width="60%">Reports > Financial Accounting > Accounting > Cashflow</td>
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
							<h1 class="page-title">RF75 - Cashflow Report</h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/cashflowreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/cashflowreportexcelview.xls'/>"><span>Export</span></a>
							</div>
						</div>

						<div class="main-box">
                        	<div class="pageTitle"><strong>Cashflow</strong> </div>
                            <div class="clears">&nbsp;</div>
                            <table width="75%" class="margin-left">
                            <tr>			  
                                <td>Company</td>
                                <td>:</td>
                                <td><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                            </tr>
                            <tr >
                                <td width="100">Period</td>
                                <td width="10">:</td>
                                <td width="355"><c:out value='${criteria.period.name}'/></td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
							<table cellpadding="5" cellspacing="0" class="report-table" width="65%">
							<thead>
                            <tr><th colspan="2" align="left" ><strong>Cashflow Activities</strong></th></tr>
                            </thead>
                            <tbody>
                            <c:set var='increase' value='${0}'/>
                            <c:set var='t_last' value='${0}'/>
                            <c:set var='t_current' value='${0}'/>
                            <c:forEach items='${reports}' var='report'>
                            <tr>
                            	<td width="74%"><c:out value='${report.account.name}'/></td>
                              	<td width="26%" align="right"><fmt:formatNumber value='${report.current-report.last}' pattern=',##0.00'/></td>
                            </tr>
                            <c:set var='increase' value='${increase+report.current-report.last}'/>
                            <c:set var='t_last' value='${t_last+report.last}'/>
                            <c:set var='t_current' value='${t_current+report.current}'/>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr>
                            	<td align="left"><strong>Net Increase in cash and equivalent</strong></td>
                                <td align="right"><strong><fmt:formatNumber value='${increase}' pattern=',##0.00'/></strong></td>
                            </tr>
                            <tr>
                            	<td align="left"><strong>Cash and cash equivalent at the beginning of the month</strong></td>
                                <td align="right"><strong><fmt:formatNumber value='${t_last}' pattern=',##0.00'/></strong></td>
                            </tr>
                            <tr>
                            	<td align="left"><strong>Cash and cash equivalent at the end of the month</strong></td>
                                <td align="right"><strong><fmt:formatNumber value='${t_current}' pattern=',##0.00'/></strong></td>
                            </tr>
                            </tfoot>
                            </table>
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
