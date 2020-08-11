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
		<td>: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /><%--  &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /> --%></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<c:set var="totalsaldo" value="0"/>
<c:set var="totalbiaya" value="0"/>
<table width="100%" cellpadding="4" cellspacing="0" class="report-table">
<thead>
<tr>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;border-left:1px solid black;">Tgl Referensi</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nomor Referensi</th>
	<th align="left" width="150" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Pelanggan</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Tipe</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No SPK</th>
	<th align="left" width="50" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah</th>
	<th align="left" width="120" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Atas Nama</th>
	<th align="left" width="80" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
</tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="8" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.adapter.organization}'/></strong></td>
</tr>
<c:if test="${dayBefore}">
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" nowrap="nowrap"><strong>(Pendapatan Kemarin)</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
</tr>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" align="right"><fmt:formatDate value='${dateYesterday}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='Total Pendapatan Kemarin'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${report.adapter.totalYesterdayAmount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td> 
</tr>
</c:if>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong>(Pendapatan)</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<c:forEach items='${report.adapter.detailAddCashes}' var='add'>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" align="right"><fmt:formatDate value='${add.date}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${add.code}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${add.customerName}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${add.reference}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${add.referenceCode}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${add.amount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${add.referenceFrom}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${add.note}'/></td> 
</tr>
</c:forEach>
<c:if test="${fn:length(report.adapter.detailAddCashes) > 0}">
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong>Total Tambah Kas</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><strong><fmt:formatNumber value='${report.adapter.totalAdditionalCash}' pattern='#,###'/></strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
</c:if>
<c:forEach items='${report.adapter.detailRevenues}' var='rev'>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" align="right"><fmt:formatDate value='${rev.date}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${rev.code}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${rev.customerName}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${rev.reference}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${rev.referenceCode}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${rev.amount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${rev.referenceFrom}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${rev.note}'/></td> 
</tr>
</c:forEach>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong>Total Pendapatan</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><strong><fmt:formatNumber value='${report.adapter.totalRevenue}' pattern='#,###'/></strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;">&nbsp;</td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong>(Biaya)</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<c:forEach items='${report.adapter.detailExpenses}' var='exp'>
<tr>
	<td style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;" align="right"><fmt:formatDate value='${exp.date}' pattern='dd-MM-yyyy'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${exp.code}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${exp.customerName}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${exp.reference}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;" nowrap="nowrap"><c:out value='${exp.referenceCode}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><fmt:formatNumber value='${exp.amount}' pattern='#,###'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${exp.referenceFrom}'/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${exp.note}'/></td> 
</tr>
</c:forEach>
<tr>
	<td style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Total Biaya</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><strong><fmt:formatNumber value='${report.adapter.totalExpensePayment}' pattern='#,###'/></strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<tr>
	<td style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong>Total Saldo</strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;text-align: right;"><strong><fmt:formatNumber value='${report.adapter.total}' pattern='#,###'/></strong></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	<td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
</tr>
<tr>
	<td style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;" colspan="8">&nbsp;</td>
</tr>
</c:forEach>
</tbody>
</table>
