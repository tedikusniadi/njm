<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="30">Company</td>
		<td width="1">:&nbsp;&nbsp;</td>
		<td width="344"><c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td width="30">Period</td>
		<td width="1">:&nbsp;&nbsp;</td>
		<td width="344"><%-- <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp;  --%><fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>								
</table>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
	    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Nomor</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Receipt</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
	  	<th width="14%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
	  	<th width="16%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah Tagihan</th>
	</tr>
</thead>
<tbody>
	<c:set var="amountTotal" value="0"/>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="10" nowrap="nowrap" style="border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
    <c:forEach items='${report.datas}' var='data'>
	<c:set var="amountTotal" value="${amountTotal + data.receiptAdapter.receipt.receiptInformation.amount}"/>
    <tr>
	  	<td nowrap="nowrap" style="border-top:1px solid black;border-left:1px solid black;"><c:out value='${data.receiptAdapter.receipt.code}'/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><fmt:formatDate value='${data.receiptAdapter.receipt.date}' pattern='dd-MM-yyyy'/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value='${data.receiptAdapter.receipt.receiptType}'/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-top:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.receiptAdapter.receipt.receiptInformation.amount}' pattern='#,###'/></td>
     </tr>
        <c:forEach items="${data.receiptAdapter.applications}" var="app">
        <tr>
        	<td nowrap="nowrap" style="border-left:1px solid black;"><c:out value=''/></td>
        	<td nowrap="nowrap"><c:out value=''/></td>
        	<td nowrap="nowrap"><c:out value=''/></td>
        	<td nowrap="nowrap"><c:out value='${app.unitSalesOrder.salesPerson.name}'/></td>
        	<td nowrap="nowrap"><c:out value='${app.unitSalesOrder.customer.name}'/></td>
        	<td nowrap="nowrap"><c:out value='${app.address}'/></td>
	        <td nowrap="nowrap"><c:out value='${app.phone}'/></td>
	        <c:forEach items="${app.unitSalesOrder.items}" var="item">
	        	<td nowrap="nowrap"><c:out value='${item.product.types}'/></td>
	        </c:forEach>
        	<td nowrap="nowrap"><c:out value='${app.unitSalesOrder.approvedPaymentLeasing.partyLeasing.name}'/></td>
        	<td nowrap="nowrap" style="border-right:1px solid black;"><c:out value=''/></td>
        </tr>
        </c:forEach>
     </c:forEach>
	 </c:forEach>
	 <tr>
	  	<td colspan="9" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black;"><strong>Total</strong></td>
	  	<td nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${amountTotal}' pattern='#,###'/></strong></td>
	 </tr>
</tbody>
</table>
