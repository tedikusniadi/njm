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
<table style="width: 100%" cellpadding="4" cellspacing="0">
<thead>
	<tr>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Surat Jalan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">DP PO</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Cash</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Program</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi MD</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Uang Muka Murni</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pelunasan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Dokumen</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nominal</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Pembayaran</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Kwitansi Leasing</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pelunasan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Dokumen</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nominal</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Kwitansi Subsidi Leasing</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pelunasan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Dokumen</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nominal</th>
	</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="24" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
		<c:forEach items='${report.datas}' var='data'>
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black; align="right"><fmt:formatDate value='${data.adapter.date}' pattern='dd-MM-yyyy'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.soCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.doCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.customerName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.customerUnitName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.otr}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.poPrepayment}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.subdictionLeasing}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.discCash}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.discProgram}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.subMD}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.prepayment}' pattern='#,###'/></td>
			<td colspan="4" nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.leasingAmount}' pattern='#,###'/></td>
			<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.subLeasingAmount}' pattern='#,###'/></td>
			<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
		</tr>
		<c:if test="${not empty data.adapter.details}">
			<c:forEach items='${data.adapter.details}' var='det'>
				<tr>
					<td nowrap="nowrap" colspan="12" style="border-bottom:1px solid black;" align="right">&nbsp;</td>
					<c:if test="${not empty det.prepaymentCustomer}">
						<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.prepaymentCustomer.prepayment.date}' pattern='dd-MM-yyyy'/></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.prepaymentCustomer.prepayment.code}'/></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.prepaymentCustomer.amount}' pattern='#,###'/></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.prepaymentCustomer.prepayment.prepaymentType}'/></td>
					</c:if>
					<c:if test="${empty det.prepaymentCustomer}">
						<c:if test="${not empty det.receiptCustomer}">
							<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.receiptCustomer.receipt.date}' pattern='dd-MM-yyyy'/></td>
							<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.receiptCustomer.receipt.code}'/></td>
							<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.receiptCustomer.paidAmount}' pattern='#,###'/></td>
							<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.receiptCustomer.receipt.receiptInformation.paymentMethodType}'/></td>
						</c:if>
					</c:if>
					<c:if test="${empty det.prepaymentCustomer and empty det.receiptCustomer}">
						<td nowrap="nowrap" style="border-bottom:1px solid black;"></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"></td>
						<td nowrap="nowrap" style="border-bottom:1px solid black;"></td>
					</c:if>
					<td nowrap="nowrap" style="border-bottom:1px solid black;" align="right">&nbsp;</td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.receiptLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.receiptLeasing.receipt.code}'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.receiptLeasing.paidAmount}' pattern='#,###'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;" align="right">&nbsp;</td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.receiptSubLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.receiptSubLeasing.receipt.code}'/></td>
					<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.receiptSubLeasing.paidAmount}' pattern='#,###'/></td>
				</tr>
			</c:forEach>
		</c:if>
		</c:forEach>
	</c:forEach>
</tbody>
</table>
