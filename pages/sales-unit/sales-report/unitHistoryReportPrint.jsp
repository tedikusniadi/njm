<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td nowrap="nowrap" width="5%">Company</td>
		<td nowrap="nowrap" width="80%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<%-- <tr>	
		<td nowrap="nowrap">Period</td>
		<td nowrap="nowrap">: <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr> --%>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pembelian</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Delivery Order</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Transfer Order</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Goods Receipt</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data' varStatus='st'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${st.index+1}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.product.types}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.product.typeNames}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.product.colors}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.serial}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.serialExt1}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.adapter.year}'/></td>
	        <c:if test="${not empty data.adapter.verificationItemDetails.unitInvoiceVerificationItem.invoiceVerification}">
	        	<td nowrap="nowrap" style="border-bottom:1px solid black;">
	        		<c:out value='${data.adapter.verificationItemDetails.unitInvoiceVerificationItem.invoiceVerification.code}'/>
	        		/
	        		<fmt:formatDate value="${data.adapter.verificationItemDetails.unitInvoiceVerificationItem.invoiceVerification.date}" pattern='dd-MM-yyyy'/>
	        	</td>
	        </c:if>
	        <c:if test="${empty data.adapter.verificationItemDetails.unitInvoiceVerificationItem.invoiceVerification}">
	        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	        </c:if>
	        <c:if test="${not empty data.adapter.deliveryOrderItemDetail.deliveryOrderItem.deliveryOrder}">
	        	<td nowrap="nowrap" style="border-bottom:1px solid black;">
	        		<c:out value='${data.adapter.deliveryOrderItemDetail.deliveryOrderItem.deliveryOrder.code}'/>
	        		/
	        		<fmt:formatDate value="${data.adapter.deliveryOrderItemDetail.deliveryOrderItem.deliveryOrder.date}" pattern='dd-MM-yyyy'/>
	        	</td>
	        </c:if>
	        <c:if test="${empty data.adapter.deliveryOrderItemDetail.deliveryOrderItem.deliveryOrder}">
	        	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	        </c:if>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;">
	        	<c:forEach items='${data.adapter.transferOrders}' var='to'>
	        		<a href="<c:url value='/page/transferorderpreedit.htm?id=${to.id}'/>"><c:out value='${to.code}'/>, 
	        	</c:forEach>
	        </td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
	        	<c:forEach items='${data.adapter.goodsReceipts}' var='receipt'>
	        		<a href="<c:url value='/page/goodsreceiptfromfilepreedit.htm?id=${receipt.id}'/>"><c:out value='${receipt.code}'/>, 
	        	</c:forEach>
	        </td>
	    </tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
