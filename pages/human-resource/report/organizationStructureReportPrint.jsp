<%@ include file="/common/tld-common.jsp"%>
<table width="100%" cellpadding="0" border="0" style="border:none">
	<tr>
   		<td colspan="2"><h1 class="title">${title}</h1></td>
	</tr>
	<tr>	
		<td width="5%" nowrap="nowrap">Company</td>
		<td width="95%">: <c:out value='${organization}'/></td>			  
	</tr>
	<%-- <tr>	
		<td width="5%" nowrap="nowrap">Date</td>
		<td width="95%">: <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /></td>			  
	</tr> --%>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<thead>
	<tr>
		<th width="1%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">No</th>
        <th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Position</th>
        <th width="12%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Report To</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Valid From</th>
        <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Valid To</th>
        <th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Current Incumbent</th>
    </tr>
</thead>
<tbody>

<c:forEach items='${reports}' var='adapter' varStatus="stat">
<tr>
   	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;">${stat.index+1}</td>
    <td nowrap="nowrap" style="border-bottom:1px solid black;">${adapter.name}</td>
    <td nowrap="nowrap" style="border-bottom:1px solid black;">
    	<c:if test="${not empty adapter.organizationStructure.parent.parent}"><c:out value='${adapter.organizationStructure.parent.name}'/></c:if>
    </td>
    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${adapter.organizationStructure.startDate}" pattern="dd-MM-yyyy"/></td>
    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate value="${adapter.organizationStructure.endDate}" pattern="dd-MM-yyyy"/></td>
    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${adapter.organizationStructure.personnelManagement.name}'/></td> 
   </tr>
</c:forEach>
</tbody>
</table>
