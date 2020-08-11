<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Tax >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/invoiceTaxFilter.jsp"%>
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
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/invoicetaxpreadd.htm'/>"><span>New Invoice Tax</span></a>
                                        </c:if>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return 0;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="3%"><div style="width:20px"></div></th>
			  	  	  	  	<th width="12%">No</th>
		  	  	  	  	  <th width="29%">Company</th>
           	  	  	  	  <th width="25%">Customer</th>
           	  	  	  	  <th width="25%">Ref</th>
                          <th width="6%">Status</th>
						</tr>
						<c:forEach items="${taxes}" var="tax">
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
                               	  <a class="item-button-edit" href="<c:url value='/page/invoicetaxpreedit.htm?id=${tax.id}'/>"  title="Edit"><span>Edit</span></a>
                                </c:if>
							</td>
							<td><c:out value='${tax.code}'/></td>
							<td><c:out value="${tax.organization.firstName}"/> <c:out value="${tax.organization.middleName}"/> <c:out value="${tax.organization.lastName}"/></td>
							<td><c:out value="${tax.customer.firstName}"/> <c:out value="${tax.customer.middleName}"/> <c:out value="${tax.customer.lastName}"/></td>
							<td width="25%"><a href="<c:url value='/page/${tax.href}?id=${tax.refId}'/>">
					      		<c:out value='${tax.refCode}'/></a></td>
                      		<td width="6%" align="center">
<c:if test='${tax.enabled}'>OK</c:if>
                               	<c:if test='${!tax.enabled}'>Canceled</c:if>
                          </td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
						</tr>
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
<%@ include file="/common/dialog.jsp"%>
</html>
