<%@ include file="/common/tld-common.jsp"%>
		<c:forEach items="${departments}" var="dept">
			<div id="${fn:replace(dept.name, ' ', '_')}" style="display: none;">${dept.code}</div>
		</c:forEach>
		<table id="size" value="${adapter.size}" width="100%" cellpadding="3" cellspacing="0">
			<thead>
				<tr>
					<td colspan="7" class="pageTitle"><strong>GL Register</strong></td>
				</tr>
				<tr>
					<td colspan="7">&nbsp;</td>
				</tr>
				<tr>
					<td>Period</td>
					<td>:</td>
					<td colspan="5">
						<c:forEach items='${criteria.accountingPeriods}' var='period'>
							    <c:out value="${period.name},"/>
						</c:forEach>
					</td>
				</tr>
				<tr>			  
					<td>Company</td>
					<td>:</td>
					<td colspan="5">
						<c:forEach items='${criteria.organizations}' var='org'>
							<c:out value="${org.name},"/>
						</c:forEach>
					</td>
				</tr>
				<tr>			  
					<td>Currency</td>
					<td width="1%">:</td>
					<td colspan="4"><c:out value='${currency.symbol}'/></td>
				</tr>
				<tr>
					<td colspan="7">&nbsp;</td>
				</tr>
				<tr>
					<th width="5%" align="center">Account</th>
					<th width="12%" colspan="3" align="center">Reference No.</th>
  					<th width="5%" align="right">Reference</th>
					<th width="15%" align="right">Debit</th>	
					<th width="15%" align="right">Credit</th>
					<th width="15%" align="right">Balance</th>
				</tr>
				</thead>
				<c:forEach items="${adapter.accounts}" var="account" >
				<c:if test='${not empty adapter.openingPeriods}'>
				<tbody class='glbody' id="${account}">
				</tbody>
				</c:if>
				</c:forEach >
		</table>