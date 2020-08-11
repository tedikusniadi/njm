<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Credit Memo >> Add</title>
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
                <td width="60%">Financial Accounting > Accounting Receivable > Credit Memo > Add</td>
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
						<h1 class="page-title">F30 - Credit Memo</h1>
						<div class="clears">&nbsp;</div>
                        
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                       		<th width="4%"><div style="width:20px"></div></th>
                          	<th width="20%">ID</th>
                       	  	<th width="13%">Date</th>
                       	  	<th width="14%">Amount</th>
                       	  	<th width="14%">Currency</th>
                        </tr>
                        <c:forEach items="${memoables}" var="memo">
                        <tr>
                             <td class="tools">
                                <a class="item-button-edit" href="<c:url value='/page/creditmemopreadd2.htm?memoable=${memo.memoable.id}&billing=${billing.id}'/>" title="Edit"><span>Edit</span></a>
                             </td>
                             <td><c:out value="${memo.memoable.code}" /></td> 
                             <td><fmt:formatDate value="${memo.memoable.date}" pattern="dd-MM-yyyy"/></td> 
                             <td><fmt:formatNumber value="${memo.amount}" pattern=',##0.00'/></td>
                             <td><c:out value="${billing.currency.symbol}"/></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
