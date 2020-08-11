<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AR Register Detail</title>
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
				<td width="60%">Financial Accounting &gt; Account Receivables &gt; Report &gt; AR Register Detail</td>
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
							<h1 class="page-title">F37 - AR Register Detail<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/arregisterdetaireportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/arregisterdetaireportexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AR REGISTER DETAIL</strong></div>
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
                                
                                <c:set var='g_amt' value='${0}'/>
                                
								<c:forEach items='${reports}' var='report'>

                                <c:set var='t_amt' value='${0}'/>
								<div><strong><c:out value='${report.customer.code} - ${report.customer.firstName} ${report.customer.middleName} ${report.customer.lastName}'/></strong></div>
                                <table width="100%" cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                  	<th width="10%" align="center" valign="top" rowspan="2" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                           	  	  	<th align="center" colspan="2" style="border-top:1px solid black;">Ref. No</th>
                                  	<th width="6%" align="center" valign="top" rowspan="2" style="border-bottom:1px solid black;border-top:1px solid black;">Curr </th>
                                  	<th width="12%" align="right" valign="top" rowspan="2" style="border-bottom:1px solid black;border-top:1px solid black;">Rate</th>
                                    <th align="right" valign="middle" style="border-top:1px solid black;">Amount</th>
                                    <th align="right" valign="middle" style="border-top:1px solid black;">Amount Rp</th>
                                </tr>
                                <tr>
                                    <th width="7%" align="center" style="border-bottom:1px solid black;">Acc No</th>
                               	  	<th width="36%" align="center" style="border-bottom:1px solid black;">Acc Name</th>
                                    <th width="15%" align="right" style="border-bottom:1px solid black;">Debet</th>
                                    <th width="14%" align="right" style="border-bottom:1px solid black;">Credit</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach  items='${report.billings}' var='detail'>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${detail.billing.date}' pattern='dd MMM yyyy'/></td>
                                    <td align="left" colspan="2"><c:out value='${detail.billing.code}'/></td>
                                    <td align="center"><c:out value='${detail.billing.currency.symbol}'/></td>
                                    <td align="right"><fmt:formatNumber value='${detail.billing.exchange.rate}'/></td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${detail.totalAmount}' pattern=',##0.00'/>
                                    </td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${detail.totalDefAmount}' pattern=',##0.00'/>
                                        <c:set var='t_amt' value='${t_amt+detail.totalDefAmount}'/>
                                        <c:set var='g_amt' value='${g_amt+detail.totalDefAmount}'/>
                                    </td>
                                </tr>
                                <c:forEach items='${detail.billing.journalEntry.details}' var='journal'>
                                <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align="left">&nbsp;&nbsp;&nbsp;<c:out value='${journal.account.code}'/></td>
                                    <td align="left" colspan="3"><c:out value='${journal.account.name}'/></td>
                                    <td align="right">
                                    	<c:if test="${journal.postingType == 'DEBET'}">
                                        	<fmt:formatNumber value='${journal.amount}' pattern=',##0.00'/>                                            
                                       	</c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test="${journal.postingType == 'CREDIT'}">
                                        	<fmt:formatNumber value='${journal.amount}' pattern=',##0.00'/>
                                        </c:if>
                                    </td>
                                </tr>
                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                  	<td colspan="5" align="left"><strong>Total for <c:out value='${report.customer.code} - ${report.customer.firstName} ${report.customer.middleName} ${report.customer.lastName}'/> </strong></td>
                                    <td align="right" width="15%">&nbsp;</td>
                                  	<td align="right" width="14%">
                                    	<strong>
                                            <fmt:formatNumber value='${t_amt}' pattern=',##0.00'/>
                                            <c:remove var='t_amt'/>
                                        </strong>
                                  	</td>
                                </tr>
                                </tfoot>
                                </table>
                                </c:forEach>
                                <table style="border-top:1px solid black" cellpadding="5" width="100%">
                                <thead>
                                <tr>
                                  	<th colspan="5" align="left"><strong>Total Transaction </strong></th>
                                    <th align="right" width="15%">&nbsp;</th>
                                  	<th align="right" width="14%">
                                    	<fmt:formatNumber value='${g_amt}' pattern=',##0.00'/>
                                        <c:remove var='g_amt'/>
                                  	</th>
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
