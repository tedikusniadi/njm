<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
   		<td colspan="3"><h1 class="title">Gross Margin Report</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td width="90%" colspan="3">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="3">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy'/> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cabang</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jabatan Sales</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
  		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kota/Kabupaten</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sisa Subsidi</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">GP 1</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">GP 2</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Total GP</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='rep'>
		<tr>
			<td colspan="16" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${rep.organization}'/></strong></td>
		</tr>
 		<c:forEach items='${rep.detailAdapters}' var='det'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${det.date}' pattern='dd MMM yyyy'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.organizationName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesPosition}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.salesOrderCode}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.deliveryOrderCode}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.customerCity}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemType}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemTypeName}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemYear}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.leasingName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.remainingSubsidi}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.gpOne}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${det.gpTwo}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${det.totalGp}' pattern='#,###'/></td>
 		</tr>
 		</c:forEach>
		<tr>
			<td colspan="16" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;">&nbsp;</td>
		</tr>
   </c:forEach>
   </tbody>
</table>
