<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
   		<td colspan="3"><h1 class="title">Daily Sales Report HO</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td width="90%" colspan="3">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="3">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warehouse</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jabatan Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Atasan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No KTP</th>
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
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Keterangan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Harga Beli</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">BBN Astra</th>
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
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sisa Subsidi Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sisa Subsidi MD</th>
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
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar Sub Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Kwitansi Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Kwitansi Sub Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Subsidi Leasing</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pengajuan Faktur</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Faktur Dari MD</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Wilayah Samsat</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biro Jasa</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Acc Tahun</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biaya STCK</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice BBN</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jasa BBN</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lain-lain 1</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lain-lain 2</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pengajuan BBN</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl STNK Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl STNK Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No STNK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Plat Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Plat Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Plat</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BPKB Diterima</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BPKB Diserahkan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No BPKB</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='rep'>
		<c:forEach items='${rep.adapter.summaryAdapters}' var='adap'>
		<tr>
			<td colspan="79" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${adap.organization}'/></strong></td>
		</tr>
 		<c:forEach items='${adap.detailAdapters}' var='det'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${det.date}' pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.warehouse}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesPosition}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.superior}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesOrderCode}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.deliveryOrderCode}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerIDN}'/>&nbsp;</td> <!-- wajib ada spasi -->
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerUnitName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerAddress}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerVillage}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerSubDistrict}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerCity}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerPhone}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemType}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemTypeName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemColor}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemSerial}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemSerialExt}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemYear}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.serviceBookCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.note}'/></td>
   			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.purchasePrice}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.otrSellingPrice}' pattern='#,###'/></td>
   			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.bbnAstraAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.paymentType}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.leasingName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.poLeasingCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.poLeasingDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.poFirstPaymentAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.leasingSubsidy}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">
     			<c:if test="${det.paymentType == 'CASH'}">
     				<fmt:formatNumber value='0' pattern='#,###'/>
    			</c:if>
     			<c:if test="${det.paymentType == 'CREDIT'}">
     				<fmt:formatNumber value='${det.prepaymentCredit}' pattern='#,###'/>
    			</c:if>
     		</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.installmentAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.tenor}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.discountCash}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.discountCredit}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.discountProgram}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.subsidyMD}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.subsidyDM}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.remainingLeasing}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.remainingMainDealer}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.additionalCostAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.prepaymentAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.mediatorName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.mediatorAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.mediatorDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.driverName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.realizationDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.leasingChargeDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.subLeasingChargeDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.leasingPaidDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.subLeasingPaidDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.leasingDueDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.subLeasingDueDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.leasingAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.subLeasingAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.invoiceSubmissionDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.invoiceFromMDDate}'  pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.region}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.bbnServiceName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.accAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.stckAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.noticeBBNAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.serviceBBNAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.otherChargeAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.otherChargeTwoAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.bbnDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.bbnSubmissionDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.stnkReceivedDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.stnkDeliveredDate}'  pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.stnkNumber}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.plateReceivedDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.plateDeliveredDate}'  pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.plateNumber}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.bpkbReceivedDate}'  pattern='dd MMM yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${det.bpkbDeliveredDate}'  pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.bpkbNumber}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${det.leasingNote}'/></td>
 		</tr>
 		</c:forEach>
	 	<tr>
			<td colspan="24" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalOtrSellingPrice}' pattern='#,###'/></strong></td>
			<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalPOFirstPaymentAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalLeasingSubsidy}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalPrepaymentCredit}' pattern='#,###'/></strong></td>
			<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalDiscountCash}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalDiscountCredit}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalDiscountProgram}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalSubsidyMD}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalSubsidyDM}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalRemainingLeasing}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalRemainingMainDealer}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalAdditionalCostAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalPrepaymentAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalMediatorAmount}' pattern='#,###'/></strong></td>
			<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalLeasingAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalSubLeasingAmount}' pattern='#,###'/></strong></td>
			<td colspan="4" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalAccBBNAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalStckBBNAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalNoticeBBNAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalServiceBBNAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalOtherChargeAmount}' pattern='#,###'/></strong></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${adap.totalOtherChargeTwoAmount}' pattern='#,###'/></strong></td>
			<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
		</tr>
	 	</c:forEach>
	<tr>
		<td colspan="24" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalOtrSellingPrice}' pattern='#,###'/></strong></td>
		<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalPOFirstPaymentAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalLeasingSubsidy}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalPrepaymentCredit}' pattern='#,###'/></strong></td>
		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalDiscountCash}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalDiscountCredit}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalDiscountProgram}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalSubsidyMD}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalSubsidyDM}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalRemainingLeasing}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalRemainingMainDealer}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalAdditionalCostAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalPrepaymentAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalMediatorAmount}' pattern='#,###'/></strong></td>
		<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalLeasingAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalSubLeasingAmount}' pattern='#,###'/></strong></td>
		<td colspan="4" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value=''/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalAccBBNAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalStckBBNAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalNoticeBBNAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalServiceBBNAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalOtherChargeAmount}' pattern='#,###'/></strong></td>
		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${rep.adapter.totalOtherChargeTwoAmount}' pattern='#,###'/></strong></td>
		<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	</tr>
	<tr>
		<td colspan="79">&nbsp;</td>
	</tr>
	<tr>
		<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary</th>
	</tr>
	<tr>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama Tipe</th>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
	</tr>
    <c:set var="totalType" value="0"/>
	<c:forEach items="${rep.summaryTypes}" var="sum">
    	<c:set var="subTotalType" value="0"/>
	    <tr>
	    	<td align="left" colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;height: 20px;vertical-align: middle;">
	    		<div><strong><c:out value='${sum.key.name}'/></strong></div>
	    	</td>
	    </tr>
	    <c:forEach items="${sum.value}" var="sumDet">
		<tr>
			<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><c:out value='${sumDet.typeName}'/></td>
			<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${sumDet.total}'/></td>
		</tr>
    	<c:set var="subTotalType" value="${subTotalType+sumDet.total}"/>
    	<c:set var="totalType" value="${totalType+sumDet.total}"/>
		</c:forEach>
	    <tr>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Sub Total</strong></td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><c:out value='${subTotalType}'/></strong></td>
	    </tr>
	</c:forEach>
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Total</strong></td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><c:out value='${totalType}'/></strong></td>
    </tr>
    
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
    <c:set var="totalLeasing" value="0"/>
    <c:forEach items="${rep.summaryLeasings}" var="sumLeas">
    	<c:set var="subTotalType" value="0"/>
	    <tr>
	    	<td align="left" colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;height: 20px;vertical-align: middle;">
	    		<div><strong><c:out value='${sumLeas.key.name}'/></strong></div>
	    	</td>
	    </tr>
	    <c:forEach items="${sumLeas.value}" var="sumLeasDet">
	    <tr>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><c:out value='${sumLeasDet.leasingName}'/></td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${sumLeasDet.total}'/></td>
	    </tr>
    	<c:set var="totalLeasing" value="${totalLeasing+sumLeasDet.total}"/>
	    </c:forEach>
    </c:forEach>
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Total</strong></td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><c:out value='${totalLeasing}'/></strong></td>
    </tr>
    
    <tr>
    	<td colspan="2">&nbsp;</td>
    </tr>
	<tr>
		<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Cash'/></strong></td>
	 	<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${rep.adapter.totalCash}'/></td>
	</tr>
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Credit'/></strong></td>
	 	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${rep.adapter.totalCredit}'/></td>
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
    <c:forEach items="${rep.summarySales}" var="sumSales">
    <c:if test="${not empty sumSales.value}">
	    <tr>
	    	<td align="left" colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;height: 20px;vertical-align: middle;">
	    		<strong><c:out value='${sumSales.key.name}'/></strong>
	    	</td>
	    </tr>
	    <c:set var="cash" value="0"/>
	    <c:set var="credit" value="0"/>
	    <c:set var="totalSales" value="0"/>
	    <c:set var="discountCash" value="0"/>
	    <c:set var="avgDiscountCash" value="0"/>
	    <c:set var="discountCredit" value="0"/>
	    <c:set var="avgDiscountCredit" value="0"/>
	    <c:set var="totalAvgDiscount" value="0"/>
	    <c:forEach items="${sumSales.value}" var="sumSalesDet">
	    <c:set var="cash" value="${cash+sumSalesDet.value.cash}"/>
	    <c:set var="credit" value="${credit+sumSalesDet.value.credit}"/>
	    <c:set var="totalSales" value="${totalSales+sumSalesDet.value.total}"/>
	    <c:set var="discountCash" value="${discountCash+sumSalesDet.value.discountCash}"/>
	    <c:set var="avgDiscountCash" value="${avgDiscountCash+sumSalesDet.value.avgDiscountCash}"/>
	    <c:set var="discountCredit" value="${discountCredit+sumSalesDet.value.discountCredit}"/>
	    <c:set var="avgDiscountCredit" value="${avgDiscountCredit+sumSalesDet.value.avgDiscountCredit}"/>
	    <c:set var="totalAvgDiscount" value="${totalAvgDiscount+sumSalesDet.value.totalAvgDiscount}"/>
	    <tr>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
	    		<c:out value='${sumSalesDet.value.name}'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<c:out value='${sumSalesDet.value.cash}'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<c:out value='${sumSalesDet.value.credit}'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<c:out value='${sumSalesDet.value.total}'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<fmt:formatNumber value='${sumSalesDet.value.discountCash}' pattern='#,###'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<fmt:formatNumber value='${sumSalesDet.value.avgDiscountCash}' pattern='#,###'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<fmt:formatNumber value='${sumSalesDet.value.discountCredit}' pattern='#,###'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<fmt:formatNumber value='${sumSalesDet.value.avgDiscountCredit}' pattern='#,###'/>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
		    	<fmt:formatNumber value='${sumSalesDet.value.totalAvgDiscount}' pattern='#,###'/>
	    	</td>
	    </tr>
		</c:forEach>
	    <tr>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
	    		<strong><c:out value='Sub Total'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><c:out value='${cash}'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><c:out value='${credit}'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><c:out value='${totalSales}'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><fmt:formatNumber value='${discountCash}' pattern='#,###'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><fmt:formatNumber value='${avgDiscountCash}' pattern='#,###'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><fmt:formatNumber value='${discountCredit}' pattern='#,###'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><fmt:formatNumber value='${avgDiscountCredit}' pattern='#,###'/></strong>
	    	</td>
	    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	    		<strong><fmt:formatNumber value='${totalAvgDiscount}' pattern='#,###'/></strong>
	    	</td>
	    </tr>
	</c:if>
    </c:forEach>
    <tr>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='Total'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${rep.adapter.totalCash}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${rep.adapter.totalCredit}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><c:out value='${rep.adapter.total}'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${rep.adapter.totalDiscountCashSales}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${rep.adapter.totalAvgDiscountCash}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${rep.adapter.totalDiscountCreditSales}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${rep.adapter.totalAvgDiscountCredit}' pattern='#,###'/></strong>
    	</td>
    	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
    		<strong><fmt:formatNumber value='${rep.adapter.totalAvgDiscount}' pattern='#,###'/></strong>
    	</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
