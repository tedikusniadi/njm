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
						<div class="area" dojoType="Container" id="quick_link_container">			
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/deliveryorderpreedit.htm?id=${order_edit.id}'/>"><span>Back</span></a>
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
									<td width="48%" colspan="3" align="left" class="CSS1"><strong><c:out value='${order_edit.organization.firstName} ${order_edit.organization.middleName}'/></strong><br/>
										<c:forEach items="${order_edit.organization.postalAddresses}" var="postal">
											<c:out value="${postal.address}"/><br/>
										</c:forEach>
									</td>
									<td  width="48%" colspan="3" align="right" class="CSS3" valign="middle"><strong>SURAT JALAN</strong>
                   <br/><div style="font-size:12px">No.&nbsp;<c:out value='${fn:substring(order_edit.code,fn:length(order_edit.code)-8,fn:length(order_edit.code))}'/></div></td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="3" valign="top" align="left">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="27%">Tanggal</td>
												<td width="3%">:</td>
												<td width="70%"><fmt:formatDate value='${order_edit.date}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td>No. Surat Jalan</td>
												<td>:</td>
												<td><c:out value='${order_edit.code}'/></td>
											</tr>
											<%-- <tr>
												<td>No. PO</td>
												<td>:</td>
												<td><c:out value='${sales_info.poNo}'/></td>
											</tr> --%>
											<tr>
												<td>No. Kendaraan</td>
												<td>:</td>
												<td><c:out value='${order_edit.vehicle.name}'/></td>
											</tr>
											<tr>
												<td>Nama Supir</td>
												<td>:</td>
												<td><c:out value="${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}"/></td>
											</tr>
										</table>
									</td>
									<td colspan="3" valign="top" align="leftt">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="27%">Kepada Yth</td>
												<td width="3%">:</td>
												<td width="70%"><c:out value="${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}"/></td>
											</tr>
											<tr valign="middle">
												<td>&nbsp;</td>
												<td></td>
												<td><c:out value='${order_edit.deliveryPlanningSequence.postalAddress.address}'/></td>
											</tr>
											<tr align="top">
												<td>Keterangan</td>
												<td>:</td>
												<td><c:out value="${order_edit.note}"/></td>
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
											<th align="left" class="border-top border-right border-bottom border-left">&nbsp;No.</th>
											<th align="center" class="border-top border-right border-bottom">Nama Barang</th>
											<th align="center" class="border-top border-right border-bottom">Satuan</th>
											<th align="center" class="border-top border-right border-bottom">Jumlah</th>
											<th align="center" class="border-top border-right border-bottom">Keterangan</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${order_edit.items}' var='line' varStatus='status'>
											<tr>
												<td width="5%"  class="border-bottom border-right border-left">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="35%" class="border-bottom border-right">&nbsp;&nbsp;<c:out value='${line.item.sequenceable.product.name}'/></td>
												<td width="20%" class="border-bottom border-right" align="center"><c:out value='${line.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
												<td width="20%" class="border-bottom border-right" align="center"><fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/></td>
												<td width="15%" class="border-bottom border-right" align="right">&nbsp;<c:out value='${line.note}'/></td>
											</tr>
											</c:forEach>
											<tr>
                      	<tr colspan="5"><td>&nbsp;</td></tr>
												<td colspan="5">
                            Keterangan :<br/>
														1. Periksa dengan teliti sebelum barang turun.<br/>
														2. Barang diterima dalam keadaan baik dan sesuai.<br/>
														3. Langsung hubungi Customer Service kami jika terdapat ketidaksesuaian dalam penerimaan barang.<br/>
														4. Barang yang sudah diterima tidak dapat dikembalikan.<br/>
                        </td>
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
												<td align="center">Hormat Kami,</td>
												<td width="5%">&nbsp;</td>
												<td align="center">Disetujui Oleh,</td>
												<td width="5%">&nbsp;</td>
												<td align="center">Yang Menyerahkan,</td>
												<td width="5%">&nbsp;</td>
												<td align="center">Penerima,</td>
											</tr>
											<tr>
												<td width="20%" height="66" align="center" valign="bottom">(&nbsp;<c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.lastName} ${order_edit.createdBy.middleName}'/>)</td>
												<td width="5%">&nbsp;</td>
												<td width="20%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="5%">&nbsp;</td>
												<td width="20%" align="center" valign="bottom">(&nbsp;<c:out value='${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}'/>)</td>
												<td width="5%">&nbsp;</td>
												<td width="20%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td align="left">Asli : Billing  &nbsp;&nbsp;&nbsp; Merah : Distribusi &nbsp;&nbsp;&nbsp;Hijau : Gudang &nbsp;&nbsp;&nbsp; Kuning & Biru : Customer</td>
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