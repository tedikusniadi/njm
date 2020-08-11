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
		<td width="100">Shift</td>
		<td>: <c:out value='${shift}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <fmt:formatDate value='${criteria.dateFrom}' pattern='dd MMM yyyy' />&nbsp;-&nbsp; <fmt:formatDate value='${criteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<c:set var="totalAmount" value="0"/>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tgl Referensi</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">No Referensi</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Pelanggan</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Jumlah</th>
		<th align="left" width="40%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
	</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='report'>
	<c:set var="subTotalAmount" value="0"/>
	<tr>
		<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
		<c:forEach items='${report.shifts}' var='shift'>
		<tr>
			<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><c:out value='${shift.shift.code}'/></td>
		</tr>
			<c:forEach items='${shift.datas}' var='data'>
			<tr>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.sparepartSalesOrder.date}' pattern='dd-MM-yyyy'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.sparepartSalesOrder.code}'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.sparepartSalesOrder.customer.name}'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.sparepartSalesOrder.amount}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.sparepartSalesOrder.note}'/></td>
				<c:set var="subTotalAmount" value="${subTotalAmount+data.sparepartSalesOrder.amount}"/> 
			</tr>
			</c:forEach>
		</c:forEach>
	<tr>
		<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
 		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${subTotalAmount}' pattern='#,###'/></strong></td>
 		<c:set var="totalAmount" value="${totalAmount+subTotalAmount}"/> 
	</tr>
	</c:forEach>
	<tr>
		<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
 		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${totalAmount}' pattern='#,###'/></strong></td>
 	</tr>
</tbody>
</table>
