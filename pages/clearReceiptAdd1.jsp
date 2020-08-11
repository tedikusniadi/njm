<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Receipt >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
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
                <td width="60%">Financial Accounting > Accounting Receivables > Clear Receipt > Add</td>
                <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
            </tr>
        </table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						<h1 class="page-title"></h1>
						<h1 class="page-title">F25 - Clear Receipt</h1>

						<div class="clears">&nbsp;</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                       	  <th width="2%" height="20"><div style="width:20px"></div></th>
                          <th width="14%">ID</th>
                       	  <th width="8%">Date</th>
                       	  <th width="36%">Customer Name</th>
                          <th width="17%">Bank/Cash Account</th>
                       	  <th width="14%">Amount</th>
                       	  <th width="9%">Currency</th>
                        </tr>
                        <c:forEach items="${receipts}" var="receipt">
                        <tr>
                             <td class="tools">
                                <a class="item-button-edit" href="<c:url value='/page/clearreceiptpreadd2.htm?id=${receipt.id}'/>" title="Edit"><span>Edit</span></a>
                             </td>
                             <td><c:out value="${receipt.code}" /></td> 
                             <td><fmt:formatDate value="${receipt.date}" pattern="dd-MM-yyyy"/></td> 
                             <td><c:out value="${receipt.customer.firstName} ${receipt.customer.middleName} ${receipt.customer.lastName}" /></td>
                             <td><c:out value="${receipt.receiptInformation.bankAccount.bankName}" /></td>
                             <td><fmt:formatNumber value="${receipt.receiptInformation.amount}" groupingUsed='true'/></td>
                             <td><c:out value="${receipt.currency.symbol}" /></td>
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
