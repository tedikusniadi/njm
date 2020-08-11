<%@ include file="/common/tld-common.jsp"%>
<table width="498" cellpadding="0" border="0" style="border:none">
<tr>
	<td width="1%" nowrap="nowrap">Company</td>
	<td nowrap="nowrap">: <c:out value='${organization.name}'/></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<%-- <tr>
	<td width="100">Period</td>
	<td width="344">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
</tr> --%>
</table>
<table width="100%" cellpadding="5" cellspacing="0">
<thead>
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
	<tr>
		<td colspan="11" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${rep.org.name}'/></strong></td>
	</tr>
	<c:forEach items='${rep.datas}' var='dt'>
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${dt.inventoryItemDetail.inventoryItem.organization.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.inventoryItem.grid.facility.name}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.inventoryItem.product.types}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.inventoryItem.product.typeNames}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.inventoryItem.product.colors}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.serial}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.serialExt1}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dt.inventoryItemDetail.year}'/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;">
        	<c:if test="${not empty dt.goodsReceiptItemDetail}"><fmt:formatDate value='${dt.goodsReceiptItemDetail.goodsReceiptItem.goodsReceipt.date}' pattern='dd MMM yyyy' /></c:if>
        </td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value=''/></td>
        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='' pattern='#,###'/></td>
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
	<c:forEach items="${summaries}" var="sum">
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<c:if test="${not empty sum.unitType}">
				<c:out value='${sum.unitType}'/>
			</c:if>
			<c:if test="${empty sum.unitType}">
				<strong><c:out value='Total'/></strong>
			</c:if>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<c:if test="${empty sum.unitType}">
				<strong><c:out value='${sum.total}'/></strong>
			</c:if>
			<c:if test="${not empty sum.unitType}">
				<c:out value='${sum.total}'/>
			</c:if>
		</td>
	</tr>
	</c:forEach>
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
	<c:forEach items="${summariesPos}" var="sumPos">
	<tr>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
			<c:if test="${not empty sumPos.name}">
				<c:out value='${sumPos.name}'/>
			</c:if>
			<c:if test="${empty sumPos.name}">
				<strong><c:out value='Total'/></strong>
			</c:if>
		</td>
		<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
			<c:if test="${empty sumPos.name}">
				<strong><c:out value='${sumPos.total}'/></strong>
			</c:if>
			<c:if test="${not empty sumPos.name}">
				<c:out value='${sumPos.total}'/>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>
