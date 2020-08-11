<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="3"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="50" nowrap="nowrap">Organization</td>
		<td nowrap="nowrap">: <c:out value='${organization.name}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Tipe Unit</td>
		<td nowrap="nowrap">: <c:out value='${unitType}'/></td>			  
	</tr>
	<tr>	
		<td nowrap="nowrap">Tipe Subsidi</td>
		<td nowrap="nowrap">: <c:out value='${subdictionType}'/></td>			  
	</tr>									
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="5%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Organization</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Unit</th>
        <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe Subsidi</th>
        <th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Payment</th>
        <th width="40%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Budget</th>
    </tr>
</thead>
<tbody>

<c:forEach items='${reports}' var='report'>
   	<%-- <tr>
   		<td colspan="16" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
   	</tr>
	<c:forEach items='${report.datas}' var='data'> --%>
		<tr>
	    	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value="${report.dateFrom}" pattern="dd-MM-yyyy"/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${report.organization.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${report.unitType}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;">
	        	<c:if test="${report.type == 'DISC_DEALER'}">
					<c:out value='DISCOUNT DEALER'/>
				</c:if>
				<c:if test="${report.type == 'DISC_PROGRAM'}">
					<c:out value='DISCOUNT PROGRAM'/>
				</c:if>
				<c:if test="${report.type == 'LEASING'}">
					<c:out value='LEASING'/>
				</c:if>
				<c:if test="${report.type == 'MAIN_DEALER'}">
					<c:out value='MAIN DEALER'/>
				</c:if>
	        </td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${report.leasing.name}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${report.unitPayment}'/></td>
	        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${report.money.amount}' pattern='#,###'/></td> 
	    </tr>
	<%-- </c:forEach> --%>
</c:forEach>
</tbody>
</table>
