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
		<td nowrap="nowrap">Facility</td>
		<td nowrap="nowrap">: <c:out value='${facility}'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">ID Sparepart</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Sparepart</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Grid</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Stok</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Terjual</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pengeluaran Terakhir</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Umur (Hari)</th>
    	<th width="30%">&nbsp;</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
    <td>&nbsp;</td>
</tr>
	<c:forEach items='${report.datas}' var='data'>
	<tr>
		<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong>&nbsp;&nbsp;<c:out value='${data.facility.name}'/></strong></td>
	    <td>&nbsp;</td>
	</tr>
		<c:forEach items='${data.details}' var='detail' varStatus="stat">
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${detail.productCode}'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${detail.productName}'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${detail.gridName}'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${detail.onHand}' pattern='####'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${detail.soldQty}' pattern='####'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${detail.stockDate}" pattern='dd-MM-yyyy'/></td>
		    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${detail.stockAge}'/></td>
		    <td>&nbsp;</td>
		</tr>
		</c:forEach>
	</c:forEach>
</c:forEach>
</tbody>
</table>
