<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Tax >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/invoicetaxedit.htm'/>";
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
			<td width="60%">Financial Accounting > Account Receivable > Invoice Tax Management > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F22 - Invoice Tax Management</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/invoicetaxview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="tax_edit">
								<table width="100%" style="border:none">
								<tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${tax_edit.organization.id}' label='${tax_edit.organization.firstName} ${tax_edit.organization.middleName} ${tax_edit.organization.lastName}' />
										</form:select>
									</td>
								</tr>
                               	<tr>
									<td width="20%" nowrap="nowrap" align="right">Customer :</td>
								  	<td width="80%"><input class='input-disabled' size="50" value="${tax_edit.customer.firstName} ${tax_edit.customer.middleName} ${tax_edit.customer.lastName}" disabled/></td>
								</tr>
                               	<tr>
									<td width="20%" nowrap="nowrap" align="right">Reference:</td>
								  	<td width="80%"><a href="<c:url value='/page/${tax_edit.href}?id=${tax_edit.refId}'/>"><c:out value='${tax_edit.refCode}'/></a></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Status :</td>
								  	<td width="80%">
                                    	<form:radiobutton path='enabled' value='true' label='Ok'/>
                                       	<form:radiobutton path='enabled' value='false' label='Canceled'/>
                                    </td>
								</tr>
								</table>
							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${tax_edit.createdBy.firstName} ${tax_edit.createdBy.middleName} ${tax_edit.createdBy.lastName}'/> (<fmt:formatDate value='${clearing.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${tax_edit.updatedBy.firstName} ${tax_edit.updatedBy.middleName} ${tax_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${tax_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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