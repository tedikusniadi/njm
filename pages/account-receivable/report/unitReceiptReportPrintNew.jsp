<%@ include file="/common/tld-common.jsp"%>
<table id="size" value="${fn:length(organizations)}" style="border:none" width="100%" cellspacing="0" cellpadding="2">
	<thead>
 	<tr>
   		<td colspan="10"><h1 class="title">${title}</h1></td>
 	</tr>
 	<tr>
 		<td>&nbsp;</td>
 	</tr>
	<tr>
 		<td>Company</td>
     	<td colspan="9">: <c:out value='${organization.name}'/></td>
	</tr>
	<tr>
 		<td>Type</td>
     	<td colspan="9">: <c:out value='${not empty receiptType ? receiptType:"All"}'/></td>
	</tr>
	<tr>
		<td>Period</td>
   		<td colspan="9">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy'/> To <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy'/></td>
	</tr>
 	<tr>
 		<td colspan="10">&nbsp;</td>
 	</tr>
	</thead>
	<thead>
	<tr style="height: 30px">
	    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nomor</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Receipt</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
	  	<th width="14%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
	  	<th width="16%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
	  	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jumlah Tagihan</th>
	</tr>
	</thead>
	<c:forEach items='${organizations}' var='org' varStatus="status">
	<tbody class='detailBody' id="${org.id}">
	</tbody>
	</c:forEach>
	<tfoot>
	<tr style="height: 30px" valign="middle">
  		<td colspan="9" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;font-weight: bold;">Total</td>
  		<td nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;font-weight: bold;" id="gTotal" align="right">0.00</td>
	</tfoot>
	</tfoot>
</table>
