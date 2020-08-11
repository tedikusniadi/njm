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
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/assets/goodsReceipt.css'/>");
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
					Financial Accounting &gt; Account Receivables &gt; Billing &gt;
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
								<a class="item-button-back" href="<c:url value='/page/accountreceivablesbillingreportsummaryprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
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
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td width="96%" valign="top" colspan="6">
										<strong>PT Sadikun Niagamas Raya</strong><br/>
										Jl. Pinangsia Timur No. 4-A, Mangga Besar<br/>
										Jakarta Barat . Telp (021) 6900926, Fax.(021) 6598508
									</td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="40">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6" align="center" class="CSS3"><strong>Tanda Terima Invoice</strong></td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="40">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6" valign="top">
										<table width="100%" cellpadding="0" cellspacing="0" align="left" border="0">
											<tr>
												<td width="10%">Customer</td>
												<td width="3%">:</td>
												<td width="23%">&nbsp;<c:if test='${empty customer}'>All Customers</c:if><c:out value='${customer.firstName} ${customer.middleName} ${customer.lastName}' /></td>
												<td width="30%">&nbsp;</td>
												<td width="13%">Diterima tanggal</td>
												<td width="3%">:</td>
												<td width="13%">&nbsp;<fmt:formatDate value='${now}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>Nama penerima</td>
												<td>:</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>Bagian</td>
												<td>:</td>
												<td>&nbsp;</td>
											</tr>
										</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
								<td colspan="2">&nbsp;</td>
								<td colspan="6">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th align="left" style="border-right:solid 1px black; border-left:solid 1px black; border-bottom:solid 1px black; border-top:solid 1px black;">&nbsp;No.</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">No. Invoice</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Tangal invoice</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Tanggal Jatuh Tempo</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Total</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${report}' var='line' varStatus='status'>
											<tr>
												<td width="2%" style="border-bottom:solid 1px black; border-left:solid 1px black; border-right:solid 1px black;">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="40%" style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;<c:out value='${line.billing.legend}'/></td>
												<td width="15%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center">&nbsp;<fmt:formatDate value='${line.billing.date}' pattern='dd - MM - yyyy'/></td>
												<td width="23%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center">&nbsp;<fmt:formatDate value='${line.billing.collectingStatus.dueDate}' pattern='dd - MM -yyyy'/></td>
												<td width="20%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right">&nbsp;<fmt:formatNumber value='${line.totalAmount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:forEach>
											<tr><td colspan="5">&nbsp;</td></tr>
											<tr>
												<td colspan="2" align="center">Diserahkan Oleh,</td>
												<td colspan="1">&nbsp;</td>
												<td colspan="2" align="center">Diterima Oleh,</td>
												
											</tr>
											<tr>
												<td height="66"colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td colspan="1">&nbsp;</td>
												<td colspan="2" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>												
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								<table border="0" cellpadding="0" cellspacing="0" width="100%" class="out">
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