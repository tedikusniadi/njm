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
		<td>: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Cabang</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl SO</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Bulan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SO</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kode Part</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Part</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jmlh Tagihan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lead Time</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Billing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Status</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="13" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.organizationName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${data.date}' pattern='dd-MM-yyyy'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.month}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerAddress}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.total}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.billingCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.billingStatus}'/></td>
 		</tr>
	 		<c:forEach items='${data.itemDetails}' var='detail'>
	 		<tr>
				<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value=''/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${detail.productCode}'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${detail.productName }'/></td>
	     		<td nowrap="nowrap" style="border-bottom:1px solid black;"></td>
     			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	     		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value=''/></td>
	 		</tr>
	 		</c:forEach>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
