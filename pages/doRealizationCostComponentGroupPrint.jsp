<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SO Cost Component Distribution Print</title>
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
					Sales > Sales Order > Standard Sales Order > Sales Cost Component Distribution > Edit > Print
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
								<a class="item-button-back" href="<c:url value='/page/dorealizationcostcomponentgrouppreedit.htm?id=${cost_group_edit.id}'/>"><span>Back</span></a>
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
									<td width="46%">
										<table>
											<tr>
												<td>Bayar Kepada<td>
												<td>:</td>
												<td><c:out value='${cost_group_edit.supplier.salutation} ${cost_group_edit.supplier.firstName} ${cost_group_edit.supplier.middleName} ${cost_group_edit.supplier.lastName}'/></td>
											</tr>
											<tr>
												<td>Cash<td>
												<td>:</td>
												<td><c:out value='${cost_group_edit.account.accountNo}'/></td>
											</tr>
										</table>
									</td>
									<td width="22%">&nbsp;</td>
									<td width="28%">
										<table>
											<tr>
												<td>No. Bukti<td>
												<td>:</td>
												<td><c:out value="${cost_group_edit.code}"/></td>
											</tr>
											<tr>
												<td>Tanggal<td>
												<td>:</td>
												<td><fmt:formatDate value='${cost_group_edit.date}' pattern='dd-MM-yyyy'/></td>
											</tr>
										</table>
									</td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td width="2%" colspan="2">&nbsp;</td>
									<td colspan="3" width="96%" align="center" class="CSS3" align="middle">
										<strong>BUKTI PENGELUARAN CASH</strong>
									</td>
									<td width="2%" colspan="2">&nbsp;</td>
								</tr>
								<tr colspan="7" height="22"><td>&nbsp;</td></tr>
								<tr>
								<td colspan="2">&nbsp;</td>
								<td colspan="3">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th width="26%" colspan="3" align="left" style="border-right:solid 1px black; border-bottom:double 3px black; border-top:solid 1px black;">&nbsp;No. Perkiraan</th>
											<th width="44%" colspan="6" align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:double 3px black;">Keterangan</th>
											<th width="26%" colspan="2" align="center" style="border-top:solid 1px black; border-bottom:double 3px black;">Jumlah</th>
										</tr>
										</thead>
										</tbody>
											<c:forEach items='${cost_group_edit.components}' var='com'>
											<tr>
												<td colspan="3" style="border-right:solid 1px black;">&nbsp;</td>
												<td colspan="6" style="border-right:solid 1px black;">&nbsp;<c:out value='${com.deliveryOrderRealization.code} (${com.deliveryOrderRealization.deliveryOrder.code})'/></td>
												<td colspan="2" align="right"><fmt:formatNumber value='${com.amount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="3" style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;</td>
												<td colspan="6" style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;</td>
												<td colspan="2" align="right">&nbsp;</td>
											</tr>
											<tr>
												<td width="12%" valign="top" style="border-bottom:double 3px black;">Cash</td>
												<td width="2%" valign="top" style="border-bottom:double 3px black;">&nbsp;:&nbsp;</td>
												<td width="16%" valign="top" style="border-bottom:double 3px black; border-right:solid 1px black;"><c:out value="${cost_group_edit.account.account.name}"/></td>
												<td width="10%" valign="top" style="border-bottom:double 3px black;">&nbsp;</td>
												<td width="2%" valign="top" style="border-bottom:double 3px black;">&nbsp;&nbsp;</td>
												<td width="14%" valign="top" style="border-bottom:double 3px black; border-right:solid 1px black;">&nbsp;</td>
												<td width="10%" valign="top" style="border-bottom:double 3px black;">&nbsp;</td>
												<td width="2%" valign="top" style="border-bottom:double 3px black;">&nbsp;&nbsp;</td>
												<td width="14%" valign="top" style="border-bottom:double 3px black; border-right:solid 1px black;">&nbsp;</td>
												<td width="20%" valign="top" style="border-bottom:double 3px black;" colspan="2"></td>
											</tr>
											<tr>
												<td valign="top" style="border-bottom:double 3px black;">Produk</td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-bottom:double 3px black; border-right:solid 1px black;"><c:out value="${cost_group_edit.organization.lastName}"/></td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;Inter to</td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-bottom:double 3px black;" colspan="3"></td>
												<td valign="top" align="right" style="border-bottom:double 3px black;"><strong>Jumlah</strong>&nbsp;</td>
												<td valign="top" style="border-bottom:double 3px black;" colspan="2" align="right"><fmt:formatNumber value='${amount}' pattern=',##0.00'/>&nbsp;</td>
											</tr>
											<tr>
												<td valign="top">Dept/div</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black;"></td>
												<td valign="top" colspan="3" style="border-right:solid 1px black;">&nbsp;Finance Departement</td>
												<td valign="top">&nbsp;Terbilang</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" colspan="3"><c:out value='${fn:toUpperCase(said)}'/></td>
											</tr>
											<tr height="66">
												<td valign="top">Dibuat oleh</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black;"></td>
												<td valign="top">&nbsp;Diperiksa oleh</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black;"></td>
												<td valign="top" colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td valign="top" style="border-bottom:solid 1px black;">Nama</td>
												<td valign="top" style="border-bottom:solid 1px black;">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black; border-bottom:solid 1px black;"><c:out value='${cost_group_edit.receiptby}'/>&nbsp;</td>
												<td style="border-right:solid 1px black; border-bottom:solid 1px black;" colspan="3">&nbsp;</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr height="66">
												<td valign="top">Atasan Langsung</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black;"></td>
												<td valign="top">&nbsp;Disetujui oleh</td>
												<td valign="top">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black;"></td>
												<td valign="top" colspan="5">&nbsp;Penerima</td>
											</tr>
											<tr>
												<td valign="top" style="border-bottom:double 3px black;">Nama</td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-right:solid 1px black; border-bottom:double 3px black;"></td>
												<td valign="top" style="border-right:solid 1px black; border-bottom:double 3px black;" colspan="3">&nbsp;</td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;Nama</td>
												<td valign="top" style="border-bottom:double 3px black;">&nbsp;:&nbsp;</td>
												<td valign="top" style="border-bottom:double 3px black;"></td>
												<td valign="top" style="border-bottom:double 3px black;" align="left">&nbsp;tgl : &nbsp;</td>
											</tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="3">&nbsp;</td></tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td align="left" >Harus diisi dengan lengkap</td>
									<td align="center" > Lampiran : semua bukti asli</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%" colspan="2">&nbsp;</td>
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