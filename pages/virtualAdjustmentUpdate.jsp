<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Virtual Stock Adjustment >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/virtualadjustmentedit.htm'/>";
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
			<td width="60%">Inventory > Warehouse Management > Virtual Stock Adjustment > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">I31 - Virtual Stock Adjustment</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/virtualadjustmentview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="${adjustment_edit.code}" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input class="input-disabled" size="10" disabled value="<fmt:formatDate value='${adjustment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty adjustment_edit.organization}'>
                                               	<form:option value='${adjustment_edit.organization.id}' label='${adjustment_edit.organization.firstName} ${adjustment_edit.organization.lastName} ${adjustment_edit.organization.middleName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext">
                                           	<c:if test='${not empty adjustment_edit.facility}'>
                                               	<form:option value='${adjustment_edit.facility.id}' label='${adjustment_edit.facility.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea path="reason" cols="55" rows="7"/></td>
								</tr>
							</table>
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                                <th width="17%">Grid</th>
                           	  	<th width="21%">Container</th>
                           	  	<th width="22%">Product</th>
                           	  	<th width="9%">Adjustment</th>
                              	<th width="5%">UoM</th>
                                <th width="11%">Adj Price</th>
                            	<th width="7%">Curr</th>
                            	<th width="8%">Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${adjustment_edit.items}' var='item'>
                            <tr>
                            	<td><c:out value='${item.grid.name}'/></td>
                                <td><c:out value='${item.container.name}'/></td>
                                <td><c:out value='${item.inventoryItem.product.name}'/></td>
                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                            	<td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
                                <td><fmt:formatNumber value='${item.price}' pattern=',##0.00'/></td>
                                <td><c:out value='${item.currency.symbol}'/></td>
                                <td><c:out value='${item.exchangeType}'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                            </tfoot>
                            </table>
							</form:form>
						</div>
						<div class="info">Created by : ${adjustment_edit.createdBy.firstName} ${adjustment_edit.createdBy.middleName} ${goodsIssue.createdBy.lastName} (<fmt:formatDate value='${adjustment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${adjustment_edit.updatedBy.firstName} ${adjustment_edit.updatedBy.middleName} ${adjustment_edit.updatedBy.lastName} (<fmt:formatDate value='${adjustment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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