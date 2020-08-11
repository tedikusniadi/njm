<%@ include file="/common/tld-common.jsp"%>
<c:forEach items='${listItems}' var='list'>
	<c:forEach items='${list.reports}' var='rep'>
		<table width="498" cellpadding="0" border="0" style="border:none">
		<tr>
			<td width="100">Company</td>
			<td width="344">: <c:out value='${list.organization.name}'/></td>
		</tr>
		<tr>
			<td width="100">Period</td>
			<td width="344">: <c:out value='${period.name}'/></td>			  
		</tr>
		<tr>
			<td width="100">Department</td>
			<td width="344">: <c:out value='${department.name}'/></td>			  
		</tr>
		</table>
		<table width="100%" cellpadding="5" cellspacing="0">
		<thead>
		<tr>
			<th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">&nbsp;</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Budget Amount</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Actual Amount</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Variance</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Year to Date Budget</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Year to Date Actual</th>
		    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Year to Date Variance</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Annual Budget</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Annual Actual</th>
		    <th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Annual Variance</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items='${rep.datas}' var='data'>
			<tr>
				<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${data.glAccount.name}'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.budgetAmount}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.actualAmount}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.variance}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.yearToDateBudget}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.yearToDateActual}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.yearToDateVariance}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.annualBudget}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.annualActual}' pattern='#,###'/></td>
		        <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${data.annualVariance}' pattern='#,###'/></td>
		    </tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</tfoot>
		</table>
	</c:forEach>
</c:forEach>
