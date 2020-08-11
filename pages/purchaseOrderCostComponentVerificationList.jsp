<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PO Cost Component Verification >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/dialog.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	<%@ include file="/filter/poCostComponentVerificationFilter.jsp"%>
	<!-- /main menu -->

	<!-- tips & page navigator -->
	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">Financial Accounting > Accounting Payable > PO Cost Component Verification</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">F47 - PO Cost Component Verification</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
                        	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                            <tr>
                            <td width="30%" height="30" align="left" valign="middle">
                                <div class="toolbar-clean">
                                    <a class="item-button-new" href="<c:url value='/page/purchaseordercostcomponentverificationpreadd1.htm' />"><span>New Verification</span></a>
                                    <div dojoType="Toggler" targetId="filter">
                                        <a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
                                    </div>
                                </div>
                            </td>
                            <td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
                            </tr>
                        	</table>
					  	</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <th width="6%"><div style="width:44px;"></div></th>
                          	<th width="18%">ID</th>
                          	<th width="8%">Date</th>
                   	  	  	<th width="35%">Company</th>
                          	<th width="22%">Supplier</th>
                            <th width="20%">Amount</th>
                       	  	<th width="7%">Currency</th>
                        </tr>
                        <c:forEach items="${verifications}" var="verification">
                        <tr>
                            <td class="tools">
                            	<c:if test='${access.edit}'>
	                                <a class="item-button-edit"  href="<c:url value='/page/purchaseordercostcomponentverificationpreedit.htm?id=${verification.id}'/>"  title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test='${access.delete and empty verification.applications}'>
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/purchaseordercostcomponentverificationdelete.htm?id=${verification.id}'/>');" title="Delete"><span>Delete</span></a>
                                </c:if>
                            </td>
                            <td><c:out value="${verification.code}" /></td>
                            <td><fmt:formatDate value="${verification.date}" pattern='dd-MM-yyyy'/></td>
                            <td><c:out value="${verification.organization.firstName} ${verification.organization.middleName} ${verification.organization.lastName}" /></td>
                            <td><c:out value="${verification.supplier.firstName} ${verification.supplier.middleName} ${verification.supplier.lastName}" /></td>
                            <td><fmt:formatNumber value="${verification.amount+verification.tax}" pattern=',##0.00'/></td>
                            <td><c:out value="${verification.component.purchaseOrder.currency.symbol}" /></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->


</body>
<!-- END OF BODY -->
</html>
