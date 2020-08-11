<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Order Plan >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/consignmentorderplanedit.htm'/>";
			document.addForm.submit();
		}
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Sales > Consignment > Consignment Order > Consignment Order Plan > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Consignment Order Plan</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentorderpreedit.htm?id=${plan.consignmentOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plan">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">ID :</td>
                                  	<td width="80%"><input value="${plan.code}" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <select id="org" path="organization" class="combobox-ext" disabled>
                                            <option value="${plan.consignmentOrder.organization.id}"><c:out value='${plan.consignmentOrder.organization.firstName} ${plan.consignmentOrder.organization.lastName} ${plan.consignmentOrder.organization.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%" align="right">Date :</td>
                                  <td width="80%"><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${plan.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                  	<td nowrap="nowrap" align="right">Currency :</td>
                                    <td>
                                        <form:select path="consignmentOrder.currency" disabled='true'>
                                            <form:option value='${plan.consignmentOrder.currency.id}' label='${plan.consignmentOrder.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path="consignmentOrder.exchangeType" disabled='true'>
                                            <form:option value='SPOT'>SPOT</form:option>
                                            <form:option value='MIDDLE'>MIDDLE</form:option>
                                            <form:option value='TAX'>TAX</form:option>
                                        </form:select>
                                  </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer :</td>
                                    <td>
                                        <select id="customer" class="combobox-ext" disabled>
                                            <option value="${plan.consignmentOrder.customer.id}"><c:out value='${plan.consignmentOrder.customer.firstName} ${plan.consignmentOrder.customer.middleName} ${plan.consignmentOrder.customer.lastName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                  	<td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='55' rows='6'/></td>
                                </tr>
                                </table>
                                <br/>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="41%">Product</th>
                                  	<th width="12%">Qty</th>
                               	  	<th width="8%">UoM</th>
                                    <th width="39%">Note</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${plan.items}' var='item'>
                                <tr>
                                	<td><c:out value='${item.productPrice.product.code} - ${item.productPrice.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.productPrice.product.unitOfMeasure.measureId}'/></td>
                                    <td><c:out value='${item.note}'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>