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
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/unitSalesOrderSubDealerFilter.jsp"%>
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
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="70%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/unitsalesordersubdealerpreaddone.htm'/>"><span>New SPK Sub Dealer</span></a>
                                        </c:if>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="30%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:45px"></div></th>
			  	  	  	  	<th width="12%">ID</th>
			  	  	  	  	<th width="8%">Date</th>
               	  	  	  	<th width="12%">Company</th>
               	  	  	  	<th width="12%">Subdealer</th>
               	  	  	  	<th width="12%">Source</th>
               	  	  	  	<th width="12%">Destination</th>
                          	<th width="20%">Note</th>
						</tr>
						<c:forEach items="${sales}" var="order">
						<tr>
							<td class="tools">
                                <a class="item-button-edit" href="<c:url value='/page/unitsalesordersubdealerpreedit.htm?id=${order.id}'/>" title="Edit"><span>Edit</span></a>
                                <c:if test='${access.delete}'>
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/unitsalesordersubdealerdelete.htm?id=${order.id}'/>');" title="Delete"><span>Del</span></a>
                                </c:if>
							</td>
							<td nowrap="nowrap"><c:out value='${order.code}'/></td>
							<td nowrap="nowrap"><fmt:formatDate value='${order.date}' pattern='dd-MM-yyyy'/></td> 
							<td nowrap="nowrap"><c:out value="${order.organization.name}"/></td>
							<td nowrap="nowrap"><c:out value="${order.subDealer.name}"/></td>
							<td nowrap="nowrap"><c:out value="${order.source.name}"/></td>
							<td nowrap="nowrap"><c:out value="${order.destination.name}"/></td>
                            <td><c:out value="${order.note}"/></td>
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
