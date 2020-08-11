<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="plafondebit.htmltitle"/></title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/plafondebitFilter.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
			<td width="60%"><spring:message code="plafondebit.breadcrumb"/></td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title"><spring:message code="plafondebit.title"/></h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
                                	<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/plafondebitpreadd.htm' />"><span><spring:message code="new"/></span></a>
							   			</c:if>
                                        <div dojoType="Toggler" targetId="filter">
                                            <a class="item-button-search" href="javascript:return false;"><span><spring:message code="sirius.paging.filter"/></span></a>
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
                            <th width="16%"><spring:message code="code"/></th>
                            <th width="15%"><spring:message code="date"/></th>
                            <th width="15%"><spring:message code="facility"/></th>
                            <th width="15%"><spring:message code="bankaccount"/></th>
                          	<th width="15%"><spring:message code="amount"/></th>
                          	<th width="15%"><spring:message code="currency"/></th>
                        </tr>
                        <c:forEach items="${plafons}" var="data">
                        <tr>
                            <td class="tools">
                            	<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/plafondebitpreedit.htm?id=${data.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
								<c:if test='${access.delete}'>
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/plafondebitdelete.htm?id=${data.id}'/>')" title="Delete"><span>Delete</span></a>
                                </c:if>
                            </td>
                            <td>${data.code}</td>
                            <td><fmt:formatDate value='${data.date}' pattern='dd-MM-yyyy'/></td>
                            <td>${data.plafon.partyRelationship.fromRole.party.name}</td>
                            <td>${data.bankAccount.bankName}</td>
                            <td><fmt:formatNumber value="${data.money.amount}"/></td>
                            <td>${data.money.currency.name}</td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <tr><td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td></tr>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>