<%@ include file="/common/tld-common.jsp"%>
<table width="498">	
  <tr>	
      <td width="100" >Company</td>
      <td width="11" >:&nbsp;&nbsp;</td>
      <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
  </tr>
  <tr>	
      <td width="100" >Period</td>
      <td width="11" >:&nbsp;&nbsp;</td>
      <td width="344" ><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' /></td>			  
  </tr>
 </table>
 <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
  <thead>
  <tr>
    <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
    <th width="19%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">DO No/Item</th>
    <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Qty</th>
    <th width="12%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Customer</th>
 	  <th width="15%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">SO</th>
 	  <th width="13%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Driver</th>
 	  <th width="10%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Vehicle</th>
 	  <th width="15%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Note</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items='${reports}' var='report'>
  <tr>
      <td align="left"><fmt:formatDate value='${report.date}' pattern='dd-MM-yyyy'/></td>
      <td align="left"><c:out value='${report.doNo}'/></td>
      <td></td>
      <td align="left"><c:out value='${report.cFirst} ${report.cMiddle} ${report.cLast}'/></td>
      <td align="left"><c:out value='${report.soNo}'/></td>
      <td align="left"><c:out value='${report.dFirst} ${report.dMiddle} ${report.dLast}'/></td>
      <td align="left"><c:out value='${report.vehicle}'/></td>
      <td align="left"><c:out value='${report.note}'/></td>
  	<c:forEach items='${report.deliveryOrder.items}' var='product'>
  	<tr>
  		<td></td>
       <td align="left">&nbsp;&nbsp;<c:out value='${product.item.sequenceable.product.name}'/></td>
       <td align="left"><fmt:formatNumber value='${product.item.quantity}' pattern=',##0.00'/></td>
      </tr>
      </c:forEach>                         
  </tr>
  </c:forEach>
  </tbody>
  </table>