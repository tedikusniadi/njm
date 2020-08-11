<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PO Cost Component Verification >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/dialog.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">	
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">Financial Accounting > Accounting Payable > PO Cost Component Verification > Add</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">F60 - SO Cost Component Verification</h1>
						<div class="clears">&nbsp;</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <th width="6%"><div style="width:44px;"></div></th>
                          	<th width="14%">ID</th>
                   	  	  	<th width="28%">Company</th>
                          	<th width="27%">Supplier</th>
                            <th width="9%">Amount</th>
                       	  	<th width="7%">Currency</th>
                        </tr>
                        <c:forEach items="${components}" var="component">
                        <tr>
                            <td class="tools">
	                            <a class="item-button-edit" href="<c:url value='/page/socostcomponentverificationpreadd2.htm?id=${component.id}'/>" title="Edit"><span>Edit</span></a>
                            </td>
                            <td><c:out value="${component.code}" /></td> 
                            <td><c:out value="${component.deliveryOrderRealization.deliveryOrder.organization.firstName} ${component.deliveryOrderRealization.deliveryOrder.deliveryOrderRealization.organization.middleName} ${component.deliveryOrderRealization.deliveryOrder.organization.lastName}" /></td>       
                            <td><c:out value="${component.supplier.firstName} ${component.supplier.middleName} ${component.supplier.lastName}" /></td>
                            <td><fmt:formatNumber value="${component.amount+(component.amount*component.tax.taxRate*0.01)}" pattern=',##0.00'/></td>
                            <td><c:out value="${component.currency.symbol}" /></td>
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
<!-- END OF BODY -->
</html>
