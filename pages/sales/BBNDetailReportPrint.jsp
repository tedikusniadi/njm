<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2">
   			<h1 class="title">
   				<c:if test="${referenceType == 'ALL'}">${title}</c:if>
   				<c:if test="${referenceType == 'STNK'}">Serah Terima STNK Report</c:if>
   				<c:if test="${referenceType == 'PLAT'}">Serah Terima PLAT Report</c:if>
   				<c:if test="${referenceType == 'BPKB'}">Serah Terima BPKB Report</c:if>
   			</h1>
   		</td>
	</tr>
	<tr>	
		<td width="6%">Company</td>
		<td width="94%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td width="6%">Periode</td>
		<td width="94%">: <%-- <fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> s/d  --%><fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. SPK</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pelanggan</th>
  		<th width="3%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Telp 1</th>
  		<th width="3%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Telp 2</th>
  		<th width="3%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Mesin</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Rangka</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Wilayah Samsat</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cara Bayar</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<c:if test="${referenceType == 'ALL'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pengambil</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima BPKB</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Pelanggan</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Leasing</th>
	  		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No. BPKB</th>
	  	</c:if>
	  	<c:if test="${referenceType == 'STNK'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nama Pengambil</th>
	  	</c:if>
	  	<c:if test="${referenceType == 'PLAT'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No. Plat</th>
	  	</c:if>
	  	<c:if test="${referenceType == 'BPKB'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima BPKB</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Pelanggan</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Leasing</th>
	  		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No. BPKB</th>
	  	</c:if>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="27" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.salesOrder.date}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.code}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.salesPerson.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.customer.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;">
	     		<c:if test="${data.phone != '01234'}"><c:out value='${data.phone}'/></c:if>
	     	</td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;">
	     		<c:if test="${data.mobile != '01234'}"><c:out value='${data.mobile}'/></c:if>
	     	</td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;">
	     		<c:if test="${not empty data.bbnDetail}"><fmt:formatDate value='${data.bbnDetail.bbn.date}' pattern='dd-MM-yyyy'/></c:if>
	     	</td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.customerUnit.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderItem.product.typeNames}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderItem.product.colors}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderItem.price.serial}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderItem.price.serialExt1}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderItem.price.year}'/></td>
	     	<c:if test="${!data.availableRegion}">
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	     	</c:if>
	     	<c:if test="${data.availableRegion}">
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.subdistrict.parent.name}'/></td>
	     	</c:if>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.unitPayment}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.approvedPaymentLeasing.partyLeasing.name}'/></td>
	  		<c:if test="${referenceType == 'ALL'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.stnk.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.stnk.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.stnk.referenceNo}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.stnk.referenceNoExt}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.stnk.customerName}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.plat.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.plat.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bpkb.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bpkb.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bpkb.priceDetailGroup.date}' pattern='dd-MM-yyyy'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.bpkb.referenceNo}'/></td>
	     	</c:if>
	  		<c:if test="${referenceType == 'STNK'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.stnk.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.stnk.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.stnk.referenceNo}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.stnk.referenceNoExt}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.stnk.customerName}'/></td>
	  		</c:if>
	  		<c:if test="${referenceType == 'PLAT'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.plat.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.plat.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.stnk.referenceNoExt}'/></td>
	  		</c:if>
	  		<c:if test="${referenceType == 'BPKB'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bpkb.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;">
		     		<c:if test="${empty data.bpkb.priceDetailGroup}">
		     			<fmt:formatDate value='${data.bpkb.deliveredDate}' pattern='dd-MM-yyyy'/>
		     		</c:if>
		     	</td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bpkb.priceDetailGroup.date}' pattern='dd-MM-yyyy'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.bpkb.referenceNo}'/></td>
	  		</c:if>
 		</tr>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
