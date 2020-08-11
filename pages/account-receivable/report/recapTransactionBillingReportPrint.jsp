<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td width="90%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <%-- <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp;  --%><fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Tipe Kwitansi</td>
		<td>: <c:out value='${type}'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
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
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jumlah Tagihan</th>
	</tr>
</thead>
<tbody>
	<c:set var="amountTotal" value="0"/>
	<c:forEach items='${reports}' var='report'>
	<c:set var="amount" value="0"/>
	<tr>
		<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
    <c:forEach items='${report.datas}' var='data'>
    <tr>
	  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.deliveryOrder.code}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveryOrder.date}' pattern='dd-MM-yyyy'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.deliveryOrder.deliveryOrderRealization.updatedDate}' pattern='dd-MM-yyyy'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.salesPerson.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.customer.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrder.customerUnit.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.address}'/></td>
        <c:if test="${data.phone.contact!='01234' }">
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.phone.contact}'/></td>
        </c:if>
        <c:if test="${data.phone.contact=='01234' }">
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
        </c:if>
        <c:forEach items="${data.salesOrder.items}" var="item">
        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${item.product.types}'/></td>
        </c:forEach>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.partyLeasing.name}'/></td>
        <c:if test="${billingType == '6'}">
			<c:set var="amount" value="${data.salesOrderAdapter.leasing}"/>
        </c:if>
        <c:if test="${billingType == '7'}">
			<c:set var="amount" value="${data.salesOrderAdapter.totalAfterPrepayment}"/>
         </c:if>
         <c:if test="${billingType == '8'}">
			<c:set var="amount" value="${data.salesOrderAdapter.subdictionLeasing}"/>
         </c:if>
         <c:if test="${billingType == '9'}">
			<c:set var="amount" value="${data.salesOrderAdapter.mainDealer}"/>
         </c:if>
         <c:if test="${billingType == '10'}">
			<c:set var="amount" value="${data.salesOrderAdapter.totalAfterPrepayment}"/>
         </c:if>
         <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${amount}' pattern='#,###'/></td> 
     </tr>
     <c:set var="amountTotal" value="${amountTotal+amount}"/>
     </c:forEach>
	 </c:forEach>
	 <tr>
	  	<td colspan="10" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong>Total</strong></td>
	  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${amountTotal}' pattern='#,###'/></strong></td>
	 </tr>
</tbody>
</table>
