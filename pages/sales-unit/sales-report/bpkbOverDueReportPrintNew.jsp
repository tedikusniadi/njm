<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td>Company</td>
		<td colspan="2">: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="2">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> <%--  &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /> --%></td>			  
	</tr>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Area Samsat</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Plat</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. BPKB</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biro Jasa</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Tgl Terima BBN</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${datas}' var='data'>
	<tr>
    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.salesOrderCode}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customer.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerUnit.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.region}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.plateNumber}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.bpkbNumber}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serviceAgent}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${data.bbnDate}' pattern='dd-MM-yyyy'/></td> 
    </tr>
</c:forEach>
</tbody>
</table>
