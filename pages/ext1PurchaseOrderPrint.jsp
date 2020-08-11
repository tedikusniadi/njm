<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Surat Pesanan</title>
	<style type="text/css" media="screen,print">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/purchaseOrderPrint.css"); -->
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
								<a class="item-button-back" href="<c:url value='/page/ext1purchaseorderpreedit.htm?id=${purchaseOrder_edit.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" class="CSS1" cellpadding="5" cellspacing="0" style="border:1px solid black;">
                                <tr class="CSS">
                                    <td colspan="8" align="center" valign="middle" class="border_Right_Bottom" style="height:28px;"><div class="pageTitle">PT. SADIKUN NIAGAMAS RAYA</div></td>
                                    <td colspan="2" align="center" valign="middle" class="border_Bottom font10 tebal">Syarat-syarat</td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="left" valign="middle" class="border_Bottom">&nbsp;&nbsp;<strong>SURAT PESANAN &nbsp;&nbsp;</strong></td>
                                    <td width="22%" align="left" valign="middle" class="border_Bottom"> No. <c:out value='${purchaseOrder_edit.code}'/></td>
                                    <td colspan="4" align="left" valign="middle" class="border_Right_Bottom">Tgl. <fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd - MM - yyyy'/></td>
                                    <td width="15%" align="left" valign="top" class="">&nbsp;</td>
                                    <td width="14%" align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="8" align="left" valign="top" class="border_Right_Bottom"></td>
                                  <td align="left" valign="top" class="">Tgl Pesan </td>
                                  <td align="left" valign="top" class="">:</td>
                                </tr>
                                <tr>
                                  <td colspan="3" align="left" valign="top" class="border_Right">Kepada Yang Terhormat : </td>
                                  <td align="left" valign="top" class="border_Right">Alamat Pengiriman : </td>
                                  <td colspan="4" align="left" valign="top" class="border_Right">Alamat Kwitansi : </td>
                                  <td align="left" valign="top" class="">Tgl Permintaan kirim </td>
                                  <td align="left" valign="top" class="">:</td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="left" valign="top" class="border_Right">
                                        <c:out value='${purchaseOrder_edit.supplier.firstName} ${purchaseOrder_edit.supplier.middleName} ${purchaseOrder_edit.supplier.lastName}'/>
                                    </td>
                                    <td align="left" valign="top" class="border_Right"><c:out value='${purchaseOrder_edit.shipTo.postalAddress.address}'/></td>
                                    <td colspan="4" align="left" valign="top" class="border_Right"><c:out value='${purchaseOrder_edit.billTo.address}'/></td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="3" rowspan="2" align="left" valign="top" class="border_Right">&nbsp;&nbsp;</td>
                                  <td rowspan="2" align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td colspan="4" rowspan="2" align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;Konfirm PO </td>
                                  <td align="left" valign="top" class="">:</td>
                                </tr>
                                <tr>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="3" align="left" valign="top" class="border_Right">&nbsp;&nbsp;</td>
                                  <td align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td colspan="4" align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;Syarat Pembayaran </td>
                                  <td align="left" valign="top" class="">:</td>
                                </tr>
                                <tr>
                                  <td colspan="3" align="left" valign="top" class="border_Right">&nbsp;&nbsp;</td>
                                  <td align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td colspan="4" align="left" valign="top" class="border_Right">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="3" align="left" valign="top" class="border_Right_Bottom"></td>
                                  <td align="left" valign="top" class="border_Right_Bottom">&nbsp;</td>
                                  <td colspan="4" align="left" valign="top" class="border_Right_Bottom">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="8" align="left" valign="top" class="border_Right_Bottom font10 tebal">Harap dikirimkan barang-barang tersebut dibawah ini :</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="3%" rowspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">No.</td>
                                  <td width="5%" rowspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Jumlah Barang </td>
                                  <td width="13%" rowspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Kode Barang </td>
                                  <td rowspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Uraian Barang </td>
                                  <td colspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Harga Satuan </td>
                                  <td colspan="2" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Total Harga </td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="6%" align="center" valign="middle" class="border_Right_Bottom font10 tebal">USD</td>
                                  <td width="8%" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Rp.</td>
                                  <td width="6%" align="center" valign="middle" class="border_Right_Bottom font10 tebal">USD</td>
                                  <td width="8%" align="center" valign="middle" class="border_Right_Bottom font10 tebal">Rp.</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                  <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='t_amt' value='${0}'/>
                                <c:forEach items='${purchaseOrder_edit.items}' var='item' varStatus='status'>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right"><c:out value='${status.index+1}'/></td>
                                    <td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                    <td align="left" valign="middle" class="border_Right"><c:out value='${item.product.code}'/></td>
                                    <td align="left" valign="middle" class="border_Right"><c:out value='${item.product.name}'/></td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${item.buyingPrice}' pattern=',##0.00'/></td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${item.buyingPrice*item.quantity}' pattern=',##0.00'/></td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='t_amt' value='${t_amt+(item.buyingPrice*item.quantity)}'/>
                                </c:forEach>
                                <tr>
                                  	<td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="left" valign="top" class="">&nbsp;</td>
                                  	<td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="left" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">&nbsp;</td>
                                    <td align="left" valign="top" class="border_Bottom">&nbsp;</td>
                                    <td align="left" valign="top" class="border_Bottom">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">&nbsp;&nbsp;TOTAL</td>
                                    <td align="right" valign="middle" class="border_Right">-</td>
                                    <td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${t_amt}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right font9 tebal">Pemesanan Div Purchasing</td>
                                    <td align="center" valign="top" class="font9 tebal">Persetujuan Penjual</td>
                                </tr>
                                <tr>
                                  	<td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                  	<td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">&nbsp;&nbsp;DISKON</td>
                                  	<td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                  	<td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                  	<td align="left" valign="top" class="border_Right">&nbsp;</td>
                                  	<td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  	<td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                  	<td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">&nbsp;&nbsp;SUB TOTAL </td>
                                  	<td align="right" valign="middle" class="border_Right">-</td>
                                  	<td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${t_amt}' pattern=',##0.00'/></td>
                                  	<td align="left" valign="top" class="border_Right">&nbsp;</td>
                                  	<td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='tax_1' value='${0}'/>
                                <c:set var='tax_2' value='${0}'/>
                                <c:set var='tax_3' value='${0}'/>
                                <c:if test='${not empty purchaseOrder_edit.tax}'>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">
                                        &nbsp;&nbsp;<c:out value='${purchaseOrder_edit.tax.taxName}'/>&nbsp;<fmt:formatNumber value='${purchaseOrder_edit.tax.taxRate}' pattern='##0'/> %
                                    </td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom"><fmt:formatNumber value='${t_amt*purchaseOrder_edit.tax.taxRate*0.01}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='tax_1' value='${t_amt*purchaseOrder_edit.tax.taxRate*0.01}'/>
                                </c:if>
                                <c:if test='${not empty purchaseOrder_edit.extTax1}'>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">
                                        &nbsp;&nbsp;<c:out value='${purchaseOrder_edit.tax.taxName}'/>&nbsp;<fmt:formatNumber value='${purchaseOrder_edit.extTax1.taxRate}' pattern='##0'/> %
                                    </td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom"><fmt:formatNumber value='${t_amt*purchaseOrder_edit.extTax1.taxRate*0.01}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='tax_2' value='${t_amt*purchaseOrder_edit.extTax1.taxRate*0.01}'/>
                                </c:if>
                                <c:if test='${not empty purchaseOrder_edit.extTax2}'>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">
                                        &nbsp;&nbsp;<c:out value='${purchaseOrder_edit.tax.taxName}'/>&nbsp;<fmt:formatNumber value='${purchaseOrder_edit.extTax2.taxRate}' pattern='##0'/> %
                                    </td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom"><fmt:formatNumber value='${t_amt*purchaseOrder_edit.extTax2.taxRate*0.01}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='tax_3' value='${t_amt*purchaseOrder_edit.extTax2.taxRate*0.01}'/>
                                </c:if>
                                <c:if test='${purchaseOrder_edit.rounding != 0}'>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">
                                        &nbsp;&nbsp;Pembulatan</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom">-</td>
                                    <td align="right" valign="middle" class="border_Right_Bottom"><fmt:formatNumber value='${purchaseOrder_edit.rounding}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right">&nbsp;</td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <c:set var='tax_2' value='${t_amt*purchaseOrder_edit.extTax1.taxRate*0.01}'/>
                                </c:if>
                                <tr>
                                    <td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                    <td colspan="2" align="left" valign="middle" class="border_Right font10 tebal">&nbsp;&nbsp;TOTAL</td>
                                    <td align="right" valign="middle" class="border_Right">-</td>
                                    <td align="right" valign="middle" class="border_Right"><fmt:formatNumber value='${t_amt+tax_1+tax_2+tax_3+purchaseOrder_edit.rounding}' pattern=',##0.00'/></td>
                                    <td align="center" valign="top" class="border_Right font9 tebal"><u></u></td>
                                    <td align="left" valign="top" class="">&nbsp;</td>
                                </tr>
                                <tr>
                                  	<td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                  	<td colspan="2" align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="top" class="border_Right font9 tebal">
                                  		<c:if test="${purchaseOrder_edit.approvable.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
                                    		<c:out value='${purchaseOrder_edit.approvable.approvalDecision.forwardTo.firstName} ${purchaseOrder_edit.approvable.approvalDecision.forwardTo.middleName} ${purchaseOrder_edit.approvable.approvalDecision.forwardTo.lastName}'/>
                                    	</c:if>
                                  	</td>
                                  	<td align="center" valign="top" class="font9 tebal">(nama &amp; stempel) </td>
                                </tr>
                                <tr>
                                  	<td colspan="4" align="center" valign="middle" class="">&nbsp;</td>
                                  	<td colspan="2" align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="middle" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="top" class="border_Right">&nbsp;</td>
                                  	<td align="center" valign="top" class="">&nbsp;</td>
                             	</tr>
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
