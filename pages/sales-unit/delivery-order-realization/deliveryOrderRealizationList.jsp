<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/filter/deliveryOrderRealizationFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
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
							<th width="1%"><div style="width:15px"></div></th>
  	  	  	  	  	  	  	<th width="15%">ID</th>
  	  	  	  	  	  	  	<th width="12%">DO</th>
           	  	  	 	  	<th width="15%">Customer</th>
				  	  	  	<th width="8%">Accept Date</th>
                       	  	<th width="9%">Return Date</th>
                            <th width="11%">Driver</th>
                            <th width="15%">Vehicle</th>
                   	  	  	<th width="12%">Goods Issue</th>
                        </tr>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td class="tools">
                                <a class="item-button-edit" href="<c:url value='/page/unitdeliveryorderrealizationpreedit.htm?id=${order.id}'/>"><span>Edit</span></a>
                                <c:if test='${access.delete and order.deleteable and empty order.issueds}'>
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/unitdeliveryorderrealizationdelete.htm?id=${order.id}'/>');"><span>Delete</span></a>
                                </c:if>
							</td>
							<td><c:url value='${order.code}'/></td>
							<td><a href="<c:url value='/page/deliveryorderpreedit.htm?id=${order.deliveryOrder.id}'/>"><c:out value='${order.deliveryOrder.code}'/></a></td>
                            <td><c:out value='${order.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}'/></td>
                            <td><fmt:formatDate value='${order.acceptanceDate}' pattern='dd-MM-yyyy'/></td>
                            <td><fmt:formatDate value='${order.docDate}' pattern='dd-MM-yyyy'/></td>
                            <td><c:out value='${order.deliveryOrder.driver.firstName} ${order.deliveryOrder.driver.middleName} ${order.deliveryOrder.driver.lastName}'/></td>
                            <td><c:out value='${order.deliveryOrder.vehicle.name}'/></td>
                            <td>
                            	<c:forEach items='${order.issueds}' var='issued'>
                                	<a href="<c:url value='/page/goodsissuepreedit.htm?id=${issued.id}'/>"><c:url value='${issued.code}'/></a>,
                                </c:forEach>
                            </td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
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

 	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" src="assets/dialog.js"></script>
