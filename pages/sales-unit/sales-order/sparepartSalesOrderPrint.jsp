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

<body>

<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

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
								<a class="item-button-list" href="<c:url value='/page/sparepartsalesorderview.htm'/>"><span>List</span></a>
								<a class="item-button-back" href="<c:url value='/page/sparepartsalesorderpreedit.htm?id=${salesOrder_edit.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
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
								<table width="100%" border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
	                                    <td><div align="center" class="CSS3" valign="middle"><strong>NOTA SUKU CADANG</strong></div></td>
	                                </tr>
									<tr>
										<td width="43%" valign="top" align="left">
											<table cellspacing="0" cellpadding="2">
												<tr>
													<td>
														<strong>NO</strong>
													</td>
													<td>:</td>
													<td>
														<strong>${salesOrder_edit.code}</strong>
													</td>
													
												</tr>
												<tr>
													<td>Tanggal</td><td>:</td><td><fmt:formatDate value="${salesOrder_edit.date}" pattern="dd MMM yyyy"/></td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>Nama Pelanggan :</td>
													<td>${salesOrder_edit.customer.name}</td>
												</tr>
												<tr>
													<td>Showroom</td><td>:</td><td><c:out value="${salesOrder_edit.organization.name}"/></td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>Alamat Pelanggan :</td>
													<td>${salesOrder_edit.customerAddress.address}</td>
												</tr>
												<tr>
													<td>Kasir</td><td>:</td><td>${salesOrder_edit.shift.cashierPerson.name}</td>
												</tr>
												
											</table>
										</td>
									</tr>
								</table>
								<table width="99%" align="center" cellpadding="2" cellspacing="0">
								<tr>
			    					<td width="1%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;border-left:solid 1px #000000;">No</td>
			    					<td width="24%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="center">Nama Barang</td>
			    					<td width="5%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Qty</td>
			    					<td width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Harga Satuan</td>
			    					<td width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Diskon</td>
			    					<td width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Jumlah Setelah Diskon</td>
								</tr>
								<c:set var="no" value="0"/>
								<c:forEach items="${salesOrder_edit.items}" var="item">
								<c:set var="no" value="${no+1}"/>
								<tr>
									<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-left:solid 1px #000000;">&nbsp;<fmt:formatNumber value="${no}" pattern="#,###"/>.</td>
									<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center">${item.price.product.code} ${item.price.product.name}</td>
	       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value="${item.quantity}" pattern="#,###"/></td>
	       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><fmt:formatNumber value="${item.price.money.amount}" pattern="#,###"/></td>
	       							<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value="${item.discount}" pattern="#,###"/>%</td>
									<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value="${(item.quantity*item.price.money.amount)-((item.quantity*item.price.money.amount)*(item.discount/100))}" pattern="#,###"/></td>
									
								</tr>
								</c:forEach>
								</table>
								<br/>
								<table width="89%" border="0" cellspacing="0" cellpadding="2">
								  <tr>
								    <td width="64%" align="right">Pembelian :</td>
								    <td width="36%" align="right">&nbsp;<fmt:formatNumber value="${salesAdapter.purchase}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td align="right">Diskon Satuan :</td>
								    <td align="right">&nbsp;<fmt:formatNumber value="${salesAdapter.discount}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td align="right">Diskon Pelanggan :</td>
								    <td align="right">&nbsp;<fmt:formatNumber value="${salesAdapter.discountCustomer}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td align="right">Diskon Pembulatan :</td>
								    <td align="right">&nbsp;<fmt:formatNumber value="${salesAdapter.sparepartSalesOrder.discountAmount}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td align="right"><strong>Total : </strong></td>
								    <td align="right">&nbsp;<strong><fmt:formatNumber value="${salesAdapter.total}" pattern="#,###"/></strong></td>
								  </tr>
								  <tr>
									    <td align="right"><strong><fmt:formatDate value="${salesOrder_edit.date}" pattern="dd-MM-yyyy"/></strong></td>
									    <td align="right"></td>
								  	</tr>
								</table>
								
								<table width="100%" border="0" cellspacing="0" cellpadding="2">
								  <tr>
								    <td width="47%" align="center">Pelanggan</td>
								    <td width="53%" align="center">Hormat Kami,</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td align="center">${salesOrder_edit.customer.name}</td>
								    <td align="center">${salesOrder_edit.shift.cashierPerson.name}</td>
								  </tr>
								  <!-- <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr> -->
								  <tr>
								    <td colspan="2">Keterangan : ${salesOrder_edit.note}</td>
								    </tr>
								</table>
							  	<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
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
</div>
</body>
</html>