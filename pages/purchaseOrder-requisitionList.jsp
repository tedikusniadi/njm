<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Order >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
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
				<td width="60%">Procurement > Purchase Order</td>
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
						<h1 class="page-title">P21 - Purchase Order</h1>
						
                        <h3>List of Approved Purchase Requisition</h3>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="6%"><div style="width:40px"></div></th>
			  	  	  	  	<th width="13%">Date</th>
                            <th width="13%">ID</th>
			  	  	  	  	<th width="26%">Company</th>
           	  	  	  	  	<th width="21%">Supplier</th>
						</tr>
						<c:forEach items="${requisitions}" var="order">
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/purchaseorderpreadd2.htm?id=${order.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
							</td>
                            <td><fmt:formatDate value="${order.date}" pattern='dd-MM-yyyy'/></td> 
							<td><c:out value='${order.code}'/></td>
							<td><c:out value="${order.organization.firstName} ${order.organization.middleName} ${order.organization.lastName}"/></td>
                            <td><c:out value="${order.supplier.firstName} ${order.supplier.middleName} ${order.supplier.lastName}"/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
</html>
