<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="100">Company</td>
		<td>: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td>Period</td>
		<td>: <fmt:formatDate value='${criteria.dateFrom}' pattern='dd MMM yyyy' />&nbsp;-&nbsp; <fmt:formatDate value='${criteria.dateTo}' pattern='dd MMM yyyy' /></td>			  
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<c:set var="totalAmountOpening" value="0"/>
<c:set var="totalAmountIn" value="0"/>
<c:set var="totalAmountOut" value="0"/>
<c:set var="totalAmountClosing" value="0"/>
<c:set var="totalAmountHet" value="0"/>
<c:set var="totalAmount" value="0"/>
<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
<thead>
	<tr>
		<th align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">ID Product</th>
		<th align="left" width="20%" style="border-bottom:1px solid black;border-top:1px solid black;">Product Name</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Opening</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">In</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Out</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">Closing</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">HET</th>
		<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Total</th>
	</tr>
</thead>
<tbody>
	<c:forEach items='${reports}' var='report'>
	<c:set var="subTotalOpening" value="0"/>
	<c:set var="subTotalIn" value="0"/>
	<c:set var="subTotalOut" value="0"/>
	<c:set var="subTotalClosing" value="0"/>
	<c:set var="subTotalHet" value="0"/>
	<c:set var="subTotalAmount" value="0"/>
	<tr>
		<td colspan="8" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.organization.name}'/></strong></td>
	</tr>
		<c:forEach items='${report.facilities}' var='fac'>
		<tr>
			<td colspan="8" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><c:out value='${fac.warehouse.code} ${fac.warehouse.name}'/></td>
		</tr>
			<c:forEach items='${fac.products}' var='prod'>
			<tr>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${prod.product.code}'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prod.product.name}'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.opening}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.in}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.out}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.closing}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.het}' pattern='#,###'/></td>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${prod.total}' pattern='#,###'/></td>
				<c:set var="subTotalOpening" value="${subTotalOpening+prod.opening}"/>
				<c:set var="subTotalIn" value="${subTotalIn+prod.in}"/>
				<c:set var="subTotalOut" value="${subTotalOut+prod.out}"/>
				<c:set var="subTotalClosing" value="${subTotalClosing+prod.closing}"/> 
				<c:set var="subTotalHet" value="${subTotalHet+prod.het}"/> 
				<c:set var="subTotalAmount" value="${subTotalAmount+prod.total}"/> 
			</tr>
			</c:forEach>
		</c:forEach>
	<tr>
		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subTotalOpening}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subTotalIn}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subTotalOut}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subTotalClosing}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subTotalHet}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${subTotalAmount}' pattern='#,###'/></strong></td>
 		<c:set var="totalAmountOpening" value="${totalAmountOpening+subTotalOpening}"/>
 		<c:set var="totalAmountIn" value="${totalAmountIn+subTotalIn}"/> 
 		<c:set var="totalAmountOut" value="${totalAmountOut+subTotalOut}"/>
 		<c:set var="totalAmountClosing" value="${totalAmountClosing+subTotalClosing}"/>
 		<c:set var="totalAmountHet" value="${totalAmountHet+subTotalHet}"/>
 		<c:set var="totalAmount" value="${totalAmount+subTotalAmount}"/>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${totalAmountOpening}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${totalAmountIn}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${totalAmountOut}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${totalAmountClosing}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${totalAmountHet}' pattern='#,###'/></strong></td>
 		<td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${totalAmount}' pattern='#,###'/></strong></td>
 	</tr>
</tbody>
</table>
