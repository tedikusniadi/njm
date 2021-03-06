<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Payment >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
	<%@ include file="/filter/clearPaymentFilter.jsp"%>
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
                <td width="60%">Financial Accounting > Accounting Payable > Clear Payment</td>
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
						<h1 class="page-title">F28 - Clear Payment</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                            <tr>
                            	<td width="35%" height="30" align="left" valign="middle">															
                            		<div class="toolbar-clean">
                                		<a class="item-button-new" href="<c:url value='/page/clearpaymentpreadd1.htm'/>"><span>New Clear Payment</span></a>
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
                              <th width="6%" height="19"><div style="width:40px"></div></th>
                              <th width="18%">ID</th>
                              <th width="9%">Date</th>
                              <th width="30%">Supplier</th>
                              <th width="16%">Payment No</th>
                              <th width="13%">Amount</th>
                              <th width="8%">Currency</th>
                        </tr>
                        <c:forEach items="${clears}" var="clear">
                        <tr>
                             <td class="tools">
                             	<c:if test="${access.edit}">
                                	<a class="item-button-edit" href="<c:url value='/page/clearpaymentpreedit.htm?id=${clear.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                             	<c:if test="${access.delete}">
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/clearpaymentdelete.htm?id=${clear.id}'/>');" title="Del"><span>Del</span></a>
								</c:if>
                             </td>
                             <td><c:out value="${clear.code}" /></td> 
                             <td><fmt:formatDate value="${clear.date}" pattern="dd-MM-yyyy"/></td> 
                             <td><c:out value="${clear.payment.supplier.firstName} ${clear.payment.supplier.middleName} ${clear.payment.supplier.lastName}" /></td>
                             <td><c:out value="${clear.payment.code}" /></td>
                             <td><fmt:formatNumber value="${clear.payment.paymentInformation.amount}" pattern=',##0.00'/></td>
                             <td><c:out value="${clear.payment.currency.symbol}" /></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
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
</div>
<!-- /main containers -->
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
