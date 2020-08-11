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
		<td>: <c:out value='${year}'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">&nbsp;</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kode</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Januari</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Februari</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Maret</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">April</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mei</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Juni</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Juli</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Agustus</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">September</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Oktober</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">November</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Desember</th>
  		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Total</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="16" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">&nbsp;</td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productCode}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.productName}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.jan}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.feb}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.mar}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.apr}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.may}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.jun}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.jul}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.aug}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.sep}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.oct}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.nov}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.dec}' pattern='#,###'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.total}' pattern='#,###'/></td>
 		</tr>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
