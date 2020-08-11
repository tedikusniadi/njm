<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting Order >> Print</title>
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
				Procurement > Pertamina Procurement > Collecting Order > Edit > Print
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
								<a class="item-button-back" href="<c:url value='/page/collectingorderpreedit.htm?id=${order_edit.id}'/>"><span>Back</span></a>
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
									<td width="52%" colspan="3" align="left" class="CSS1" valign="middle"><strong><c:out value='${order_edit.organization.firstName} ${order_edit.organization.middleName}'/></strong><br/>
										<c:forEach items="${order_edit.organization.postalAddresses}" var="postal">
											<c:out value="${postal.address}"/><br/>
										</c:forEach>
									</td>
									<td width="44%" colspan="3" align="right" class="CSS3" valign="middle"><strong>COLLECTING ORDER</strong>
                  <br/><div style="font-size:12px">No.&nbsp;<c:out value='${fn:substring(order_edit.code,fn:length(order_edit.code)-8,fn:length(order_edit.code))}'/></div></td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="20">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="3" valign="top" align="left">
										<table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
												<td>Tanggal</td>
												<td>:</td>
												<td><fmt:formatDate value='${order_edit.date}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td width="35%">No. Collect Order</td>
												<td width="3%">:</td>
												<td width="62%"><c:out value='${order_edit.code}'/></td>
											</tr>
											<tr>
												<td>No. LO</td>
												<td>:</td>
												<td><c:out value='${order_edit.loadingOrderPlan.no}'/></td>
											</tr>
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
									<td colspan="3" valign="top" align="left">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="27%">Kepada Yth</td>
												<td width="3%">:</td>
												<td width="70%"><c:out value='${order_edit.loadingOrderPlan.loadingOrder.purchaseOrder.supplier.firstName} ${order_edit.loadingOrderPlan.loadingOrder.purchaseOrder.supplier.middleName} ${order_edit.loadingOrderPlan.loadingOrder.purchaseOrder.supplier.lastName}'/></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td><c:out value='${order_edit.loadingOrderPlan.loadingOrder.purchaseOrder.supplierAddress}'/></td>
											</tr>
										</table>
									</fieldset>
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
											<c:forEach items='${order_edit.loadingOrderPlan.items}' var='line' varStatus='status'>
											<tr>
												<td width="5%" class="border-bottom border-right border-left">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="35%" class="border-bottom border-right">&nbsp;<c:out value='${line.item.product.name}'/></td>
												<td width="20%" class="border-bottom border-right" align="center"><c:out value='${line.item.product.unitOfMeasure.measureId}'/></td>
												<td width="20%" class="border-bottom border-right" align="center"><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
												<td width="15%" class="border-bottom border-right" align="right">&nbsp;<c:out value='${line.note}'/></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="66">&nbsp;</td></tr>
								<tr>
									<td colspan="10">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center">Hormat Kami,</td>
												<td>&nbsp;</td>
												<td align="center">Yang Menyerahkan,</td>
												<td>&nbsp;</td>
												<td align="center">Penerima,</td>
											</tr>
											<tr>
												<td width="30%" height="66" align="center" valign="bottom">(&nbsp;<c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.lastName} ${order_edit.createdBy.middleName}'/>)</td>
												<td width="5%">&nbsp;</td>
												<td width="30%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="5%">&nbsp;</td>
												<td width="30%" align="center" valign="bottom">(&nbsp;<c:out value="${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}"/>&nbsp;)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td>Asli & Merah : Customer &nbsp;&nbsp;&nbsp;Hijau : Finance &nbsp;&nbsp;&nbsp; Biru : Tax &nbsp;&nbsp;&nbsp; Kuning : Billing</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="20">&nbsp;</td></tr>
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
