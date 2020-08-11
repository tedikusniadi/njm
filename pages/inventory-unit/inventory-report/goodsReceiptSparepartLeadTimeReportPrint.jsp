<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td nowrap="nowrap" width="5%">Organization</td>
		<td nowrap="nowrap" width="80%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cabang</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl PO</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No PO</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penerimaan</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Lead Time</th>
    	<th width="30%">&nbsp;</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="6" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
    <td>&nbsp;</td>
</tr>
	<c:forEach items='${report.datas}' var='data' varStatus="stat">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${stat.index+1}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.organizationName}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.purchaseOrderDate}" pattern='dd-MM-yyyy'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.purchaseOrderCode}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.goodsReceiptDate}" pattern='dd-MM-yyyy'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.leadTime}'/></td>
	    <td>&nbsp;</td>
	</tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
