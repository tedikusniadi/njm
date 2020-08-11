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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>

						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/stockopnamepreadd1.htm'/>"><span><spring:message code="new"/></span></a>
                                        </c:if>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="first"/></a> | <a href="javascript:step('prev');"><spring:message code="prev"/></a> | <spring:message code="page"/> <c:out value="${filterCriteria.page}"/> <spring:message code="of"/> <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="next"/></a> | <a href="javascript:step('last');"><spring:message code="last"/></a></td>
							</tr>
							</table>
					  	</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:45px"></div></th>
				  	  	  	<th width="12%">ID</th>
                            <th width="8%">Date</th>
				  	  	  	<th width="15%">Facility</th>
                   	  	  	<th width="60%">Category</th>
						</tr>
						<c:forEach items="${opnames}" var="op">
						<tr>
							<td class="tools">
								<c:if test='${access.add}'>
                                	<a class="item-button-edit" href="<c:url value='/page/stockopnamepreedit.htm?id=${op.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
							</td>
							<td nowrap="nowrap">${op.code}</td>
							<td nowrap="nowrap"><fmt:formatDate value='${op.date}' pattern='dd-MM-yyyy'/></td>
							<td nowrap="nowrap"><c:out value="${op.facility.name}"/></td>
							<td><c:out value="${op.productCategory.name}"/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first');"><spring:message code="first"/></a> | <a href="javascript:step('prev');"><spring:message code="prev"/></a> | <spring:message code="page"/> <c:out value="${filterCriteria.page}"/> <spring:message code="of"/> <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="next"/></a> | <a href="javascript:step('last');"><spring:message code="last"/></a></td>
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
