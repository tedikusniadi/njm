<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="6%">Company :</td>
		<td width="94%"><c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Kecamatan</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Januari</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Februari</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Maret</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">April</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mei</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Juni</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Juli</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Agustus</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">September</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Oktober</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">November</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Desember</th>
  		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Total</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="51" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
 		<c:forEach items='${report.datas}' var='data'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.subdistrict.name}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.january}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.february}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.march}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.appril}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.may}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.june}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.july}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.august}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.september}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.october}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.november}'/></td>
	     	<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.december}'/></td>
     		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.subTotal}'/></td>
 		</tr>
 		</c:forEach>
	</c:forEach>
    </tbody>
</table>
