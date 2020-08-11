<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td>: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Period</td>
		<td>: <fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${filterCriteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cara Bayar</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Pengajuan BBN</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl STNK Diterima</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Proses BBN</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Proses STNK</th>
    </tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
   	<tr>
   		<td colspan="142" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value="${data.salesDate}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesman}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesCode}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.customerUnitName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.paymentType}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasingName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.bbnPrintoutDate}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.bbnDate}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${data.stnkReceivedDate}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leadTimeBBN}' pattern='#,###'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.leadTimeSTNK}' pattern='#,###'/></td> 
	    </tr>
	</c:forEach>
</c:forEach>
</tbody>
</table>
