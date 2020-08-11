<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Category Accounting Schema >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/productcategoryaccountingschemaadd.htm'/>";
			document.addForm.submit();
		}
		
		function showcategory()
		{
			openpopup("<c:url value='/page/popupproductcategoryview.htm?target=category'/>");
		}
				
		function popup(target)
		{
				
			openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa=${categorySchema.accountingSchema.chartOfAccount.id}&target='/>"+target);
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
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Schema > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F13 - Accounting Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/accountingschemapreedit.htm?id=${categorySchema.accountingSchema.id}'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="categorySchema">
								<table width="100%" style="border:none">
                                <tr>
									<td width="33%" align="right" nowrap="nowrap">Accounting Schema :</td>
					  <td width="59%">
<form:select id="accountingSchema" path="accountingSchema" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${categorySchema.accountingSchema.id}' label='${categorySchema.accountingSchema.name}' />
										</form:select>
								  </td>
                                    <td width="8%">&nbsp;</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Product Category :</td>
									<td>
										<form:select id="category" path="category" cssClass="combobox-ext">
                                           	<c:if test='${not empty categorySchema.category}'>
                                               	<form:option value='${categorySchema.category.id}' label='${categorySchema.category.name}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:showcategory()" style="CURSOR:pointer;" title="Product Category" />
									</td>
                                    <td>&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
                                    <td>&nbsp;</td>
								</tr>
                                <tr><td colspan="3">&nbsp;</td></tr>
                                <tr>
                                	<td align="right"><strong>Sales GL Account</strong></td>
                                	<td colspan="2">&nbsp;</td>
                                </tr>
                                <c:forEach items="${categorySchema.accounts}" var="closing" varStatus="status">
                                <c:if test="${closing.closingAccount.closingAccountType.groupType == 'PRD_SALES'}">
                                <tr>
                                    <td align="right"><c:out value='${closing.closingAccount.closingAccountType.name}'/> : </td>
                              		<td>
                                        <form:select id="glaccount[${status.index}]" path="accounts[${status.index}].closingAccount.account" cssClass="combobox-ext">
                                            <option value="${closing.closingAccount.account.id}"><c:out value='${closing.closingAccount.account.code} ${closing.closingAccount.account.name}'/></option>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                    </td>							
                                    <td width="8%">&nbsp;</td>
                                </tr>
                                </c:if>
                                </c:forEach>
                                <tr><td colspan="3">&nbsp;</td></tr>
                                <tr>
                                	<td align="right"><strong>Procurement GL Account</strong></td>
                                	<td colspan="2">&nbsp;</td>
                                </tr>
                                <c:forEach items="${categorySchema.accounts}" var="closing" varStatus="status">
                                <c:if test="${closing.closingAccount.closingAccountType.groupType == 'PRD_PROCUREMENT'}">
                                <tr>
                                    <td align="right"><c:out value='${closing.closingAccount.closingAccountType.name}'/> : </td>
                              		<td>
                                        <form:select id="glaccount[${status.index}]" path="accounts[${status.index}].closingAccount.account" cssClass="combobox-ext">
                                            <option value="${closing.closingAccount.account.id}"><c:out value='${closing.closingAccount.account.code} ${closing.closingAccount.account.name}'/></option>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                    </td>							
                                    <td width="8%">&nbsp;</td>
                                </tr>
                                </c:if>
                                </c:forEach>
                                <tr><td colspan="3">&nbsp;</td></tr>
                                <tr>
                                	<td align="right"><strong>Inventory GL Account</strong></td>
                                	<td colspan="2">&nbsp;</td>
                                </tr>
                                <c:forEach items="${categorySchema.accounts}" var="closing" varStatus="status">
                                <c:if test="${closing.closingAccount.closingAccountType.groupType == 'PRODUCT'}">
                                <tr>
                                    <td align="right"><c:out value='${closing.closingAccount.closingAccountType.name}'/> : </td>
                              		<td>
                                        <form:select id="glaccount[${status.index}]" path="accounts[${status.index}].closingAccount.account" cssClass="combobox-ext">
                                            <option value="${closing.closingAccount.account.id}"><c:out value='${closing.closingAccount.account.code} ${closing.closingAccount.account.name}'/></option>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                    </td>							
                                    <td width="8%">&nbsp;</td>
                                </tr>
                                </c:if>
                                </c:forEach>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>

</div>
</body>
</html>