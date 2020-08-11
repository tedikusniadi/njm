<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Verification</title>
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
				<td width="60%">Financial Accounting > Account Payable > Report > Invoice Verification</td>
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
							<h1 class="page-title">F57 - Invoice Verification<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/invoiceverificationreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/loadingorderreportexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box" style="overflow: scroll;">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT INVOICE VERIFICATION</strong></div>
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
                                        <td width="344" ><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears" style="width:1600px;">&nbsp;
                                <table cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                                  <th width="200" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Reference</th>
                                  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Bill From</th>
                                  <th width="150" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Pertamina SO</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tax Invoice No</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tax Date</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Transaction</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tax 1</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tax 2</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tax 3</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Debit Memo</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Return Tax</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Rounding</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Total Amount</th>
                               	  <th width="100" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Unpaid Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var='tTransaction' value='${0}'/>
                                <c:set var='tTax1' value='${0}'/>
                                <c:set var='tTax2' value='${0}'/>
                                <c:set var='tTax3' value='${0}'/>
                                <c:set var='tDebitMemo' value='${0}'/>
                                <c:set var='tReturnTax' value='${0}'/>
                                <c:set var='tRounding' value='${0}'/>
                                <c:set var='tTotal' value='${0}'/>
                                <c:set var='tUnpaid' value='${0}'/>
                                <c:forEach items='${reports}' var='report'>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${report.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${report.reference}'/></td>
                                    <td align="left"><c:out value='${report.billFrom}'/></td>
                                    <td align="left"><c:out value='${report.pertaminaSO}'/></td>
                                    <td align="left"><c:out value='${report.invoiceNo}'/></td>
                                    <td align="left"><fmt:formatDate value='${report.taxDate}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.transaction}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.transaction*report.tax1}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.transaction*report.tax2}' pattern=',##0.00'/></td> 
                                    <td align="left"><fmt:formatNumber value='${report.transaction*report.tax3}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.debitMemo}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.returnTax}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.rounding}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.transaction+(report.transaction*report.tax1)+(report.transaction*report.tax2)+(report.transaction*report.tax3)+(report.debitMemo)+(report.returnTax)+(report.rounding)}' pattern=',##0.00'/></td>
                                    <td align="left"><fmt:formatNumber value='${report.unpaid}' pattern=',##0.00'/></td>
                                    
                                    <c:set var='tTransaction' value='${tTransaction+report.transaction}'/>
                                    <c:set var='tTax1' value='${tTax1+report.transaction*report.tax1}'/>
                                    <c:set var='tTax2' value='${tTax2+report.transaction*report.tax2}'/> 
                                    <c:set var='tTax3' value='${tTax3+report.transaction*report.tax3}'/>
                                    <c:set var='tDebitMemo' value='${tDebitMemo+report.debitMemo}'/>
                                    <c:set var='tReturnTax' value='${tReturnTax+report.returnTax}'/>
                                    <c:set var='tRounding' value='${tRounding+report.rounding}'/>
                                    <c:set var='tTotal' value='${tTotal+report.transaction+(report.transaction*report.tax1)+(report.transaction*report.tax2)+(report.transaction*report.tax3)+(report.debitMemo)+(report.returnTax)+(report.rounding)}'/>
                                    <c:set var='tUnpaid' value='${tUnpaid+report.unpaid}'/>                                                                    
                                </tr>
                                </c:forEach>
                                <tr>
                                	<td></td>
                                	<td></td>
                                	<td></td>
                                	<td></td>
                                	<td></td>
                                	<td></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tTransaction}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tTax1}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tTax2}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tTax3}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tDebitMemo}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tReturnTax}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tRounding}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tTotal}' pattern=',##0.00'/></td>
                                	<td align="left" style="border-top:1px solid black;"><fmt:formatNumber value='${tUnpaid}' pattern=',##0.00'/></td>
                                </tr>
                                </tbody>
                                </table>
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
