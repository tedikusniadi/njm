<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP - Currency Management</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script type="text/javascript">
    	function step(action)
		{
			var page="1";
				
			if(action == "next")
				page="${filterCriteria.nextPage}";
			else if(action == "prev")
				page="${filterCriteria.prevPage}";
			else if(action == "last")
				page="${filterCriteria.totalPage}";					
				
			var url = "<c:url value='/page/exchangemanagementview.htm?page='/>"+page;

			window.location = url;
		}
    </script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>
	
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Currency Management > List </td>
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
						<h1 class="page-title">F14 - Currency Management</h1>
						<div class="clears">&nbsp;</div>
						<center>
							<strong>Default Currency :  </strong>
							<input type="text" value="${currency.symbol} - ${currency.name}" size="30" disabled/>
						</center>
						<div class="clears">&nbsp;</div>
                        <div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/exchangemanagementpreadd.htm' />"><span>New Rate</span></a>
                                        </c:if>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
				  		<tr>
				  			<th>From</th>
				  			<th>To</th>
				  			<th>Valid From</th>
				  			<th>Type</th>
							<th>Rate</th>
				  		</tr>
						<c:forEach items="${exchanges}" var="exchage">
						<tr>
 							<td>${exchage.from.symbol}</td>
 							<td>${exchage.to.symbol}</td>
 							<td><fmt:formatDate value="${exchage.validFrom}" pattern="dd-MM-yyyy"/></td>
							<td>${exchage.type}</td>
							<td><fmt:formatNumber value="${exchage.rate}" pattern=',##0.00000000'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
		<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>	
</div>
</body>
</html>
