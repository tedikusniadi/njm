<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td width="90%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warehouse</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jabatan Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Atasan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kelurahan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kecamatan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kota/Kabupaten</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Buku Service</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Harga Beli</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">BBN Astra</th>
  		<!-- <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lokasi</th> -->
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cara Bayar</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No PO Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl PO Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">DP PO</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Credit</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Angsuran</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tenor</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Cash</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Credit</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Program</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi MD</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi DM</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biaya Tambahan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Murni</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Mediator</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mediator (Rp)</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Ambil Mdt</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pengirim</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl SJ Kembali</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Tagih Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Tagih Sub Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar Subsidi Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Subsidi Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pengajuan Faktur</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Faktur Dari MD</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Wilayah Samsat</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Acc Tahun</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice BBN</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jasa BBN</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biaya Lain-lain</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pengajuan BBN</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl STNK Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl STNK Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Plat Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Plat Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BPKB Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BPKB Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="67" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.date}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.deliveryPlanningSequence.facility.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.personInformation.position}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.personInformation.supervisor.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.code}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.code}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customer.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customerUnit.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.address}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.village}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.subdistrict.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.city.name}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.phone}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.types}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.typeNames}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.colors}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.serial}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.serialExt1}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.year}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailAcc.serial}'/></td>
     		<c:if test="${data.salesAdapter.unitSalesOrder.unitSalesType == 'UNIT'}">
     			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.purchasePrice}' pattern='#,###'/></td>
     			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.OTR}' pattern='#,###'/></td>
     		</c:if>
     		<c:if test="${data.salesAdapter.unitSalesOrder.unitSalesType != 'UNIT'}">
     			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.purchasePrice}' pattern='#,###'/></td>
     			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.totalForCustomerDealer}' pattern='#,###'/></td>
     		</c:if>
   			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.bbnAstra}' pattern='#,###'/></td>
     		<%-- <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.addressUnit.city.name}'/></td> --%>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.unitPayment}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.partyLeasing.name}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.poLeasing}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.leasing.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.subdictionLeasing}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">
     			<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
     				<fmt:formatNumber value='0' pattern='#,###'/>
    			</c:if>
     			<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
     				<fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/>
    			</c:if>
     		</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leasing.installment}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leasing.tenor}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">
	     		<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	     			<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
	    		</c:if>
	     		<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	     			<fmt:formatNumber value='0' pattern='#,###'/>
	    		</c:if>
    		</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">
     			<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
     				<fmt:formatNumber value='0' pattern='#,###'/>
    			</c:if>
     			<c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
     				<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
    			</c:if>
    		</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.programCustomer}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.mainDealer}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.pureSubdiction+data.salesAdapter.extra}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.extra}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.prepayment}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.secondarySales.name}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.mediatorAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.mediatorDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.driver.name}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.deliveryOrderRealization.updatedDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.unitLeasing.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.unitSubdictionLeasing.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.receiptLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.receiptSubdictionLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.receiptLeasing.paidAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.receiptSubdictionLeasing.paidAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.invoiceMainDealerApproval.dealerApproval.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.invoiceMainDealer.receivedDate}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;">
		     	<c:if test="${data.address.city.availableRegion}">
		     		<c:out value='${data.address.subdistrict.parent.name}'/>
		     	</c:if>
	     		<c:if test="${!data.address.city.availableRegion}">
	     			<c:out value=''/>
	     		</c:if>
     		</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.accAmount}' pattern='#,###'/></td>
     		<%-- <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.noticeAmount}' pattern='#,###'/></td> --%>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.noticeBBN}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.serviceAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.otherAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.salesAdapter.unitSalesOrder.bbnDetail.bbn.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.bbnPrintoutDetail.bbnPrintout.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.stnkReceivedDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.stnkDeliveredDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.platReceivedDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.platDeliveredDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.bpkbReceivedDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.bpkbDeliveredDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.leasing.note}'/></td>
 		</tr>
 		</c:forEach>
 		<tr>
 			<td colspan="22" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.HJOtr}' pattern='#,###'/></strong></td>
 			<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.DPPO}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiLeasing}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.umCredit}' pattern='#,###'/></strong></td>
 			<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCash}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCredit}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discProgram}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiMD}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiDM}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.extra}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.UM}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.mediatorAmount}' pattern='#,###'/></strong></td>
 			<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.paidBBN}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.pencairanSubsidi}' pattern='#,###'/></strong></td>
 			<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.accTahun}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.noticeBBN}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.serviceBBN}' pattern='#,###'/></strong></td>
 			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.otherBBN}' pattern='#,###'/></strong></td>
 			<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
 		</tr>
	</c:forEach>
	<tr>
		<td colspan="22" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${HJOtrTotal}' pattern='#,###'/></strong></td>
		<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${DPPOTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiLeasingTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${umCreditTotal}' pattern='#,###'/></strong></td>
		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCashTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCreditTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discProgramTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiMDTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiDMTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${extraTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${UMTotal}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${mediatorAmountTotal}' pattern='#,###'/></strong></td>
		<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${paidBBNTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${pencairanSubsidiTotal}' pattern='#,###'/></strong></td>
 		<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${accTahunTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${noticeBBNTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${serviceBBNTotal}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${otherBBNTotal}' pattern='#,###'/></strong></td>
 		<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	</tr>
	<tr>
		<td colspan="60">&nbsp;</td>
	</tr>
	<tr>
		<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary</th>
	</tr>
	<tr>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama Tipe</th>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
	</tr>
	<c:forEach items="${summaries}" var="sum">
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<c:if test="${not empty sum.unitType}">
				<c:out value='${sum.unitType}'/>
			</c:if>
			<c:if test="${empty sum.unitType}">
				<strong><c:out value='Total'/></strong>
			</c:if>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<c:if test="${empty sum.unitType}">
				<strong><c:out value='${sum.total}'/></strong>
			</c:if>
			<c:if test="${not empty sum.unitType}">
				<c:out value='${sum.total}'/>
			</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
    <tr>
    	<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary Leasing</th>
    </tr>
    <tr>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama Leasing</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
    </tr>
    <c:forEach items="${summariesLeasing}" var="sumLeas">
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
    		<c:if test="${not empty sumLeas.leasingName}">
    			<c:out value='${sumLeas.leasingName}'/>
    		</c:if>
    		<c:if test="${empty sumLeas.leasingName}">
    			<strong><c:out value='Total'/></strong>
    		</c:if>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<c:if test="${empty sumLeas.leasingName}">
    			<strong><c:out value='${sumLeas.total}'/></strong>
    		</c:if>
    		<c:if test="${not empty sumLeas.leasingName}">
    			<c:out value='${sumLeas.total}'/>
    		</c:if>
    	</td>
    </tr>
    </c:forEach>
    <tr>
    	<td colspan="2">&nbsp;</td>
    </tr>
	<tr>
		<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Cash'/></strong></td>
	 	<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${cash}'/></td>
	</tr>
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Credit'/></strong></td>
	 	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${credit}'/></td>
    </tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
    <tr>
    	<th colspan="9" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary Sales</th>
    </tr>
    <tr>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama Sales</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Penjualan Cash</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Penjualan Credit</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Total Penjualan</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Total Disc Cash</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Average Disc Cash</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Total Disc Credit</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Average Disc Credit</th>
    	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Average Disc Total</th>
    </tr>
    <c:forEach items="${salesSummaries}" var="sumSales">
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
    		<c:out value='${sumSales.name}'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<c:out value='${sumSales.cash}'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<c:out value='${sumSales.credit}'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<c:out value='${sumSales.total}'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<fmt:formatNumber value='${sumSales.discountCash}' pattern='#,###'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<c:if test="${sumSales.cash > 0 }">
    			<fmt:formatNumber value='${sumSales.discountCash/sumSales.cash}' pattern='#,###'/>
    		</c:if>
    		<c:if test="${sumSales.cash == 0 }">
    			<fmt:formatNumber value='0' pattern='#,###'/>
    		</c:if>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<fmt:formatNumber value='${sumSales.discountCredit}' pattern='#,###'/>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    	<c:if test="${sumSales.credit > 0 }">
	    		<fmt:formatNumber value='${sumSales.discountCredit/sumSales.credit}' pattern='#,###'/>
	    	</c:if>
	    	<c:if test="${sumSales.credit == 0 }">
	    		<fmt:formatNumber value='0' pattern='#,###'/>
	    	</c:if>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    	<fmt:formatNumber value='${(sumSales.discountCash+sumSales.discountCredit)/sumSales.total}' pattern='#,###'/>
    	</td>
    </tr>
    </c:forEach>
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='Total'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${sumTotalCash}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${sumTotalCredit}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${sumTotal}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${totalDiscCash}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${totalAvgCash}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${totalDiscCredit}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${totalAvgCredit}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${sumTotalAvg}' pattern='#,###'/></strong>
    	</td>
    </tr>
    </tbody>
</table>
