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
					Financial Accounting &gt; Account Receivables &gt; Billing
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
								<a class="item-button-back" href="<c:url value='/page/accountreceivablesbillingreportfinanceprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a href="javascript:step('first','<c:url value='/page/accountreceivablesbillingreportfinanceview.htm'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/accountreceivablesbillingreportfinanceview.htm'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/accountreceivablesbillingreportfinanceview.htm'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/accountreceivablesbillingreportfinanceview.htm'/>');">Last</a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="in">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="CSS1">
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td width="96%"colspan="6" align="right" class="CSS3"><strong>Tanda Terima Invoice Ke Finance</strong></td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="40">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6" valign="top">
										<table width="100%" cellpadding="6" cellspacing="0" align="left" border="0" style="CSS1">
											<tr>
												<td width="5%">Tanggal</td>
												<td width="1%">:</td>
												<td width="11%">
													<c:if test='${not empty filterCriteria.dateFrom}'><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd - MM - yyyy'/></c:if>
												</td>
												<td width="5%">s.d</td>
												<td width="11%">
													<c:if test='${not empty filterCriteria.dateTo}'><fmt:formatDate value='${filterCriteria.dateTo}' pattern='dd - MM - yyyy'/></c:if>
												</td>
												<td width="55%">&nbsp;</td>
												<td width="3%">Hal</td>
												<td width="3%">:</td>
												<td width="2%"><c:out value="${filterCriteria.page}"/>&nbsp;</td>
												<td width="3%">dari</td>
												<td width="2%">${filterCriteria.totalPage}&nbsp;</td>
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
											<th width="2%" align="left" style="border-right:solid 1px black; border-left:solid 1px black; border-bottom:solid 1px black; border-top:solid 1px black;">&nbsp;No.</th>
											<th width="5%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Tgl Invoice</th>
											<th width="16%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">No. Invoice</th>
											<th width="17%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Customer</th>
											<th width="10%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">DPP</th>
											<th width="10%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">PPN</th>
											<th width="10%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Total</th>
											<th width="14%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">No. Faktur Pajak</th>
											<th width="8%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Surat Jalan</th>
											<th width="5%" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Status*</th>
										</tr>
										</thead>
										<c:set var='dppTotal' value='${0}'/>
											<c:set var='PPnTotal' value='${0}'/>
											<c:set var='total' value='${0}'/>
											<c:forEach items='${report}' var='line' varStatus='status'>
											<tr>
												<td style="border-bottom:solid 1px black; border-left:solid 1px black; border-right:solid 1px black;">&nbsp;<c:out value='${status.index+1}'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;<fmt:formatDate value='${line.billing.date}' pattern='dd/MM/yyyy'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="left">&nbsp;<c:out value='${line.billing.legend}'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="left">&nbsp;<c:out value='${line.billing.customer.firstName} ${line.billing.customer.lastName} ${line.billing.customer.middleName}'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${line.totalLineAmount}' pattern=',##0.00'/>&nbsp;</td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${line.taxAmount}' pattern=',##0.00'/>&nbsp;</td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${line.totalAmount}' pattern=',##0.00'/>&nbsp;</td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center">&nbsp;<c:out value='${line.billing.taxNumber.code}-${line.billing.taxNumber.invoiceTax.code}'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="left">&nbsp;<c:out value='${line.billing.doNo}'/></td>
												<td style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right">&nbsp;</td>
												<c:set var='dppTotal' value='${dppTotal+(line.totalLineAmountMinusDiscount)}'/>
												<c:set var='PPnTotal' value='${PPnTotal+line.taxAmount}'/>
												<c:set var='total' value='${total+line.totalAmount}'/>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="3" style="border-right:solid 1px black;">&nbsp;</td>
												<td align="center" style="border-right:solid 1px black; border-bottom:solid 1px black;">Grand Total</td>
												<td align="right" style="border-bottom:solid 1px black; border-right:solid 1px black;"><fmt:formatNumber value='${dppTotal}' pattern=',##0.00'/>&nbsp;</td>
												<td align="right" style="border-bottom:solid 1px black; border-right:solid 1px black;"><fmt:formatNumber value='${PPnTotal}' pattern=',##0.00'/>&nbsp;</td>
												<td align="right" style="border-bottom:solid 1px black; border-right:solid 1px black;"><fmt:formatNumber value='${total}' pattern=',##0.00'/>&nbsp;</td>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr><td colspan="11">&nbsp;</td></tr>
											<tr>													
												<td colspan="11" align="left">* Kolom Status diisi oleh Penerima dokumen tanda &#9745; apabila telah sesuai dan tanda &#9746; apabila tidak sesuai</td>
											</tr>
											<tr><td colspan="11">&nbsp;</td></tr>
											<tr>
												<td colspan="2" align="center">Diserahkan Oleh,</td>
												<td colspan="2" align="center">Diterima Oleh,</td>
												<td colspan="4" align="center">Diperiksa Oleh,</td>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td height="66"colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="2">&nbsp;</td>
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td>Note: &nbsp;&nbsp;&nbsp; Asli : Collector Head :&nbsp;&nbsp;&nbsp; Merah : Collector</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
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