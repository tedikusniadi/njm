<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
				<td width="60%">${breadcrumb}</td>
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
						<h1 class="page-title">${pageTitle}</h1>
                    	<div class="area" dojoType="Container" id="quick_link_container">
					  		<div class="toolbar">
								<a class="item-button-back" href="javascript:history.back();"><span>Back</span></a>
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
									<td width="52%" colspan="3" align="left" class="CSS1"  valign="middle"><strong><c:out value='${goodsReceipt_edit.organization.firstName} ${goodsReceipt_edit.organization.middleName}'/></strong><br/>
										<c:forEach items="${goodsReceipt_edit.organization.postalAddresses}" var="postal">
											<c:out value="${postal.address}"/><br/>
										</c:forEach>
									</td>
									<td width="44%" colspan="3" align="right" class="CSS3" valign="middle"><strong>SURAT PENERIMAAN BARANG</strong>
                   <br/><div style="font-size:12px">No.&nbsp;<c:out value='${fn:substring(goodsReceipt_edit.code,fn:length(goodsReceipt_edit.code)-8,fn:length(goodsReceipt_edit.code))}'/></div>
                  </td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="20">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="3" valign="top" align="left">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="35%">Tanggal</td>
												<td width="3%">:</td>
												<td width="62%"><fmt:formatDate value='${goodsReceipt_edit.date}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td>No. Surat Penerimaan</td>
												<td>:</td>
												<td><c:out value="${goodsReceipt_edit.code}"/></td>
											</tr>
											<tr>
												<td>Tgl Surat Jalan</td>
												<td>:</td>
												<td></td>
											</tr>
											<tr>
												<td>No. Surat Jalan</td>
												<td>:</td>
												<td><c:out value="${goodsReceipt_edit.doNo}"/></td>
											</tr>
										</table>
									</td>
									<td colspan="3" valign="top" align="left">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="40%">
													No.
													<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'PURCHASE_ORDER'}">
														Purchase
													</c:if>
													<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'DIRECT_SALES_ORDER'}">
														Direct Sales Order
													</c:if>
													<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'DELIVERY_ORDER'}">
														Delivery
													</c:if>
													<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'COLLECTING_ORDER'}">
														Collecting
													</c:if>
													<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
														Transfer
													</c:if>
													Order
												</td>
												<td width="3%">:</td>
												<td width="57%"><c:out value="${goodsReceipt_edit.warehouseTransaction.code}"/></td>
											</tr>
											<tr>
												<td>Pemasok</td>
												<td>:</td>
												<td><c:out value="${goodsReceipt_edit.warehouseTransaction.receiveFrom}"/></td>
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
											<th align="left" class="bordered">&nbsp;No.</th>
											<th align="center" class="border-top border-right border-bottom">Nama Barang</th>
											<th align="center" class="border-top border-right border-bottom">Satuan</th>
											<th align="center" class="border-top border-right border-bottom">Jumlah</th>
											<th align="center" class="border-top border-right border-bottom">Keterangan</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${goodsReceipt_edit.items}' var='line' varStatus='status'>
											<tr>
												<td width="5%" class="border-bottom border-right border-left">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="35%"  class="border-bottom border-right">&nbsp;&nbsp;<c:out value='${line.warehouseTransactionItem.product.code}'/>&nbsp;<c:out value='${line.warehouseTransactionItem.product.name}'/></td>
												<td width="20%" class="border-bottom border-right" align="center"><c:out value='${line.warehouseTransactionItem.product.unitOfMeasure.measureId}'/></td>
												<td width="20%"  class="border-bottom border-right" align="center"><fmt:formatNumber value='${line.warehouseTransactionItem.quantity}' pattern=',##0.00'/></td>
												<td width="15%"  class="border-bottom border-right" align="right">&nbsp;</td>
											</tr>
											</c:forEach>
											<tr colspan="5"><td>&nbsp;</td></tr>
											<c:if test="${goodsReceipt_edit.warehouseTransaction.transactionSource == 'PURCHASE_ORDER'}">
											<tr>
												<td colspan="5">Berikan tanda (&#9745;) apabila telah sesuai dan tanda (&#9746;) apabila tidak sesuai<br/>
														&#9744; &nbsp;&nbsp;&nbsp; Jenis barang telah diterima sesuai dengan<br/>
														&#9744; &nbsp;&nbsp;&nbsp; Jumlah barang telah diterima sesuai dengan<br/>
														&#9744; &nbsp;&nbsp;&nbsp; Pembayaran ke Pemasok dapat dilakukan sesuai dengan prosedur yang berlaku<br/>
												</td>
											</c:if>
											<tr><td colspan="5">Keterangan :<br/> <c:out value='${goodsReceipt_edit.note}'/></td></tr>
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
									<td colspan="10">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center">Dibuat Oleh,</td>
												<td align="center">Disetujui,</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td width="25%" height="66" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="25%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="50%">&nbsp;</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td align="left">Asli : Finance  &nbsp;&nbsp;&nbsp; Rangkap Merah : Procurement &nbsp;&nbsp;&nbsp; Rangkap Kuning : Warehouse</td>
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
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>