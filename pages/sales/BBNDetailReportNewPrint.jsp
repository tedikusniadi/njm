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
		<td width="10%">Company</td>
		<td width="90%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td width="10%">Tipe</td>
		<td width="90%">: <c:out value='${type}'/></td>			  
	</tr>
	<tr>	
		<td width="10%">Tipe Referensi</td>
		<td width="90%">: <c:out value='${referenceType}'/></td>			  
	</tr>
	<tr>	
		<td width="10%">Periode</td>
		<td width="90%">: <fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> s/d <fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>			  
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
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biro Jasa</th>
	  	<c:if test="${referenceType == 'STNK'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. STNK</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. BPKB</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nama Pengambil</th>
	  	</c:if>
	  	<c:if test="${referenceType == 'PLAT'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No. Plat</th>
	  	</c:if>
	  	<c:if test="${referenceType == 'BPKB'}">
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Plat</th>
	  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima BPKB</th>
	     	<c:if test="${typeStatus == 'UNDELIVERED_CUSTOMER' or typeStatus == 'DELIVERED_CUSTOMER'}">
	  			<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Pelanggan</th>
	  		</c:if>
	     	<c:if test="${typeStatus == 'UNDELIVERED_LEASING' or typeStatus == 'DELIVERED_LEASING'}">
	  			<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penyerahan BPKB Leasing</th>
	  		</c:if>
	  		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No. BPKB</th>
	  	</c:if>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="23" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.soDate}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.soCode}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesPersonName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customer.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.phone}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.mobile}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.bbnDate}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerUnitName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.product.typeNames}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.product.colors}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serial}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serialExt1}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.year}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.region}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitPayment}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasingName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serviceAgent}'/></td>
	  		<c:if test="${referenceType == 'STNK'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.referenceNo}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.referenceNoExt}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.referenceNoExt2}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.customerDetailName}'/></td>
	  		</c:if>
	  		<c:if test="${referenceType == 'PLAT'}">
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.referenceNoExt}'/></td>
	  		</c:if>
	  		<c:if test="${referenceType == 'BPKB'}">
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.plateNumber}'/></td>
		     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.receivedDate}' pattern='dd-MM-yyyy'/></td>
		     	<c:if test="${typeStatus == 'UNDELIVERED_CUSTOMER' or typeStatus == 'DELIVERED_CUSTOMER'}">
		     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		     	</c:if>
		     	<c:if test="${typeStatus == 'UNDELIVERED_LEASING' or typeStatus == 'DELIVERED_LEASING'}">
		     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveredLeasingDate}' pattern='dd-MM-yyyy'/></td>
	     		</c:if>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.referenceNo}'/></td>
	  		</c:if>
 		</tr>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
