<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td>Company</td>
		<td colspan="2">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="2">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
    <tr>
		<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
		<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lokasi</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cara Bayar</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Cash</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Credit</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Program</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi MD</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi DM</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Murni</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">DP PO</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tenor/TOP</th>
		<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mediator</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No PO Leasing</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Leasing</th>
		<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
	</tr>
</thead>
<tbody>
<c:forEach items='${reports}' var='report'>
	<tr>
		<td colspan="26" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
	</tr>
	<c:forEach items='${report.datas}' var='data'>
	<tr>
		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.salesAdapter.unitSalesOrder.date}' pattern='dd-MM-yyyy'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.code}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customer.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.address}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	    <c:if test="${data.phone.contact != '01234'}">
	    	<c:out value='${data.phone.contact}'/>
	    </c:if>
	    <c:if test="${data.phone.contact == '01234'}">
	    	<c:out value=''/>
	    </c:if>
	    </td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesItem.product.types}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesItem.product.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesItem.product.colors}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.OTR}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.addressUnit.city.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.unitPayment}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	    	<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
	   	</c:if>
	    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	    	<fmt:formatNumber value='0' pattern='#,###'/>
	   	</c:if>
	   	</td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	    	<fmt:formatNumber value='0' pattern='#,###'/>
	   	</c:if>
	    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	    	<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
	   	</c:if>
	   	</td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.programCustomer}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.mainDealerCustomer}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.pureSubdiction}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.subdictionLeasingCustomer}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.prepayment}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.partyLeasing.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leasing.tenor}' pattern='#,###'/> / <fmt:formatNumber value='${data.leasing.installment}' pattern='#,###'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.secondarySales.name}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.poLeasing}'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.leasing.date}' pattern='dd-MM-yyyy'/></td>
	    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.note}'/></td> 
	</tr>
	</c:forEach>
	<tr>
	 	<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
	 	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.HJOtr}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCash}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCredit}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discProgram}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiMD}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiDM}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiLeasing}' pattern='#,###'/></strong></td>
	 	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.UM}' pattern='#,###'/></strong></td>
	 	<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${report.DPPO}' pattern='#,###'/></strong></td>
	</tr>
</c:forEach>
<tr>
	<td colspan="9" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${HJOtrTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCashTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCreditTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discProgramTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiMDTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiDMTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiLeasingTotal}' pattern='#,###'/></strong></td>
	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${UMTotal}' pattern='#,###'/></strong></td>
	<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${DPPOTotal}' pattern='#,###'/></strong></td>
</tr>
<tr>
	<td cospan="26">&nbsp;</td>
</tr>
<tr>
	<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary</th>
</tr>
<tr>
	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Tipe</th>
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
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Cash'/></strong></td>
 	<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${cash}'/></td>
</tr>
<tr>
	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Credit'/></strong></td>
 	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${credit}'/></td>
</tr>
</tbody>
</table>
