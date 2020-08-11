<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Material Request >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("assets/sirius.css");
    </style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">>Production > Production Material Request > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						
						<h1 class="page-title">U40 - Production Material Request</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionmaterialrequestview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="production_material_request_edit">
                                <table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="16%" align="right">Code</td>
                                    <td>:</td>
                                    <td width="84%"><input size="30" disabled class="input-disabled" value="${production_material_request_edit.code}"/></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Company</td>
                                    <td>:</td>
                                    <td width="84%">
                                        <form:select id="org" path='organization' class="combobox-ext" disabled='true'>
                                        	<option><c:out value='${production_material_request_edit.organization.firstName} ${production_material_request_edit.organization.middleName} ${production_material_request_edit.organization.lastName}'/></option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date</td>
                                    <td>:</td>
                                    <td><input class="input-disabled" disabled value="<fmt:formatDate value='${production_material_request_edit.date}' pattern='dd-MM-yyyy'/>" size="10"/></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Production Order No</td>
                                    <td>:</td>
                                    <td width="84%"><a href="<c:url value='/page/productionorderpreedit.htm?id=${production_material_request_edit.productionOrder.id}'/>"><c:out value='${production_material_request_edit.productionOrder.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Work Unit</td>
                                    <td>:</td>
                                    <td width="84%"><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${production_material_request_edit.productionOrder.workUnit.id}'/>"><c:out value='${production_material_request_edit.productionOrder.workUnit.code} ${production_material_request_edit.productionOrder.workUnit.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td align="right">Warehouse</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id='facility' path='facility' cssClass='combobox' disabled='true'>
                                        	<option><c:out value='${production_material_request_edit.facility.code} ${production_material_request_edit.facility.name}'/></option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="19%" align="right">Shipping Address</td>
                                    <td>:</td>
                                    <td><c:out value='${production_material_request_edit.shippingAddress.address}'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Delivery Date</td>
                                    <td>:</td>
                                    <td><input class="input-disabled" disabled value="<fmt:formatDate value='${production_material_request_edit.delivery}' pattern='dd-MM-yyyy'/>" size="10"/></td>
                                </tr>
                                </table>

                                <div class="clears">&nbsp;</div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" style="width:75%;">
                                <thead>
                                <tr>
                                    <th width="45%">Item</th>
                                    <th width="21%">Estimated Usage</th>
                                    <th width="22%">Request Quantity</th>
                                  	<th width="12%">UoM</th>
                                </tr>
                                <thead>
                                <tbody>
                                <c:forEach items="${production_material_request_edit.items}" var="item" varStatus='status'>
                                <tr>
                                    <td><c:out value='${item.input.product.code} ${item.input.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.estimated}' pattern=',##0.00'/></td>
                                    <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.input.unitOfMeasure.name}'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                </tfoot>
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