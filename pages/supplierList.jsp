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
	<%@ include file="/filter/supplierFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>

						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/supplierpreadd.htm' />"><span><spring:message code="new"/></span></a>
							   			</c:if>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span><spring:message code="sirius.paging.filter"/></span></a>
										</div>
									</div>
								</td>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
								</tr>
							</table>
					  	</div>

                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                          	<th width="4%"><div style="width:20px"></div></th>
                            <th width="16%"><spring:message code="supplier.home.th.code"/></th>
                          	<th width="31%"><spring:message code="supplier.home.th.name"/></th>
                          	<th width="49%"><spring:message code="supplier.home.th.note"/></th>
                        </tr>
                        <c:forEach items="${suppliers}" var="supplier">
                        <tr>
                            <td class="tools">
                            	<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/supplierpreedit.htm?id=${supplier.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                            </td>
                            <td><c:out value="${supplier.code}" /></td>
                            <td><c:out value="${supplier.firstName} ${supplier.middleName} ${supplier.lastName}" /></td>
                            <td><c:out value="${supplier.note}" /></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <tr>
                        	<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
                        </tr>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>

</html>
