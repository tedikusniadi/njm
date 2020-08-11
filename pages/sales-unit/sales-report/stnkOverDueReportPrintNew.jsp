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
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Samsat Area</th>
   	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
   	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
   	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama</th>
   	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Telepon</th>
   	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat</th>
   	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Tgl Terima BBN</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
<tr>
	<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
</tr>
	<c:forEach items='${report.datas}' var='data'>
    <tr>
	  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.region}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderCode}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesPerson.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customer.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.phone}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${data.bbnDate}' pattern='dd MMM yyyy'/></td> 
    </tr>
    </c:forEach>
</c:forEach>
</tbody>
</table>
