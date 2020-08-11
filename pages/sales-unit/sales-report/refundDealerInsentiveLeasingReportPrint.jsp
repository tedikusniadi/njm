<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Organization</td>
		<td width="95%">: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Leasing</td>
		<td width="95%">: <c:out value='${leasing}'/></td>			  
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Period</td>
		<td width="95%">: <fmt:formatDate value='${filterCriteria.date}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Sales</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl SJ</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pencairan Leasing</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pencarian Sub Leasing</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Nominal AR Insentive</th>
    </tr>
</thead>
<tbody>

<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="10" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.unitSalesOrder.code}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrder.salesPerson.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.deliveryOrder.date}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrder.customer.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrder.customerUnit.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrder.approvedPaymentLeasing.partyLeasing.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.receiptLeasing.receipt.date}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.receiptSubLeasing.receipt.date}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.unitSalesOrder.refundDealer.amount}' pattern='#,###'/></td> 
	    </tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
