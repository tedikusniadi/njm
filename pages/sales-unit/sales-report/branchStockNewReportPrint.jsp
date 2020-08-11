<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="5" cellspacing="0">
<thead>
<tr>
	<td width="1%" nowrap="nowrap">Company</td>
	<td nowrap="nowrap">: <c:out value='${organization.name}'/></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Posisi Cabang</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warehouse</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Penerimaan Unit</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mutasi</th>
    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Harga Beli</th>
</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='rep'>
		<c:forEach items="${rep.adapters}" var="adap">
		<tr>
			<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${adap.key}'/></strong></td>
		</tr>
		<c:forEach items='${adap.value.detailAdapters}' var='det'>
		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${det.organizationName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.warehouse}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemType}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemTypeName}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.itemColor}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.serial}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.serialExt}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${det.year}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value='${det.receivedDate}' pattern='dd MMM yyyy'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${det.purchasePrice}' pattern='#,###'/></td>
	    </tr>
		</c:forEach>
		<tr>
			<td colspan="10">&nbsp;</td>
		</tr>
		</c:forEach>
	<tr>
		<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary</th>
	</tr>
	<tr>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama Tipe</th>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
	</tr>
    <c:set var="totalType" value="0"/>
	<c:forEach items="${rep.summaryTypes}" var="sum">
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<c:out value='${sum.itemTypeName}'/>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<c:out value='${sum.total}'/>
		</td>
	</tr>
    <c:set var="totalType" value="${totalType+sum.total}"/>
	</c:forEach>
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<strong><c:out value='Total'/></strong>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<strong><c:out value='${totalType}'/></strong>
		</td>
	</tr>
	<tr>
		<td colspan="50">&nbsp;</td>
	</tr>
	<tr>
		<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary POS</th>
	</tr>
	<tr>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Nama</th>
		<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
	</tr>
    <c:set var="totalPos" value="0"/>
	<c:forEach items="${rep.summaryPOS}" var="sumPos">
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<c:out value='${sumPos.warehouse}'/>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<c:out value='${sumPos.total}'/>
		</td>
	</tr>
    <c:set var="totalPos" value="${totalPos+sumPos.total}"/>
	</c:forEach>
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<strong><c:out value='Total'/></strong>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<strong><c:out value='${totalPos}'/></strong>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>
