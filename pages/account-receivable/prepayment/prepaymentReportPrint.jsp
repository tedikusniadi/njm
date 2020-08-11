<%@ include file="/common/tld-common.jsp"%>
<table id="tableData" width="100%" cellpadding="4" cellspacing="0" class="report-table">
	<thead>
	<tr>
   		<td colspan="6"><h1 class="title">Laporan Titipan Uang Muka <c:out value='${type == "SPK" ? "Sesudah SPK":"Tanpa SPK"}'/></h1></td>
	</tr>
	<tr>	
		<td width="1%" nowrap="nowrap">Company</td>
		<td width="90%" colspan="3">: <c:out value='${organization}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Customer</td>
		<td colspan="3">: <c:out value='${customer}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Type</td>
		<td colspan="3">: <c:out value='${type == "SPK" ? "SESUDAH SPK":"TANPA SPK"}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Status</td>
		<td colspan="3">: <c:out value='${status}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td colspan="3">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<c:set var="size" value="6"/>
	<c:set var="prepUrl" value="/page/prepaymentpreedit.htm?"/>
	<tr>
        <th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
      	<th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Organization</th>
      	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Prepayment</th>
      	<th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Customer</th>
      	<c:if test="${type == 'SPK'}">
			<c:set var="size" value="${size+1}"/>
			<c:set var="prepUrl" value="/page/prepaymentcashpreedit.htm?"/>
      		<th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
      	</c:if>
      	<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Available</th>
   	  	<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Note</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items='${reports}' var='rep'>
		<tr>
			<td colspan="${size}" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${rep.organization}'/></strong></td>
		</tr>
 		<c:forEach items='${rep.datas}' var='dat'>
 		<tr>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${dat.date}' pattern='dd MMM yyyy'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dat.organizationName}'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><a href="<c:url value='${prepUrl}id=${dat.prepaymentId}'/>"><c:out value='${dat.prepaymentCode}'/></a></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${dat.customerName}'/></td>
      		<c:if test="${type == 'SPK'}">
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><a href="<c:url value='/page/unitsalesorderpreedit.htm?id=${dat.salesOrderId}'/>"><c:out value='${dat.salesOrderCode}'/></a></td>
      		</c:if>
   			<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${dat.available}' pattern='#,###'/></td>
			<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${dat.note}'/></td>
 		</tr>
 		</c:forEach>
 	</c:forEach>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="${size}">&nbsp;</td>
		</tr>
	</tfoot>
</table>
