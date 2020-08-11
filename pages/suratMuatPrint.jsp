<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Picking Order Print</title>
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
								<a class="item-button-back" href="<c:url value='/page/pickingorderpreedit.htm?id=${order.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" class="CSS6" cellpadding="0" cellspacing="0">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td colspan="6" width="98%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="3" align="left" class="CSS4"><strong><c:out value='${order.organization.firstName} ${order.organization.lastName} ${order.organization.middleName}'/></strong></td>
									<td colspan="3" align="right" class="CSS3"><strong>SURAT MUAT</strong></td>
									<td>&nbsp;</td>
								</tr>
								<tr><td colspan="8" height="20">&nbsp;</td></tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="3" valign="top" width="58%" align="right">
										<table width="100%" cellpadding="3" cellspacing="0" align="left">
											<tr>
												<td width="27%">Tanggal</td>
												<td width="3%">:</td>
												<td width="70%"><fmt:formatDate value='${order.date}' pattern='dd - MM - yyyy'/></td>
											</tr>
											<tr>
												<td>No. Kendaraan</td>
												<td>:</td>
												<td><c:out value='${order.vehicle.id}'/></td>
											</tr>
										</table>
									</td>
									<td colspan="3" valign="top" width="40%" align="right">
										<table width="100%" cellpadding="3" cellspacing="0">
											<tr>
												<td width="27%">Rit</td>
												<td width="3%">:</td>
												<td width="70%"><c:out value="${order.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}"/></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr>
								<td>&nbsp;</td>
								<td colspan="6">
									<table class="CSS6" border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th align="left" style="border-right:solid 1px black; border-left:solid 1px black; border-bottom:solid 1px black; border-top:solid 1px black;">&nbsp;No.</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Nama Barang</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Satuan</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Jumlah</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">Keterangan</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${order.items}' var='line' varStatus='status'>
											<tr>
												<td width="5%" style="border-bottom:solid 1px black; border-left:solid 1px black; border-right:solid 1px black;">&nbsp;<c:out value='${status.index+1}'/></td>
												<td width="35%" style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;&nbsp;<c:out value='${line.item.sequenceable.product.code}-${line.item.sequenceable.product.name}'/></td>
												<td width="20%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><c:out value='${line.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
												<td width="20%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/></td>
												<td width="15%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right">&nbsp;<c:out value='${line.note}'/></td>
											</tr>
											</c:forEach>
											<tr colspan="5"><td>&nbsp;</td></tr>
											<tr><td colspan="5">Note :&nbsp;<c:out value='${order.note}'/></td></tr>
										</tbody>
									</table>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr>
									<td colspan="8">
										<table class="CSS6" border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center">Loader</td>
												<td>&nbsp;</td>
												<td align="center">Checker</td>
												<td>&nbsp;</td>
												<td align="center">Sopir</td>
											</tr>
											<tr>
												<td width="30%" height="66" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="5%">&nbsp;</td>
												<td width="30%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
												<td width="5%">&nbsp;</td>
												<td width="30%" align="center" valign="bottom">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="6" class="CSS6" align="center">Asli : Billing  &nbsp;&nbsp;&nbsp; Merah : Distribusi &nbsp;&nbsp;&nbsp;Hijau : Gudang &nbsp;&nbsp;&nbsp; Kuning & Biru : Customer</td>
									<td>&nbsp;</td>
								</tr>
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td colspan="6" width="98%">&nbsp;</td>
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