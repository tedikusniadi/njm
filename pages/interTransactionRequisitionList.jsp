<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
    <head>
        <title>Inter Transaction Requisition >> Home</title>
        <%@ include file="/common/sirius-header.jsp"%>
        <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>        
        <script type="text/javascript" src="assets/dialog.js"></script>
        <%@ include file="/filter/interTransactionRequisitionFilter.jsp"%>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter Transaction Requisition</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">F36 - Inter Transaction Requisition</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
										<a class="item-button-new" href="<c:url value='/page/intertransactionrequisitionpreadd.htm' />"><span>New Requisition</span></a>
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
							<th width="6%" height="20"><div style="width:40px"></div></th>
		  	  	  	  	  <th width="11%">ID</th>
           	  	  	  	  <th width="8%">Date</th>
		  	  	  	  	  	<th width="22%">From</th>
		  	  	  	  	  	<th width="23%">To</th>
                            <th width="12%">PIC</th>
                            <th width="12%">Approver</th>
	  	  	  	  	  	  <th width="6%">Amount</th>
						</tr>
						<c:forEach items="${requisitions}" var="requisition">
						<tr>
						 	<td class="tools">
                            	 <c:if test='${access.edit}'>
									<a class="item-button-edit" href="<c:url value='/page/intertransactionrequisitionpreedit.htm?id=${requisition.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test='${access.delete and !requisition.acknowledged}'>
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/intertransactionrequisitiondelete.htm?id=${requisition.id}'/>');" title="Delete"><span>Delete</span></a>
                                </c:if>
						 	</td>
						 	<td><c:out value='${requisition.code}'/></td>
                            <td><fmt:formatDate value='${requisition.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${requisition.from.firstName} ${requisition.from.middleName} ${requisition.from.lastName}'/></td>
							<td><c:out value='${requisition.to.firstName} ${requisition.to.middleName} ${requisition.to.lastName}'/></td>
                            <td><c:out value='${requisition.requisitioner.firstName} ${requisition.requisitioner.middleName} ${requisition.requisitioner.lastName}'/></td>
                            <td><c:out value='${requisition.approver.firstName} ${requisition.approver.middleName} ${requisition.approver.lastName}'/></td>
							<td><fmt:formatNumber value='${requisition.maxAmount}' pattern=',##0.00'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
					  	</table>
					  	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
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
