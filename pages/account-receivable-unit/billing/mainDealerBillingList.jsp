<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
	<%@ include file="/filter/mainDealerBillingFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
</head>

<body>

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

	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                            <tr>
                            	<td width="35%" height="30" align="left" valign="middle">															
                            		<div class="toolbar-clean">
	                                	<a class="item-button-new" href="<c:url value='/page/maindealerbillingpreaddone.htm'/>"><span>New Billing</span></a>
	                               		<div dojoType="Toggler" targetId="filter">
	                                   		<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
	                               		</div>
                           			</div>
                            	</td>
                            	<td width="65%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
                            </tr>
							</table>
					  	</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                          <th width="1%"><div style="width:45px"></div></th>
                          <th width="12%">ID</th>
                          <th width="8%">Date</th>
                          <th width="24%">Organization</th>
                          <th width="10%">Periode</th>
                          <th width="10%">Status</th>
                          <th width="35%">Amount</th>
                        </tr>
                        <c:forEach items="${billings}" var="billing">
                        <tr>
                             <td class="tools">
                                <c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/maindealerbillingpreedit.htm?id=${billing.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test="${access.delete and billing.amount == billing.unpaid}">
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/maindealerbillingdelete.htm?id=${billing.id}'/>');" title="Delete"><span>Delete</span></a>
                                </c:if>
                             </td>
                             <td><c:out value="${billing.code}" /></td> 
                             <td><fmt:formatDate value="${billing.date}" pattern="dd-MM-yyyy"/></td> 
                             <td><c:out value="${billing.organization.name}" /></td>
                             <td><c:out value="${billing.periode}" /></td>
                             <td><c:out value="${billing.status}" /></td>
                             <td><fmt:formatNumber value="${billing.unpaid}" pattern=',##0.00'/></td>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
