<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/productconsumptionedit.htm'/>";
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
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productconsumptionview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="consumption_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="${consumption_edit.code}" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="15" value="<fmt:formatDate value='${consumption_edit.date}' pattern='dd-MM-yyyy'/>" class="input-disabled"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty consumption_edit.organization}'>
                                               	<form:option value='${consumption_edit.organization.id}' label='${consumption_edit.organization.firstName} ${consumption_edit.organization.lastName} ${consumption_edit.organization.middleName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Warehouse :</td>
									<td>
										<form:select id="warehouse" path="warehouse" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty consumption_edit.warehouse}'>
                                               	<form:option value='${consumption_edit.warehouse.id}' label='${consumption_edit.warehouse.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                                <th width="15%">Grid</th>
                                <th width="18%">Product</th>
                                <th width="10%">Quantity</th>
                                <th width="60%">UoM</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${consumption_edit.details}' var='detail'>
                            <tr>
                                <td><c:out value='${detail.grid.name}'/></td>
                            	<td><c:out value='${detail.product.name}'/></td>
                                <td><fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/></td>
                                <td><c:out value='${detail.product.unitOfMeasure.measureId}'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                            </tfoot>
                            </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>