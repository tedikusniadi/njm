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
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Cabang</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Toko</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Area Toko</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kode Part</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Part</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mad Dari M-4</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">${month}</th>
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
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.organizationName}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerName}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productCode}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productName}'/></td>
     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.qtyMinFourMonth}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.qtyThisMonth}' pattern='#,###'/></td>
	    <td>&nbsp;</td>
	</tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
