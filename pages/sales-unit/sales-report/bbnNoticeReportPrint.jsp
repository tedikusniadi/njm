<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Company</td>
		<td width="95%">: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Period</td>
		<td width="95%">: <fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd MMM yyyy' />&nbsp;-&nbsp; <fmt:formatDate value='${filterCriteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No SPK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemohon</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Thn Rakit</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice BBN</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lain Lain</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Terima STNK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice STNK</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Selisih</th>
    </tr>
</thead>
<tbody>

<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.unitSalesOrderItem.unitSalesOrder.code}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrderItem.unitSalesOrder.customer.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrderItem.unitSalesOrder.customerUnit.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrderItem.price.product.typeNames}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.unitSalesOrderItem.price.year}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.bbnDetail.bbn.date}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.bbnDetail.noticeAmount}' pattern='#,###'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.bbnDetail.otherAmount}' pattern='#,###'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.productPriceDetail.receivedDate}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.productPriceDetail.noticeAmount}' pattern='#,###'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.difference}' pattern='#,###'/></td> 
	    </tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
