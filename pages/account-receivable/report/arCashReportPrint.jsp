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
		<td>: <fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd MMM yyyy' />&nbsp;-&nbsp;<fmt:formatDate value='${filterCriteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<c:set var="totalsaldo" value="0"/>
<c:set var="totalbiaya" value="0"/>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
		<th nowrap="nowrap" align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Surat Jalan</th>
		<th nowrap="nowrap" align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
		<th nowrap="nowrap" align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
		<th nowrap="nowrap" align="left" width="15%" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
		<th nowrap="nowrap" align="left" width="15%" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Cash</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Program</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Piutang Konsumen</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Keterangan</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pelunasan</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">No Dokumen</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Nominal</th>
		<th nowrap="nowrap" align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Pembayaran</th>
	</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="15" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
		<c:forEach items='${report.datas}' var='data'>
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;" align="right"><fmt:formatDate value='${data.adapter.date}' pattern='dd-MM-yyyy'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.soCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.doCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.customerName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.customerUnitName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.otr}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.discCash}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.discProgram}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.subMD}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.amount}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.status}'/></td>
			<td colspan="4" nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
		</tr>
		<c:if test="${not empty data.adapter.prepayments}">
			<c:forEach items='${data.adapter.prepayments}' var='prepay'>
				<tr>
					<td nowrap="nowrap" colspan="11" style="border-bottom:1px solid black;" align="right">&nbsp;</td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${prepay.prepayment.date}' pattern='dd-MM-yyyy'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prepay.prepayment.code}'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prepay.amount}' pattern='#,###'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prepay.prepayment.prepaymentType}'/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${not empty data.adapter.receiptApplications}">
			<c:forEach items='${data.adapter.receiptApplications}' var='app'>
				<tr>
					<td nowrap="nowrap" colspan="11" style="border-bottom:1px solid black;" align="right">&nbsp;</td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${app.receipt.date}' pattern='dd-MM-yyyy'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${app.receipt.code}'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${app.paidAmount}' pattern='#,###'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${app.receipt.receiptInformation.paymentMethodType}'/></td>
				</tr>
			</c:forEach>
		</c:if>
		</c:forEach>
	</c:forEach>
</tbody>
</table>
