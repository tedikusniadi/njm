<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PPH >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/pphFilter.jsp"%>
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
				<td width="60%">Financial Accounting > Account Receivable > Pph</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">F20 - PPH</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
					  
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="7%"><div style="width:40px"></div></th>
                   	  	  	<th width="9%">Entry Date</th>
                   	  	  	<th width="11%">Doc No</th>
	  	  	  	  	  	  	<th width="15%">Billing</th>
   	  	  	  	  	  	  	<th width="36%">Customer</th>
                            <th width="11%">PPH Amount</th>
                            <th width="11%">Billing Amount</th>
						</tr>
						<c:forEach items="${pphs}" var="adapter">
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/pphpreedit.htm?id=${adapter.pph.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test="${access.delete and adapter.pph.journalEntry.entryStatus == 'BATCHED'}">
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/pphdelete.htm?id=${adapter.pph.id}'/>');" title="Delete"><span>Delete</span></a>
                                </c:if>
							</td>
							<td><fmt:formatDate value="${adapter.pph.date}" pattern='dd-MM-yyyy'/></td> 
                            <td><c:out value='${adapter.pph.code}'/></td>
							<td><a href="<c:url value='/page/billingpreedit.htm?id=${adapter.billing.id}'/>"><c:out value="${adapter.billing.code}"/></a></td>
                            <td><c:out value="${adapter.billing.customer.firstName} ${adapter.billing.customer.middleName} ${adapter.billing.customer.lastName}"/></td>
                            <td><fmt:formatNumber value='${adapter.pph.amount}' pattern=',##0.00'/></td>
                            <td><fmt:formatNumber value='${adapter.totalLineAmount}' pattern=',##0.00'/></td>
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
