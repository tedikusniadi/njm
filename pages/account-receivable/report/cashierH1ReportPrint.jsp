<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="100">Company</td>
		<td>: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="4" cellspacing="0" class="report-table">
<thead>
<tr>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;border-left:1px solid black;">Tgl</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Saldo Awal</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Saldo Akhir</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Pendapatan</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;" nowrap="nowrap">Pengembalian Uang Muka</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Biaya</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Net</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Tgl Pendapatan</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Tgl Cash Out</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Selisih</th>
	<th align="left" width="100" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Kode Cash Out</th>
</tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.adapter.organization}'/></strong></td>
</tr>
<c:forEach items='${report.adapter.details}' var='det'>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" align="right"><fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.openingAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.closingAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.revenueAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.prepaymentAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.expenseAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.nettAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;">${det.cashOutDate}</td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.cashOutAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${det.nettAmount-det.cashOutAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;">${det.cashOutCode}</td>
</tr>
</c:forEach>
<%-- <tr>
	<td style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Total Biaya</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><strong><fmt:formatNumber value='${report.adapter.totalExpensePayment}' pattern='#,###'/></strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr> --%>
</c:forEach>
</tbody>
</table>
