<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="10" nowrap="nowrap">Company</td>
		<td nowrap="nowrap">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Period</td>
		<td nowrap="nowrap">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> - <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Tipe Kwitansi</td>
		<td nowrap="nowrap">: <c:out value='${tipeKwitansi.name}'/></td>			  
	</tr>
	<tr>	
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
	    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Nomor</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal SJ</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal SJR</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
	  	<th width="14%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pelanggan</th>
	  	<th width="16%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah Tagihan</th>
	</tr>
</thead>
<tbody>
	<c:set var="amountTotal" value="0"/>
	<c:forEach items='${reports}' var='report'>
	<c:set var="amount" value="0"/>
	<tr>
		<td colspan="13" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
    <c:forEach items='${report.datas}' var='data'>
    <tr>
	  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.billingReportAdapter.deliveryOrder.code}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.billingReportAdapter.deliveryOrder.date}' pattern='dd-MM-yyyy'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.billingReportAdapter.deliveryOrder.deliveryOrderRealization.updatedDate}' pattern='dd-MM-yyyy'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.unitSalesOrder.salesPerson.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.unitSalesOrder.customer.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.unitSalesOrder.customerUnit.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.address}'/></td>
        <c:if test="${data.phone.contact!='01234' }">
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.phone.contact}'/></td>
        </c:if>
        <c:if test="${data.phone.contact=='01234'}">
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
        </c:if>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.item.product.types}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.item.price.serial}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.unitSalesOrderAdapter.item.price.serialExt1}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingReportAdapter.paymentLeasing.partyLeasing.name}'/></td>
        <c:if test="${billingType == '6'}">
			<c:set var="amount" value="${data.billingReportAdapter.unitSalesOrderAdapter.leasing}"/>
        </c:if>
        <c:if test="${billingType == '7'}">
			<c:set var="amount" value="${data.billingReportAdapter.unitSalesOrderAdapter.totalAfterPrepayment}"/>
         </c:if>
         <c:if test="${billingType == '8'}">
			<c:set var="amount" value="${data.billingReportAdapter.unitSalesOrderAdapter.subdictionLeasing}"/>
         </c:if>
         <c:if test="${billingType == '9'}">
			<c:set var="amount" value="${data.billingReportAdapter.unitSalesOrderAdapter.mainDealer}"/>
         </c:if>
         <c:if test="${billingType == '10'}">
			<c:set var="amount" value="${data.billingReportAdapter.unitSalesOrderAdapter.totalAfterPrepayment}"/>
         </c:if>
         <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${amount}' pattern='#,###'/></td> 
     </tr>
     <c:set var="amountTotal" value="${amountTotal+amount}"/>
     </c:forEach>
	 </c:forEach>
	 <tr>
	  	<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong>Total</strong></td>
	  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${amountTotal}' pattern='#,###'/></strong></td>
	 </tr>
</tbody>
</table>
