<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="100">Company</td>
		<td width="11">:&nbsp;&nbsp;</td>
		<td width="344"><c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td width="100">Period</td>
		<td width="11">:&nbsp;&nbsp;</td>
		<td width="344"><fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' />&nbsp;-&nbsp;<fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>								
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Referensi TO</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Referensi GI</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Referensi GR</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Product</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin/Serial</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Qty</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value="${data.transferOrderAdapter.transferOrder.date}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.transferOrderAdapter.transferOrder.code}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.transferOrderAdapter.goodsIssue.code}'/></td>
	        <td nowrap="nowrap" colspan="9" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.transferOrderAdapter.goodsReceipt.code}'/></td> 
	    </tr>
		<c:forEach items='${data.transferOrderAdapter.itemAdapters}' var='itemAdapter'>
			<tr>
		    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value=''/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.product.name}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.product.types}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.product.typeNames}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.product.colors}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.serial}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${itemAdapter.serialExt1}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;">
		        	<c:if test="${itemAdapter.year != 0 }"><c:out value='${itemAdapter.year}'/></c:if>
		        	<c:if test="${itemAdapter.year == 0 }"><c:out value=''/></c:if>
		        </td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${itemAdapter.quantity}'/></td> 
		    </tr>
		</c:forEach>	
	</c:forEach>
</c:forEach>
</tbody>
</table>
