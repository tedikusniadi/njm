<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>"/>
<html>
    <head>
        <title>${title}</title>
        <%@ include file="/common/sirius-header.jsp"%>
        <%@ include file="/filter/bankReconciliationFilter.jsp"%>
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
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/bankreconciliationpreadd1.htm'/>"><span>New</span></a>
                                        </c:if>
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
							<th width="1%" height="21"><div style="width:45px"></div></th>
                          	<th width="12%">Code</th>
                            <th width="8%">Date</th>
                          	<th width="12%">Organisasi</th>
                          	<th width="12%">Bank Name</th>
                          	<th width="53%">Note</th>
						</tr>
						<c:forEach items="${reconciliations}" var="recon" varStatus="status" >
						<tr>
							<td class="tools">
                            	<c:if test="${access.edit}">
                                	<a class="item-button-edit" href="<c:url value='/page/bankreconciliationpreedit.htm?id=${recon.id}'/>"><span>Edit</span></a>
                                </c:if>
								<c:if test="${access.delete}">
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/bankreconciliationdelete.htm?id=${recon.id}'/>');"><span>Del</span></a>
								</c:if>
							</td>
							<td><c:out value="${recon.code}"/></td>
   							<td><fmt:formatDate value="${recon.date}" pattern="dd-MM-yyyy"/></td> 
							<td><c:out value="${recon.organization.name}"/></td>
							<td><c:out value="${recon.bankAccount.bankName}"/></td>
							<td><c:out value="${recon.note}"/></td>
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
