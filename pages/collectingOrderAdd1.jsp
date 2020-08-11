<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
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
				<td width="60%">Procurement > Pertamina Procurement > Collecting Order</td>
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
						<h1 class="page-title">P24 - Loading Order</h1>
						<br/>
                        
						<strong>Reference :</strong>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
				  	  	  <th width="4%"><div style="width:20px"></div></th>
	  	  	  	  	  	  <th width="10%">Date</th>
                          <th width="18%">ID</th>
  	  	  	  	  	  	  <th width="37%">Company</th>
  	  	  	  	  	  	  <th width="31%">Supplier</th>
						</tr>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/collectingorderpreadd2.htm?id=${order.id}'/>" title="Edit"><span>Edit</span></a>
							</td>
                            <td><fmt:formatDate value='${order.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${order.no}'/></td>
                            <td><c:out value='${order.loadingOrder.organization.firstName} ${order.loadingOrder.organization.middleName} ${order.loadingOrder.organization.lastName}'/></td>
                            <td><c:out value='${order.loadingOrder.purchaseOrder.supplier.firstName} ${order.loadingOrder.purchaseOrder.supplier.middleName} ${order.loadingOrder.purchaseOrder.supplier.lastName}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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
