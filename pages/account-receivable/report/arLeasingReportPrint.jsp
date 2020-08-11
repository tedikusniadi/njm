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
		<td>Type</td>
		<td>: <c:out value='${type}'/></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table style="width: 100%" cellpadding="4" cellspacing="0">
<thead>
	<tr>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pencairan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Receipt</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Total</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl SJ</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No SJ</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Kwitansi</th>
		<th nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nominal</th>
	</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
		<c:forEach items='${report.datas}' var='data'>
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.adapter.date}' pattern='dd-MM-yyyy'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.receipt}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.leasing}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.adapter.total}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
		</tr>
		<c:forEach items='${data.adapter.details}' var='det'>
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;">&nbsp;</td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.soCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.doCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerUnitName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.billingCode}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.amount}' pattern='#,###'/></td>
		</tr>
		</c:forEach>
		</c:forEach>
	</c:forEach>
</tbody>
</table>
