<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AP Ledger Detail</title>
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
				<td width="60%">Financial Accounting > Account Payable > Report > AP Ledger Detail </td>
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
							<h1 class="page-title">F51 - AP Ledger Detail<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/apledgerdetailpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/apledgerdetailexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AP LEDGER DETAIL</strong></div>
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
                                <c:set var='g_all' value='${0}'/>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="10%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                                  <th width="25%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Code</th>
                                  <th width="12%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;"></th>
                               	  <th width="17%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Debet</th>
                               	  <th width="17%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Credit</th>
                           	  	  <th width="17%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'>
                                <c:set var='grand' value='${report.opening}'/>
                                <c:set var='t_debet' value='0'/>
                                <c:set var='t_credit' value='0'/>
                                <tr>
                                	<td></td>
                                    <td align="left"><c:out value='${report.supplier.code}'/></td>                                    
                                    <td align="left" colspan="4"><c:out value='${report.supplier.firstName} ${report.supplier.middleName} ${report.supplier.lastName}'/></td>
                                </tr>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${report.start}' pattern='dd-MM-yyyy'/></td>
                                    <td></td>
                                    <td align="left" colspan="3">Opening Balance</td>
                                    <td align="right"><fmt:formatNumber value='${report.opening}' pattern=',##0.00'/></td>
                                </tr>
                                <c:forEach items='${report.views}' var='view'>
                                <c:set var='grand' value='${grand+view.credit-view.debet}'/>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${view.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left">${view.code}</td>
                                    <td></td>
                                    <td align="right">
                                    	<fmt:formatNumber value="${view.debet}" pattern=',##0.00'/>
                                        <c:set var='t_debet' value='${t_debet+view.debet}'/>
                                    </td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${view.credit}' pattern=',##0.00'/>
                                        <c:set var='t_credit' value='${t_credit+view.credit}'/>
                                    </td>
                                    <td align="right"><fmt:formatNumber value='${grand}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${report.end}' pattern='dd-MM-yyyy'/></td>
                                    <td></td>
                                    <td align="left">Closing Balance</td>
                                    <td align="right"><fmt:formatNumber value='${t_debet}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${t_credit}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${grand}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='g_all' value='${g_all+grand}'/>
                                
                                <c:remove var='grand'/>
                                <c:remove var='t_debet'/>
                                <c:remove var='t_credit'/>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr><td colspan="5">&nbsp;</td></tr>
                                <tr>
                                  	<td colspan="4" align="left" style="border-top:1px solid black;"><strong>Total</strong></td>
                                    <td align="left" style="border-top:1px solid black;"></td>
                                    <td align="right" width="17%" style="border-top:1px solid black;">
                                        <strong>
                                        <fmt:formatNumber value='${g_all}' pattern=',##0.00'/>
                                        <c:remove var='g_all'/>
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
