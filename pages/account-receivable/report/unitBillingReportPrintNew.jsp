<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
   		<td colspan="13"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td nowrap="nowrap">Company</td>
		<td nowrap="nowrap" colspan="2">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Period</td>
		<td nowrap="nowrap" colspan="2">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> - <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Tipe Kwitansi</td>
		<td nowrap="nowrap" colspan="2">: <c:out value='${tipeKwitansi.name}'/></td>			  
	</tr>
	<tr>	
		<td colspan="13">&nbsp;</td>
	</tr>
	<tr>
	    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Nomor</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal SJ</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal SJR</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
	  	<th width="14%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pelanggan</th>
	  	<th width="16%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah Tagihan</th>
	</tr>
	</thead>
	<tbody>
		<c:set var="amountTotal" value="0"/>
		<c:forEach items='${reports}' var='report'>
		<tr>
			<td colspan="13" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
		</tr>
	    <c:forEach items='${report.datas}' var='data'>
	    <tr>
		  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.deliveryCode}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveryDate}' pattern='dd-MM-yyyy'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.realizationDate}' pattern='dd-MM-yyyy'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesPersonName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerUnitName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerAddress}'/></td>
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerContact}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productType}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serial}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serialExt}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasingName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.unpaidAmount}' pattern='#,###'/></td> 
	     </tr>
	     <c:set var="amountTotal" value="${amountTotal+data.unpaidAmount}"/>
	     </c:forEach>
		 </c:forEach>
		 <tr>
		  	<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong>Total</strong></td>
		  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${amountTotal}' pattern='#,###'/></strong></td>
		 </tr>
	</tbody>
</table>
