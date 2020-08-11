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
		<td nowrap="nowrap">Product Name</td>
		<td nowrap="nowrap">: <c:out value='${fn:toUpperCase(productName)}'/></td>			  
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
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cabang</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kode Part</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Part</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Update HET</th>
        <th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Bulan</th>
        <th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HET</th>
        <th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HET Terbaru</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Selisih</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
</tr>
	<c:forEach items='${report.datas}' var='data' varStatus="stat">
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${stat.index+1}'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.organizationName}'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productCode}'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productName}'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.priceUpdateDate}' pattern='dd-MM-yyyy'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.periode}'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.price}' pattern='#,###'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.updatedPrice}' pattern='#,###'/></td>
  		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.differencePrice}' pattern='#,###'/></td>
	</tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
