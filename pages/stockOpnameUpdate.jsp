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
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/stockopnameedit.htm'/>";
			document.editForm.submit();
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
							<a class="item-button-list" href="<c:url value='/page/stockopnameview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
							<a class="item-button-print" href="<c:url value='/page/stockopnameprint.htm?id=${opname_edit.id}'/>"><span>Print</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="opname_edit">
							<table width="100%" border="0">
							<tr>
                               	<td width="56%" valign="top" align="left">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="${opname_edit.code}" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input class="input-disbaled" disabled size="10" value="<fmt:formatDate value='${opname_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_edit.organization}'>
                                               	<form:option value='${opname_edit.organization.id}' label='${opname_edit.organization.firstName} ${opname_edit.organization.lastName} ${opname_edit.organization.middleName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_edit.facility}'>
                                               	<form:option value='${opname_edit.facility.id}' label='${opname_edit.facility.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
 									<td align="right">Product Category :</td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty opname_edit.productCategory}'>
                                                <form:option value='${opname_edit.productCategory.id}' label='${opname_edit.productCategory.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea path="reason" cols="55" rows="7"/></td>
								</tr>
								</table>
								</td>
                         		<td width="44%" valign="top">
								  	<table width="100%" style="border:none">
								  	<tr>
								  		<td valign="top">
								  			<fieldset>
								  				<legend><strong>Referensi</strong></legend>
								  					Journal Entry : <a href="<c:url value='/page/journalentrypreview.htm?id=${opname_edit.journalEntry.id}'/>">${opname_edit.journalEntry.code}</a>&nbsp;&nbsp;&nbsp;
		                                 	</fieldset>
		                                 </td>
		                             </tr>
		                         	 </table>
		                        </td>
                            </tr>
                            </table>
                            <br/>
                            <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                            <thead>
                            <tr>
                                <th width="12%">Grid</th>
                                <th width="15%">Product</th>
                                <th width="5%">On Hand</th>
                              	<th width="5%">Re-Count</th>
                                <th width="5%">UoM</th>
                                <th width="5%">Discre</th>
                                <th width="5%">Amount</th>
                                <th width="5%">Total</th>
                                <th width="30%">Note</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${opname_edit.items}' var='item' varStatus='status'>
                            <tr>
                                <td nowrap="nowrap"><strong><c:out value='${item.inventoryItem.grid.name}'/></strong></td>
                                <td nowrap="nowrap"><strong><c:out value='${item.inventoryItem.product.code}'/>&nbsp;<c:out value='${item.inventoryItem.product.name}'/></strong></td>
                                <td nowrap="nowrap"><strong><fmt:formatNumber value='${item.onHand}' pattern=',##0'/></strong></td>
                                <td nowrap="nowrap"><strong><fmt:formatNumber value='${item.opnamed}' pattern=',##0'/></strong></td>
                                <td nowrap="nowrap"><strong><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></strong></td>
                                <td nowrap="nowrap"><strong><fmt:formatNumber value='${item.opnamed - item.onHand}' pattern=',##0'/></strong></td>
                                <td nowrap="nowrap"><strong><fmt:formatNumber value='${item.amount}' pattern=',##0.00'/></strong></td>
                                <td nowrap="nowrap"><strong><fmt:formatNumber value='${(item.opnamed - item.onHand)*item.amount}' pattern=',##0.00'/></strong></td>
                              	<td><strong><c:out value='${item.note}'/></strong></td>
                            	<c:forEach items='${item.details}' var='detail'>
                            	<tr>
	                                <td>&nbsp;</td>
	                                <td nowrap="nowrap"><c:out value='${detail.serial}'/></td>
	                                <td nowrap="nowrap"><c:out value='${detail.serialExt1}'/></td>
	                                <td colspan="3"><c:out value='${detail.year}'/></td>
	                                <td><c:out value='${detail.note}'/></td>
	                            </tr>
                            	</c:forEach>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                            </table>
							</form:form>
						</div>
						<div class="info">Created by : ${opname_edit.createdBy.firstName} ${opname_edit.createdBy.middleName} ${opname_edit.createdBy.lastName} (<fmt:formatDate value='${opname_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${opname_edit.updatedBy.firstName} ${opname_edit.updatedBy.middleName} ${opname_edit.updatedBy.lastName} (<fmt:formatDate value='${opname_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>