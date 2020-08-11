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
								<a class="item-button-back" href="<c:url value='/page/billingprintoption.htm?id=${billing.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
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
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td width="52%" colspan="3" align="left"><strong><c:out value=' ${billing_edit.organization.salutation} ${billing_edit.organization.firstName} ${billing_edit.organization.middleName}'/></strong><br/>
										<c:forEach items="${billing_edit.organization.postalAddresses}" var="postal">
											<c:out value="${postal.address}"/><br/>
										</c:forEach>
									</td>
                  <td width="44%" colspan="3" align="right" class="CSS3" valign="middle"><strong>INVOICE</strong></td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="20">&nbsp;</td></tr>
                </table>
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td width="48%" colspan="3" valign="top">
										<table width="100%" cellpadding="0" cellspacing="0" align="left">
											<tr>
												<td width="20%" valign="top">Pelanggan</td>
												<td width="3%" valign="top">:</td>
												<td width="77%"><c:out value=' ${billing_edit.customer.salutation} ${billing_edit.customer.firstName} ${billing_edit.customer.middleName} ${billing_edit.customer.lastName}'/><br/>
                                <c:forEach items="${billing_edit.customer.postalAddresses}" var="postal">
                                        <c:out value="${postal.address}"/><br/>
                                </c:forEach>
                        </td>
											</tr>
										</table>
									</td>
									<td width="48%" colspan="3" valign="top">
										<table width="100%" cellpadding="0" cellspacing="0" align="left">
											<tr>
												<td width="35%">No. Invoice</td>
												<td width="3%">:</td>
												<td width="62%"><c:out value='${billing_edit.legend}'/></td>
											</tr>
											<tr>
												<td>Tanggal Invoice</td>
												<td>:</td>
												<td><fmt:formatDate value='${billing_edit.date}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td>Tanggal Jatuh Tempo</td>
												<td>:</td>
												<td><fmt:formatDate value='${billing_edit.collectingStatus.dueDate}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<c:if test="${not empty billing_edit.poNo}">
                      <tr>
												<td>No. PO</td>
												<td>:</td>
												<td><c:out value="${billing_edit.poNo}"/></td>
											</tr>
                      </c:if>
										</table>
									</td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
								<td colspan="2">&nbsp;</td>
								<td colspan="6">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th align="left" class="bordered">&nbsp;No.</th>
											<th align="center" class="border-right border-top border-bottom">Nama Barang</th>
											<th colspan="2" align="center" class="border-right border-top border-bottom">Jumlah</th>
											<th align="center" class="border-right border-top border-bottom">Harga Satuan</th>
											<th align="center" class="border-right border-top border-bottom">Total</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${billing_edit.lineItems}' var='item' varStatus='status'>
											<tr>
												<td width="2%" class="border-bottom border-right border-left">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="47%" class="border-bottom border-right">&nbsp;<c:out value='${item.line.self}'/></td>
												<td colspan="2" width="15%" class="border-bottom border-right" align="center"><fmt:formatNumber value='${item.line.quantity}' pattern=',##0.00'/></td>
												<td width="15%" class="border-bottom border-right" align="right"><fmt:formatNumber value='${item.line.unitPrice.amount}' pattern=',##0.00'/>&nbsp;</td>
												<td width="19%" class="border-bottom border-right" align="right"><fmt:formatNumber value='${item.line.quantity*item.line.unitPrice.amount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="2"></td>
												<td colspan="3" align="left" class="border-right">Sub total&nbsp;</td>
												<td align="right" class="border-right"><fmt:formatNumber value='${adapter.totalLineAmountMinusDiscount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											<c:if test='${adapter.totalDiscount != "0E-20"}'>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td colspan="3" align="left" class="border-right">Potongan harga</td>
												<td align="right" class="border-top border-right"><fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:if>
											<c:if test='${adapter.taxAmount != "0E-47"}'>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td colspan="3" align="left" class="border-right">Dasar Pengenaan Pajak (DPP)</td>
												<td align="right" class="border-top border-right"><fmt:formatNumber value='${adapter.totalLineAmount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:if>
											<c:if test='${adapter.taxAmount != "0E-47"}'>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td colspan="3" align="left" class="border-right">Pajak Penghasilan Nilai (PPN)</td>
												<td align="right" class="border-top border-right"><fmt:formatNumber value='${adapter.taxAmount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:if>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td colspan="3" align="left" class="border-right">Total&nbsp;</td>
												<td align="right" class="border-top border-bottom border-right"><fmt:formatNumber value='${adapter.totalAmount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td width="10%" valign="top" align="left">Terbilang</td>
												<td width="2%" valign="top" align="center">&nbsp;:&nbsp;</td>
												<td valign="top" colspan="2" align="left"><c:out value='${fn:toUpperCase(said_id)}'/></td>
											</tr>
											<tr><td colspan="6">&nbsp;</td></tr>
											<tr>
												<td colspan="6">
                        <c:if test="${not empty billing_edit.bankAccount.id}">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td colspan="3">Pembayaran :</td>
														</tr>
														<tr>
															<td colspan="3"><c:out value="${billing_edit.bankAccount.bankBranch}"/></td>
														</tr>
														<tr>
															<td width="3%">A/C</td>
															<td width="2%">&nbsp;:</td>
															<td align="left">&nbsp;<c:out value="${billing_edit.bankAccount.accountNo}"/></td>
														</tr>
														<tr>
															<td>A/N</td>
															<td>&nbsp;:</td>
															<td align="left">&nbsp;<c:out value="${billing_edit.bankAccount.accountName}"/></td>
														</tr>
													</table>
                        </c:if>
												</td>
											</tr>
											<tr><td colspan="6">&nbsp;</td></tr>
											<tr>
												<td colspan="4">
													<table width="100%" border="0" cellpadding="0" cellspacing="0">
														<tr>
															<td colspan="2"><b>Lampiran</b></td>
														</tr>
                              <c:if test="${billing_edit.billingType.id=='2' && not empty billing_edit.doNo}">
                                    <tr>
                                      <td>&nbsp;&#9745;&nbsp;&nbsp; Surat Jalan No. <c:out value="${billing_edit.doNo}"/></td>
                                      <td>&nbsp;</td>
                                    </tr>
                            </c:if>
															<tr>
                                <td>&nbsp;&#9744;&nbsp;&nbsp; Lainnya</td>
															<td>&nbsp;</td>
                              </tr>
													</table>
												</td>
											</tr>
											<tr><td colspan="6">&nbsp;</td></tr>
											<tr>
												<td colspan="5">&nbsp;</td>
												<td align="center">Hormat kami,</td>
											</tr>
											<tr>
												<td colspan="5" height="88">&nbsp;</td>
												<td align="center" valign="bottom">(&nbsp;<c:out value='${billing_edit.signer.firstName} ${billing_edit.signer.middleName} ${billing_edit.signer.lastName}'/>)</td>
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6" style="font-size:10px">
										Note : <br/>
										Invoice berikut adalah bukti penagihan ke customer dan buka sebagai bukti pelunasan.<br/>
										Pelunasan dianggap sah apabila sudah diterima pembayaran ke rekening <c:out value='${billing_edit.organization.firstName} ${billing_edit.organization.middleName}'/>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
							</table>
							<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td>Asli & Merah : Pelanggan &nbsp;&nbsp;&nbsp;Hijau : Finance &nbsp;&nbsp;&nbsp; Biru : Tax &nbsp;&nbsp;&nbsp; Kuning : Billing</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
								<tr>
									<td style="background: black;" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="94%">&nbsp;</td>
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
