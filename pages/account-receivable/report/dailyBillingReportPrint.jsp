<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
   		<td colspan="5"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Cabang</td>
		<td width="90%" colspan="4">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Created By</td>
		<td nowrap="nowrap" colspan="4">: <c:out value='${customerName}'/></td>
	</tr>
	<tr>	
		<td nowrap="nowrap">Periode</td>
		<td nowrap="nowrap" colspan="4">: <fmt:formatDate value='${date}' pattern='dd MMM yyyy' /></td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="5"><strong>Kwitansi Pembeli Tanpa SPK</strong></td>
	</tr>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemohon</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nominal</th>
	</tr>
	<c:set var="befSOTotal" value="0"/>
	<c:forEach items='${report.beforeSalesOrders}' var='befSO' varStatus="status">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">${befSO.salesCode}</td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${befSO.customerName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${befSO.customerUnitName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${befSO.leasingName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${befSO.amount}' pattern='#,###'/></td>
		<c:set var="befSOTotal" value="${befSOTotal+befSO.amount}"/>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" style="border-bottom:1px solid black;"><strong>Total</strong></td>
		<td style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${befSOTotal}' pattern='#,###'/></strong></td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="5"><strong>Kwitansi Pembeli Sesudah SPK</strong></td>
	</tr>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemohon</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nominal</th>
	</tr>
	<c:set var="aftSOTotal" value="0"/>
	<c:forEach items='${report.afterSalesOrders}' var='aftSO' varStatus="status">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">${aftSO.salesCode}</td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${aftSO.customerName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${aftSO.customerUnitName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${aftSO.leasingName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${aftSO.amount}' pattern='#,###'/></td>
   		<c:set var="aftSOTotal" value="${aftSOTotal+aftSO.amount}"/>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" style="border-bottom:1px solid black;"><strong>Total</strong></td>
		<td style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${aftSOTotal}' pattern='#,###'/></strong></td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="5"><strong>Kwitansi Leasing</strong></td>
	</tr>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemohon</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nominal</th>
	</tr>
	<c:set var="leasingTotal" value="0"/>
	<c:forEach items='${report.leasings}' var='leasing' varStatus="status">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">${leasing.salesCode}</td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.customerName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.customerUnitName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.leasingName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${leasing.amount}' pattern='#,###'/></td>
		<c:set var="leasingTotal" value="${leasingTotal+leasing.amount}"/>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" style="border-bottom:1px solid black;"><strong>Total</strong></td>
		<td style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${leasingTotal}' pattern='#,###'/></strong></td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
    
	<tr>
		<td colspan="5"><strong>Kwitansi Subsidi Leasing</strong></td>
	</tr>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemohon</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nominal</th>
	</tr>
	<c:set var="subLeasingTotal" value="0"/>
	<c:forEach items='${report.subLeasings}' var='leasing' varStatus="status">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">${leasing.salesCode}</td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.customerName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.customerUnitName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${leasing.leasingName}'/></td>
   		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${leasing.amount}' pattern='#,###'/></td>
		<c:set var="subLeasingTotal" value="${subLeasingTotal+leasing.amount}"/>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" style="border-bottom:1px solid black;"><strong>Total</strong></td>
		<td style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subLeasingTotal}' pattern='#,###'/></strong></td>
	</tr>
	</c:forEach>
    </tbody>
    <tfoot>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
    </tfoot>
</table>
