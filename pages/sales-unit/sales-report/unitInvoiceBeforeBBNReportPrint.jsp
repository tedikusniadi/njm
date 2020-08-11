<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="6%">Company</td>
		<td width="94%">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td width="6%">Periode</td>
		<td width="94%">: <%-- <fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/> s/d  --%><fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Faktur</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. Faktur</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No. SPK</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pelanggan</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
  		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Note</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.invoiceMainDealer.receivedDate}' pattern='dd-MM-yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceMainDealer.code}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceMainDealer.invoiceNo}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceMainDealer.unitSalesOrder.code}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceMainDealer.unitSalesOrder.customer.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.invoiceMainDealer.unitSalesOrder.customerUnit.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:forEach items="${data.invoiceMainDealer.unitSalesOrder.items}" var="item"><c:set var="soItem" value="${item}"/></c:forEach>${soItem.product.typeNames}</td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:forEach items="${data.invoiceMainDealer.unitSalesOrder.items}" var="item"><c:set var="soItem" value="${item}"/></c:forEach>${soItem.product.colors}</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.invoiceMainDealer.note}'/></td>
 		</tr>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
