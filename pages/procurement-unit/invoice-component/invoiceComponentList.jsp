<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="unitinvoice.htmltitle"/></title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/manualInvoiceVerificationFilter.jsp"%>
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
				<td width="60%"><spring:message code="unitinvoice.breadcrumb"/></td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="unitinvoice.title"/></h1>
						<div class="clears">&nbsp;</div>

						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/unitinvoiceverificationcomponentpreadd.htm'/>"><span><spring:message code="new"/></span></a>
                                        </c:if>
									</div>
								</td>
							</tr>
							</table>
					  	</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="6%"><div style="width:40px"></div></th>
			  	  	  	  	<th width="20%">Name</th>
                            <th width="8%">Amount</th>
			  	  	  	  	<th width="35%">Currency</th>
    					</tr>
						<c:forEach items="${components}" var="manual">
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/unitinvoiceverificationcomponentpreedit.htm?id=${manual.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
							</td>
							<td><c:out value='${manual.name}'/></td>
                            <td><fmt:formatNumber value='${manual.amount}' pattern='#,##'/></td>
                            <td align="center">${manual.currency.symbol}</td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
