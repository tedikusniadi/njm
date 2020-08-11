<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-back" href="javascript:displayContent('page/configurationassistanceprocurementconfig.htm');"><span>Back</span></a>
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/configurationassistanceprocurementpreadd.htm?id=${procurementConfiguration.id}');"><span>New Supplier</span></a>
</div>
<div class="main-box" style="height: 370px;">
	<table width="968" cellpadding="0" cellspacing="0" class="table-list" align="center">
	<tr>
		<th width="177">Type</th>
	  	<th width="397">Company</th>
	  	<th width="318">Supplier</th>
	</tr>
	<c:forEach items="${procurementConfiguration.suppliers}" var="supplier">
	<tr>
		<td><c:out value='${supplier.type}'/></td>
		<td><c:out value='${supplier.organization.firstName} ${supplier.organization.middleName} ${supplier.organization.lastName}'/></td>
		<td><c:out value='${supplier.supplier.firstName} ${supplier.supplier.middleName} ${supplier.supplier.lastName}'/></td>
	</tr>
	</c:forEach>
	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
	</table>
</div>