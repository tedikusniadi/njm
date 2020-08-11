<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td nowrap="nowrap" width="5%">Company</td>
		<td nowrap="nowrap" width="80%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">No Mesin</td>
		<td nowrap="nowrap">: <c:out value='${serial}'/></td>			  
	</tr>
	<tr>
		<td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<tbody>
<c:forEach items='${reports}' var='report'>
   	<%-- <tr>
   		<td colspan="2"><strong><c:out value='${report.data.serial}'/></strong></td>
   	</tr> --%>
	<c:forEach items='${report.data.details}' var='detail'>
		<c:if test="${detail.referenceType == 'Unit Nota Debet Verification'}">
		<tr>
	    	<td colspan="2" nowrap="nowrap"><strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td width="10%" nowrap="nowrap">UNDV ID</td>
	        <td width="90%" nowrap="nowrap">: <c:out value='${detail.undvId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Tgl UNDV</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.undvDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Gudang Penerima</td>
	        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Pemasok</td>
	        <td nowrap="nowrap">: <c:out value='${detail.supplier}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">No Nota Debet</td>
	        <td nowrap="nowrap">: <c:out value='${detail.noND}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">No Sales Order</td>
	        <td nowrap="nowrap">: <c:out value='${detail.noSO}'/></td>
	    </tr>
	    <tr><td colspan="2">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Goods Receipt'}">
	    	<c:if test="${detail.type == 'UNIT PURCHASE ORDER'}">
			<tr>
		        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
		        <td nowrap="nowrap">: <c:out value='${detail.id}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
		        <td nowrap="nowrap">: <fmt:formatDate value='${detail.date}' pattern='dd-MM-yyyy'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Warehouse</td>
		        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Reference Type</td>
		        <td nowrap="nowrap">: <c:out value='${detail.type}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Reference Doc</td>
		        <td nowrap="nowrap">: <c:out value='${detail.doc}'/></td>
		    </tr>
		    <tr><td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td></tr>
		   	</c:if>
		   	
	    	<c:if test="${detail.type == 'TRANSFER ORDER'}">
			<tr>
		        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
		        <td nowrap="nowrap">: <c:out value='${detail.id}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
		        <td nowrap="nowrap">: <fmt:formatDate value='${detail.date}' pattern='dd-MM-yyyy'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Warehouse</td>
		        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Reference Type</td>
		        <td nowrap="nowrap">: <c:out value='${detail.type}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Reference Doc</td>
		        <td nowrap="nowrap">: <c:out value='${detail.doc}'/></td>
		    </tr>
		    <tr><td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td></tr>
		   	</c:if>
		   	
		   	<c:if test="${detail.type == 'SALES RETURN'}">
			<tr>
		        <td colspan="2" nowrap="nowrap"><strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">ID</td>
		        <td nowrap="nowrap">: <c:out value='${detail.id}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">Tanggal</td>
		        <td nowrap="nowrap">: <fmt:formatDate value='${detail.date}' pattern='dd-MM-yyyy'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">Warehouse</td>
		        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">Reference Type</td>
		        <td nowrap="nowrap">: <c:out value='${detail.type}'/></td>
		    </tr>
			<tr>
		    	<td nowrap="nowrap">Reference Doc</td>
		        <td nowrap="nowrap">: <c:out value='${detail.doc}'/></td>
		    </tr>
		    <tr><td colspan="2">&nbsp;</td></tr>
		    </c:if>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Goods Issue'}">
		<tr>
	        <td colspan="2" nowrap="nowrap"><strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.id}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.date}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Warehouse</td>
	        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Reference Type</td>
	        <td nowrap="nowrap">: <c:out value='${detail.type}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">Reference Doc</td>
	        <td nowrap="nowrap">: <c:out value='${detail.doc}'/></td>
	    </tr>
	    <tr><td colspan="2">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Transfer Order'}">
		<tr>
	        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.toId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.toDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Dari Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.source}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Ke Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.destination}'/></td>
	    </tr>
	    <tr><td colspan="2">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Sales Order Sub Dealer'}">
		<tr>
	        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.soDealerId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.soDealerDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Dari Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.source}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Ke Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.destination}'/></td>
	    </tr>
	    <tr><td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Delivery Order'}">
		<tr>
	        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.doId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.doDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
	    </tr>
	    <tr><td colspan="2">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Sales Order'}">
		<tr>
	        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.soId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.soDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Nama Pelanggan</td>
	        <td nowrap="nowrap">: <c:out value='${detail.customer}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Nama STNK</td>
	        <td nowrap="nowrap">: <c:out value='${detail.customerUnit}'/></td>
	    </tr>
	    <tr><td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td></tr>
	    </c:if>
	    
	    <c:if test="${detail.referenceType == 'Sales Return'}">
		<tr>
	        <td colspan="2" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<strong><c:out value='${fn:toUpperCase(detail.referenceType)}'/></strong></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;ID</td>
	        <td nowrap="nowrap">: <c:out value='${detail.returnId}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Tanggal</td>
	        <td nowrap="nowrap">: <fmt:formatDate value='${detail.returnDate}' pattern='dd-MM-yyyy'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Nama Pelanggan</td>
	        <td nowrap="nowrap">: <c:out value='${detail.customer}'/></td>
	    </tr>
		<tr>
	    	<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;Gudang</td>
	        <td nowrap="nowrap">: <c:out value='${detail.warehouse}'/></td>
	    </tr>
	    <tr><td colspan="2" style="border-bottom:1px solid black;">&nbsp;</td></tr>
	    </c:if>
	</c:forEach>
</c:forEach>
</tbody>
</table>
