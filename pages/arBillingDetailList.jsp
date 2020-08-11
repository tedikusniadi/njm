<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Billing Print</title>
	<%@ include file="/filter/billingReportFilter.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
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
				<td width="60%">
					Financial Accounting &gt; Account Receivables &gt; Billing &gt; Edit &gt; Print
				</td>
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
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/accountreceivablesbillingreportdetailprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a href="javascript:step('first','<c:url value='/page/accountreceivablesbillingreportdetailview.htm'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/accountreceivablesbillingreportdetailview.htm'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/accountreceivablesbillingreportdetailview.htm'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/accountreceivablesbillingreportdetailview.htm'/>');">Last</a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="in">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="94%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
								</table>
								<table class="CSS1" border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td width="96%" colspan="6" align="right" class="CSS3"><strong>Daftar Hasil Tagihan</strong></td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="40">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6" valign="top">
										<table width="100%" cellpadding="6" cellspacing="0" align="left" border="0">
											<tr>
												<td width="13%">Nama Collector</td>
												<td width="3%">:</td>
												<td width="67%" colspan="4" align="left"><c:if test='${empty collector}'>All Customers</c:if><c:out value="${collector.firstName} ${collector.middleName} ${collector.lastName}"/></td>
												<td width="3%">Hal</td>
												<td width="3%">:</td>
												<td width="2%"><c:out value="${filterCriteria.page}"/>&nbsp;</td>
												<td width="3%">dari</td>
												<td width="2%"><c:out value="${filterCriteria.totalPage}"/>&nbsp;</td>
											</tr>
											<tr>
												<td>Tanggal</td>
												<td>:</td>
												<td width="10%" align="left">
													<c:if test='${not empty filterCriteria.dateFrom}'><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd - MM - yyyy'/></c:if>
												</td>
												<td width="2%" align="center">s.d</td>
												<td width="10%" align="right">
													<c:if test='${not empty filterCriteria.dateTo}'><fmt:formatDate value='${filterCriteria.dateTo}' pattern='dd - MM - yyyy'/></c:if>
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
										</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
								<td colspan="2">&nbsp;</td>
								<td colspan="6">
									<table class="CSS1" border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th align="left" style="border-right:solid 1px black; border-left:solid 1px black; border-bottom:solid 1px black; border-top:solid 1px black;" rowspan="2">&nbsp;No.</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;" rowspan="2">Customer</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;" colspan="3">Tagihan</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;" colspan="4">Pembayaran</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;" rowspan="2">Keterangan</th>
										</tr>
										<tr>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">Tgl</th>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">No. Invoice</th>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">Jumlah</th>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">Tgl</th>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;" colspan="2">Keterangan Bayar</th>
											<th align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">Jumlah</th>
										</tr>
										</thead>
										</tbody>
											<c:set var='invTotal' value='${0}'/>
											<c:set var='recTotal' value='${0}'/>
											<c:forEach items='${report}' var='line' varStatus='status'>
												<tr>
													<td width="2%" style="border-bottom:solid 1px black; border-left:solid 1px black; border-right:solid 1px black;">&nbsp;<c:out value='${status.index+1}'/></td>
													<td width="12%" style="border-bottom:solid 1px black; border-right:solid 1px black;"><c:out value='${line.billing.customer.firstName} ${line.billing.customer.lastName} ${line.billing.customer.middleName}'/></td>
													<td width="5%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><fmt:formatDate value='${line.billing.date}' pattern='dd/MM/yyyy'/></td>
													<td width="15%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><c:out value='${line.billing.legend}'/></td>
													<td width="12%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${line.totalAmount}' pattern=',##0.00'/>&nbsp;</td>
													<td width="5%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><fmt:formatDate value='${line.receiptApplication.payment.date}' pattern='dd/MM/yyyy'/></td>
													<td width="7%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><c:out value='${line.receiptApplication.payment.receiptInformation.bankAccount.bankBranch}'/></td>
													<td width="7%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><c:out value='${line.receiptApplication.payment.receiptInformation.bankAccount.accountNo}'/></td>
													<td width="12%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${line.receiptApplication.payment.receiptInformation.amount}' pattern=',##0.00'/>&nbsp;</td>
													<td width="16%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="left"><c:out value='${line.billing.note}'/></td>
												</tr>
											<c:set var='invTotal' value='${invTotal+line.totalAmount}'/>
											<c:set var='recTotal' value='${total+line.receiptApplication.payment.receiptInformation.amount}'/>
											</c:forEach>
											<tr>
												<td colspan="3" style="border-right:solid 1px black;">&nbsp;</td>
												<td align="center" style="border-bottom:solid 1px black; border-right:solid 1px black;">Grand Total</td>
												<td align="right" style="border-bottom:solid 1px black; border-right:solid 1px black;"><fmt:formatNumber value='${invTotal}' pattern=',##0.00'/>&nbsp;</td>
												<td style="border-right:solid 1px black;">&nbsp;</td>
												<td colspan="2" align="center" style="border-bottom:solid 1px black;  border-right:solid 1px black;">Grand Total</td>
												<td align="right" style="border-bottom:solid 1px black; border-right:solid 1px black;"><fmt:formatNumber value='${recTotal}' pattern=',##0.00'/>&nbsp;</td>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr><td colspan="11">&nbsp;</td></tr>
											<tr>
												<td colspan="2" align="center">Dibuat Oleh,</td>
												<td colspan="2" align="center">Diperiksa Oleh,</td>
												<td colspan="2" align="center">Diterima Oleh,</td>
												<td colspan="4">&nbsp;</td>
											</tr>
											<tr>
												<td height="66"colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="7">&nbsp;</td>
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								<table border="0" cellpadding="0" cellspacing="0" width="100%" class="out">
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td>Note: &nbsp;&nbsp;&nbsp; Asli : Collector Head :&nbsp;&nbsp;&nbsp; Merah : Collector</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
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