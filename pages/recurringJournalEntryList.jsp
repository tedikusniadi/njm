<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Recurring Journal Entry</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
	<%@ include file="/filter/recurringJournalEntryFilter.jsp"%>
	<%@ include file="/common/dialog.jsp"%>
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
				<td width="60%">Financial Accounting > Journal Entrys > Recurring Journal Entry</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"></h1>
						<h1 class="page-title">F42 - Recurring Journal Entry</h1>
						
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
										<a class="item-button-new" href="<c:url value='/page/recurringjournalentrypreadd.htm'/>"><span>New Entry</span></a>
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
						<thead>
                  		<tr>
							<th width="7%"><div style="width:40px"></div></th>
						  	<th width="18%">ID</th>
					  		<th width="8%">Day</th>
				  			<th width="28%">Name</th>
                   			<th width="9%">Entry Type</th>
				  			<th width="30%">Company</th>
						</tr>
                        </thead>
                        <tbody>
						<c:forEach var="journal" items="${recurringJournals}" varStatus="i" >
						<tr>
							<td class="tools">
                            	<c:if test="${access.edit}">
									<a class="item-button-edit" href="<c:url value='/page/recurringjournalentrypreedit.htm?id=${journal.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test="${access.delete}">
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/recurringjournalentrydelete.htm?id=${journal.id}'/>');"  title="Delete"><span>Delete</span></a>
                                </c:if>
							</td>
							<td><c:out value="${journal.code}"/></td>
							<td><c:out value='${journal.day}'/></td> 
							<td><c:out value="${journal.name}"/></td>
							<td><c:out value="${journal.entryType}"/></td>
							<td><c:out value="${journal.organization.firstName} ${journal.organization.middleName} ${journal.organization.lastName}"/></td>
						</tr>
						</c:forEach>
                        </tbody>
                        <tfoot>
						<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                        </tfoot>
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

</html>
