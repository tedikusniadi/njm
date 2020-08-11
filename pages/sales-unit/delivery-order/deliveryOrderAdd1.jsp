<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/deliveryOrderAddFilter.jsp"%>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="5" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<!-- <strong>Referensi :</strong> -->
										<a class="item-button-back" href="<c:url value='/page/unitdeliveryorderview.htm'/>"><span>Back</span></a>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
				  	  	  <th width="1%"><div style="width:20px"></div></th>
	  	  	  	  	  	  <th width="8%">Tanggal</th>
                          <th width="15%">No.SPK</th>
                          <th width="20%">Nama STNK</th>
                          <th width="20%">Nama Tipe</th>
                          <th width="15%">Warna</th>
  	  	  	  	  	  	  <th width="30%">Pelanggan</th>
						</tr>
						<c:forEach items="${plans}" var="plan">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/unitdeliveryorderpreadd2.htm?id=${plan.deliveryPlanningSequence.id}'/>" title="Edit"><span>Edit</span></a>
							</td>
                            <td><fmt:formatDate value='${plan.deliveryPlanningSequence.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${plan.deliveryPlanningSequence.deliveryPlanning.planable.code}'/></td>
							<td><c:out value='${plan.unitSalesOrder.customerUnit.name}'/></td>
							<td><c:forEach items="${plan.deliveryPlanningSequence.sequenceItems}" var="item">${item.sequenceable.product.typeNames}</c:forEach></td>
							<td><c:forEach items="${plan.deliveryPlanningSequence.sequenceItems}" var="item">${item.sequenceable.product.colors}</c:forEach></td>
                            <td><c:out value='${plan.unitSalesOrder.customer.name}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
