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
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tgl Faktur</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penerimaan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Faktur</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kode Part</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Part</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Quantity</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Total Harga</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Jatuh Tempo</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jmlh Tagihan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Piutang</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lead Time</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Payment</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Status</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="14" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.invoiceDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.goodsReceiptDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.dueDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.paymentDate}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.totalAmount}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.unpaid}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leadTime}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.paymentRef}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.status}'/></td>
 		</tr>
 			<c:forEach items='${data.items}' var='item'>
			<tr>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;" colspan="3"><c:out value=''/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${item.productCode}'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${item.productName}'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${item.qty}' pattern='#,###'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${item.total}' pattern='#,###'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;" colspan="7"><c:out value=''/></td>
			</tr>
 			</c:forEach>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
