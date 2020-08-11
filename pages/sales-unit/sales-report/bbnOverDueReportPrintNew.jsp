<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td>Company</td>
		<td colspan="2">: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="2">: <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /> <%--  &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /> --%></td>			  
	</tr>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pelanggan</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pelanggan</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kota</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Wilayah Samsat</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Jasa</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="14" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value="${data.salesOrderDate}" pattern="dd MMM yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesOrderCode}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.addressUnit}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.cityUnit}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.regionUnit}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.types}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.typesName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.color}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.year}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serial}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.serialExt1}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.noticeAmount}' pattern='#,###'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.serviceAmount}' pattern='#,###'/></td> 
	    </tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
